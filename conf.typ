#let numberingH(c) = {
  return numbering(c.numbering, ..counter(heading).at(c.location()))
}

#let currentH(level: 1) = {
  let elems = query(selector(heading.where(level: level)).after(here()))

  if elems.len() != 0 and elems.first().location().page() == here().page() {
    return [#numberingH(elems.first()) #elems.first().body]
  } else {
    elems = query(selector(heading.where(level: level)).before(here()))
    if elems.len() != 0 {
      return [#numberingH(elems.last()) #elems.last().body]
    }
  }
  return ""
}

#set page(
  paper: "a4",
  numbering: "1",
  header: context {
    let current = here().page()
    if current == 1 [] else if calc.even(current) [
      #current
      #h(1fr)
      #text(
        upper(currentH()),
        size: 10pt,
        font: "Latin Modern Sans",
      )
    ] else [
      #text(
        upper(currentH(level: 2)),
        size: 10pt,
        font: "Latin Modern Sans",
      )
      #h(1fr)
      #current
    ]
  },
  footer: context {
    let current = here().page()
    if current == 1 [
      Junot Van Dijck
      #h(1fr)
      #current
    ] else []
  },
)
