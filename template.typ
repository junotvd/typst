#import "@preview/physica:0.9.5": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.4": canvas, draw, matrix, vector


#let sansfont = "Tex Gyre Heros"
#let regfont = "Tex Gyre Termes"
#let mathfont = "New Computer Modern Math"


#let ggd = math.op("ggd")
#let kgv = math.op("kgv")
#let ord = math.op("ord")
#let ker = math.op("ker")
#let im = math.op("im")
#let Hom = math.op("Hom")
#let Id = math.op("Id")


#let theorem = thmbox(
  "theorem",
  "Stelling",
  base_level: 2,
  // fill: rgb("#eeffee"),
  stroke: (
    thickness: 0.3pt,
    paint: black,
  ),
).with(radius: 0em)
#let definition = thmbox(
  "definition",
  "Definitie",
  base_level: 2,
  inset: (
    x: 1.2em,
    top: 1em,
    bottom: 1em,
  ),
  stroke: (
    thickness: 0.3pt,
    paint: black,
  ),
).with(radius: 0em)

#let note = thmplain(
  "note",
  "Opmerking",
  // titlefmt: it => {
  //   text(weight: "bold", font: "KpRoman")[#it]
  // },
  inset: (
    x: 0em,
  ),
).with(numbering: none)
#let notation = thmplain("notation", "Notatie").with(numbering: none)
#let example = thmplain("example", "Voorbeeld", titlefmt: strong, base_level: 2)
#let proof = thmproof(
  "proof",
  "Bewijs",
  inset: (
    x: 0em,
    top: 0em,
    bottom: 1em,
  ),
  padding: (top: 0em, bottom: 0.5em),
  titlefmt: it => { text(weight: "semibold", font: regfont)[#it] },
)


#let part(name) = align(center + horizon, text(
  size: 30pt,
  font: sansfont,
  weight: "regular",
)[#upper(name) #pagebreak()])

#let template(
  title: none,
  titlepage: false,
  author: none,
  toc: false,
  doc,
) = {
  show: thmrules

  set text(size: 10pt, font: regfont, lang: "nl")
  show math.equation: set text(font: mathfont)
  set par(justify: true)


  set heading(numbering: "1.1")
  show heading: it => context {
    if it.level != 1 {
      block(grid(
        columns: (auto, 1fr),
        align: horizon + center,
        column-gutter: 5pt,
        align(left + horizon, text(font: sansfont, weight: "regular")[#upper(
            it,
          )]),
        line(length: 100%, stroke: 1pt),
      ))
    } else [
      #align(top + left)[#v(7em) #text(
          font: sansfont,
          weight: "regular",
          size: 30pt,
        )[#upper(it)] #v(2em)]
    ]
  }
  show heading.where(level: 2): it => { text(size: 15pt)[#it] }
  show heading.where(level: 3): it => { text(size: 12pt)[#it] }


  let numberingH(c) = {
    if type(c.numbering) == int or type(c.numbering) == str {
      return numbering(c.numbering, ..counter(heading).at(c.location()))
    }
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
      if (
        not query(heading.where(level: 1).after(here()))
          .map(h => h.location().page())
          .at(0, default: 0)
          == here().page()
      ) {
        if calc.even(current) [
          #current
          #h(1fr)
          #text(font: sansfont, size: 10pt, style: "oblique")[#upper(currentH(
              level: 2,
            ))]
        ] else {
          if titlepage == true and current == 1 [] else [
            #text(font: sansfont, size: 10pt, style: "oblique")[#upper(
                currentH(),
              )]
            #h(1fr)
            #current
          ]
        }
      }
    },
    footer: context {
      if (
        query((heading.where(level: 1)).before(here()))
          .map(h => (
            h.location().page() == here().page()
          ))
          .at(-1, default: 0)
          == true
      ) { here().page() }
    },
  )

  align(
    if titlepage == true { center + horizon } else { center + top },
    text(size: 30pt, font: sansfont)[
      #upper(title) \
      #text(size: 14pt)[#upper(author)]
      #if titlepage == true { pagebreak() } else { v(1em) }
    ],
  )

  if toc == true [ #outline() #pagebreak(weak: true) ]

  doc
}
