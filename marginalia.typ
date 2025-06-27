#import "@local/math:0.1.0": *
#import "@preview/marginalia:0.2.2"
#show: marginalia.setup.with(
  inner: (far: 5mm, width: 15mm, sep: 5mm),
  outer: (far: 5mm, width: 15mm, sep: 5mm),
  top: 2.5cm,
  bottom: 2.5cm,
  book: false,
  clearance: 12pt,
)
#set page(margin: (right: 6.5cm), numbering: "1", number-align: right)

= Marginalia package test
#lorem(30)

#marginalia.note[#lorem(10)]
