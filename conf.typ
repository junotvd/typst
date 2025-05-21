#let conf(
  title: none,
  subtitle: none,
  author: none,
  authors: (),
  date: none,
  doc,
) = {
  set text(
    size: 12pt,
    font: "Latin Modern Roman",
    lang: "nl",
  )

  set heading(numbering: "1.1")

  show outline: it => {
    state("in-outline").update(true)
    it
    state("in-outline").update(false)
  }

  let heading_font = "Latin Modern Roman"

  show heading: it => [
    #set text(font: heading_font)
    #it
  ]

  show heading.where(depth: 1): it => {
    if not state("in-outline", false).get() {
      pagebreak(weak: true)
    }
    text(size: 25pt)[#it #v(25pt)]
  }
  show heading.where(level: 2): it => {
    set text(size: 18pt)
    it
  }
  show heading.where(level: 3): it => {
    set text(size: 15pt)
    it
  }

  // https://stackoverflow.com/questions/78272599/show-current-heading-number-and-body-in-page-header
  let numberingH(c) = {
    return numbering(c.numbering, ..counter(heading).at(c.location()))
  }

  let currentH(level: 1) = {
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

  let show_date = if date == none [#(
      datetime.today().display("[day] [month repr:long] [year]")
    )] else [#date]

  set page(
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
        #text(
          upper(show_date),
          font: "Latin Modern Sans",
          size: 10pt,
        )
        #h(1fr)
        #current
      ] else []
    },
  )

  let show_title = {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    text(size: 26pt, font: heading_font)[#title]
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 24pt,
      ..authors.map(author => [
        #author.name \
        #author.affiliation \
        #link("mailto:" + author.email)
      ]),
    )
    v(15pt)
  }

  align(center)[#show_title]

  set align(left)
  doc
}
