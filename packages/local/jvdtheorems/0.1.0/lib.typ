#import "@preview/ctheorems:1.1.3": *
#import "@local/jvdlayout:0.1.0": headingfont, mathfont, regfont, sansfont


#let mythmbox(
  identifier,
  head,
  base: "heading",
  base_level: none,
  bodyfmt: it => it,
  experimental: false,
) = {
  let boxfmt(name, number, body, title: auto, ..blockargs_individual) = {
    name = if name != none [(#name)]
    if title == auto { title = head }
    if number != none { title += " " + number }
    let title-body = text(font: sansfont)[*#title* #name]
    body = bodyfmt(body)
    show: pad.with(top: 0.8em, bottom: 0em)
    show: block.with(
      breakable: false,
      width: 100%,
      stroke: {
        if experimental == true {
          (left: (thickness: 0.5pt, paint: black), top: 0.5pt)
        } else {
          0.5pt
        }
      },
      inset: 1.2em,
    )
    place(top, dx: -5pt, dy: -20pt, block(
      fill: white,
      inset: 4pt,
      title-body,
      width: {
        if experimental == true { 105% } else { auto }
      },
    ))
    body
  }
  thmenv(identifier, base, base_level, boxfmt).with(supplement: head)
}

#let theorem-settings = (
  base_level: 2,
  bodyfmt: it => text(style: "italic", it),
)


#let thmplain = thmbox.with(
  padding: (top: 0.5em, bottom: 0.5em),
  breakable: true,
  inset: (top: 0em, left: 0em, right: 0em),
  namefmt: name => text(font: sansfont)[(#name)],
  titlefmt: title => text(font: sansfont, weight: "bold")[#title],
)

#let theorem = mythmbox("theorem", "Stelling", ..theorem-settings)
#let property = mythmbox("property", "Eigenschap", ..theorem-settings)
#let lemma = mythmbox("lemma", "Lemma", ..theorem-settings)
#let definition = mythmbox("definition", "Definitie", base_level: 2)
#let algoritm = mythmbox(
  "algoritm",
  "Algoritme",
  base_level: 2,
  experimental: true,
)

#let note = thmplain("note", "Opmerking").with(numbering: none)
#let notation = thmplain("notation", "Notatie").with(numbering: none)
#let example = thmplain("example", "Voorbeeld", base_level: 2)
#let proof = thmproof(
  "proof",
  "Bewijs",
  inset: (
    x: 0em,
    top: 0em,
    bottom: 0em,
  ),
  padding: (top: 0em, bottom: 0.5em),
  titlefmt: it => text(weight: "bold", font: sansfont)[#it],
  namefmt: name => text(font: sansfont)[(#name)],
)
