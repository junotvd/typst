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

#let theorem-settings-it = (
  base_level: 1,
  bodyfmt: it => text(style: "italic", it),
)
#let theorem-settings = (
  base_level: 3,
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
#let proposition = mythmbox("proposition", "Propositie", ..theorem-settings)
#let lemma = mythmbox("lemma", "Lemma", ..theorem-settings)
#let definition = mythmbox("definition", "Definitie", ..theorem-settings)
#let gevolg = mythmbox("gevolg", "Gevolg", ..theorem-settings)
#let algoritm = mythmbox(
  "algoritm",
  "Algoritme",
  ..theorem-settings,
  experimental: true,
)

#let note = thmplain("note", "Opmerking").with(numbering: none)
#let notation = thmplain("notation", "Notatie").with(numbering: none)
#let example = thmplain("example", "Voorbeeld", ..theorem-settings).with(
  breakable: true,
)
#let question = thmplain("question", "Vraag").with(numbering: none)
#let proof = thmproof(
  "proof",
  "Bewijs",
  inset: (
    x: 0em,
    top: 0em,
    bottom: 0em,
  ),
  padding: (top: 0em, bottom: 2.0em),
  titlefmt: it => text(weight: "bold", font: sansfont)[#it],
  namefmt: name => text(font: sansfont)[(#name)],
)
#let solution = thmproof(
  "solution",
  "Oplossing",
  inset: (
    x: 0em,
    top: 0em,
    bottom: 0em,
  ),
  padding: (top: 0em, bottom: 2.0em),
  titlefmt: it => text(weight: "bold", font: sansfont)[#it],
  namefmt: name => text(font: sansfont)[(#name)],
)
// #show: solution.with(thm-qed-symbol: $diamond$)
