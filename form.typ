#let conf(doc) = {
  set text(
    size: 12pt,
    font: "KpRoman",
  )
  set page(
    paper: "a4",
    numbering: "1",
    margin: 1.5cm,
  )
  show math.equation: set text(font: "KpMath", size: 9pt)
  show heading: it => context {
    block(
      grid(
        columns: (auto, 1fr),
        align: horizon + center,
        column-gutter: 5pt,
        text(font: "KpSans")[#upper(it)], line(length: 100%, stroke: 1pt),
      ),
    )
  }

  doc
}
