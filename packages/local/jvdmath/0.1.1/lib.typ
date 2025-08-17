#import "@local/math:0.1.2": *

#let mathpaper(
  title: [Title],
  subtitle: [Subtitle],
  subsubtitle: [Subsubtitle],
  author: [Author],
  date: none,
  body,
) = {
  // TOC
  show outline.entry.where(level: 1): it => {
    text(font: sansfont, weight: "bold", it)
  }

  show outline.entry.where(level: 1): set outline.entry(fill: box(
    height: 3pt,
    line(length: 100%, stroke: 0.0pt),
  ))


  set text(lang: "nl", hyphenate: true)
  // set par(first-line-indent: 1.5em, justify: true, spacing: 0.65em)
  set par(justify: true)
  show heading: set text(font: "New Computer Modern Sans")
  show: mathrules
  show math.equation.where(block: true): block.with(inset: 1em)


  set text(hyphenate: false)
  set page(margin: (inside: 5cm, y: 4cm))

  show heading.where(level: 1): it => {
    pagebreak(weak: true, to: "odd")
    [#counter(heading).display(it.numbering)\ \ #it.body]
    line(length: 100%, stroke: 0.6pt)
    v(2em)
  }

  show heading: it => {
    it
    v(1em)
  }

  set enum(indent: 0em, spacing: 1.2em)


  table(
    align: left,
    gutter: 15pt,
    stroke: none,
    columns: (1fr, 1fr),
    table.cell(colspan: 2)[#text(
        size: 25pt,
        font: "New Computer Modern Sans",
      )[#upper(title)]],
    [],
    text(size: 25pt, font: "New Computer Modern Sans", weight: "bold")[#upper(
        subtitle,
      )],
    table.cell(colspan: 2)[#text(
        font: "New Computer Modern Sans",
        weight: "bold",
        size: 12pt,
        upper(subsubtitle),
      )],

    table.hline(stroke: 2pt),
    v(5pt),
    v(5pt),
    [],
    text(size: 15pt, font: "New Computer Modern Sans", weight: "bold")[#upper(
        author,
      )],
  )
  set align(left)

  set page(margin: (inside: 2.5cm, outside: 6.5cm, y: 1.5cm))

  body
}
