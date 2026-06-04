#let serif = "Literata"
#let sans = "Roboto"
#let blauw1 = rgb(24, 69, 124)
#let blauw2 = rgb(0, 31, 66)
#let grijs = rgb(81, 81, 81)
#let wit = rgb(254, 247, 234)
#let wit2 = rgb(244, 238, 226)


#import "@preview/droplet:0.3.1": dropcap
#let dropcap = dropcap.with(height: 3, gap: 0.5em, transform: it => {
  text(fill: blauw1, it)
})

#let kader(title: "De essentie", body) = block(
  above: 2em,
  below: 2em,
  width: 100%,
  fill: wit2,
  inset: 1em,
)[
  #text(fill: blauw2, weight: "bold", size: 13pt, title)
  #v(0pt)
  #body
]

#let meer(title: [Lees meer], body) = block(
  above: 2.0em,
  below: 2.0em,
  width: 100%,
  inset: (left: 10pt, top: 2pt),
  stroke: (left: 1.3pt + blauw2),
)[
  #text(font: sans, size: 7pt, weight: "bold")[#upper(title)] \
  #body
]

#let intro(body) = text(size: 12pt, fill: blauw1, weight: "bold", body)

#let detijd(body) = {
  show figure.caption: set text(font: sans)
  show link: link => underline(stroke: 0.3pt + blauw2)[#text(
    fill: blauw1,
    link,
  )]
  set text(
    lang: "nl",
    region: "BE",
    fill: grijs,
    font: serif,
  )
  set par(justify: true)
  set page(fill: wit, margin: (x: 4cm))
  show heading: set text(fill: blauw2)
  show heading.where(level: 1): block.with(above: 1.5em, below: 1.5em)
  show heading.where(level: 2): block.with(above: 1.5em, below: 1.5em)

  set table(stroke: 0.5pt + grijs)

  show raw.where(block: true): kader.with(title: none)
  show raw.where(block: false): box.with(
    fill: wit2,
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
  )
  show raw.where(lang: none, block: false): set text(fill: blauw1)
  show raw: it => {
    show text.where(fill: rgb("#4b69c6")): set text(fill: blauw1)
    it
  }

  body
}
