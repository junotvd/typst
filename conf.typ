#let conf(title, subtitle, author, date, doc) = {
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

  show heading: it => [
    #set text(font: "Latin Modern Sans")
    #it
  ]

  show heading.where(depth: 1): it => {
    if not state("in-outline", false).get() {
      pagebreak(weak: true)
    }
    text(size: 25pt)[#it]
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
        #author
        #h(1fr)
        #current
      ] else []
    },
  )

  let show_date = if date == [] [#(
      datetime.today().display("[day] [month repr:long] [year]")
    )] else [#date]

  let show_title_1 = [
    #align(
      center,
      [
        #text(size: 26pt, font: "Latin Modern Sans")[*#title*] \
        #v(2pt)
        #text(size: 16pt)[#author] \
        #v(2pt)
        #text(size: 14pt)[#show_date]
      ],
    )
    #v(15pt)
  ]
  let show_title_2 = [
    #align(
      center,
      [
        #text(size: 26pt, font: "Latin Modern Sans")[*#title*] \
        #v(2pt)
        #text(size: 14pt, font: "Latin Modern Sans")[*#subtitle*] \
        #v(6pt)
        #text(size: 18pt)[#author] \
        #v(6pt)
        #text(size: 14pt)[#show_date]
      ],
    )
    #v(15pt)
  ]

  if subtitle == [] [#show_title_1] else [#show_title_2]
  doc
}

#show: doc => conf(
  [Algemene Natuurkunde II],
  [Elektromagnetisme],
  // [],
  [Junot Van Dijck],
  [],
  doc,
)

#outline()

#lorem(20)
= Level 1
== Level 2
=== Level 3
==== Level 4
#lorem(100)
