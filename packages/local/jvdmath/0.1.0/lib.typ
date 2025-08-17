#import "@local/math:0.1.2": *

#let mathpaper(body) = {
  // TOC
  show outline.entry.where(level: 1): it => {
    text(font: sansfont, weight: "bold", it)
  }

  show outline.entry.where(level: 1): set outline.entry(fill: box(
    height: 3pt,
    line(length: 100%, stroke: 0.0pt),
  ))


  set text(lang: "nl", hyphenate: true)
  set par(justify: true)
  show heading: set text(font: "New Computer Modern Sans")
  show: mathrules
  body
}
