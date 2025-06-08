#import "@local/jvdtheorems:0.1.0": *
#import "@local/jvdlayout:0.1.0": *

#import "@preview/physica:0.9.5": *
#import "@preview/cetz:0.3.4": canvas, draw, matrix, vector
#import "@preview/lovelace:0.3.0": *

#import "@preview/marge:0.1.0": sidenote
#let sidenote = sidenote.with(numbering: "1", padding: 1em)


#let ggd = math.op("ggd")
#let kgv = math.op("kgv")
#let ord = math.op("ord")
#let ker = math.op("ker")
#let im = math.op("im")
#let Hom = math.op("Hom")
#let Id = math.op("Id")


#let part(name) = align(center + horizon, text(
  size: 30pt,
  font: sansfont,
  weight: "regular",
)[#upper(name) #pagebreak()])

#let appendix(body) = {
  set heading(numbering: "A.1", supplement: [Appendix])
  show math.equation: it => {
    if it.has("label") {
      math.equation(
        block: true,
        numbering: n => {
          numbering("(A.1)", counter(heading).get().first(), n)
        },
        it,
      )
    } else {
      it
    }
  }
  context {
    if (
      query((heading.where(level: 1)).before(here())).last().supplement
        != [Appendix]
    ) {
      counter(heading).update(0)
    }
  }
  body
}


#let template(
  title: none,
  titlepage: false,
  author: none,
  toc: false,
  doc,
) = {
  show: thmrules
  show: textrules
  show: tocrules

  let titletext = text(size: 30pt, font: sansfont)[
    #upper(title) \
    #text(size: 14pt)[#upper(author)]
  ]
  if titlepage == true {
    set page(margin: (x: 4cm))
    show heading.where(level: 1): it => {
      text(font: headingfont, weight: "regular", size: 25pt)[#upper(it) #v(
          0.5em,
        )]
    }
    align(center + horizon, titletext)
    pagebreak()
    counter(page).update(1)
    set page(numbering: "i")
    if toc == true { outline() }
    pagebreak(weak: true, to: "even")
  } else {
    align(center + top, titletext)
    if toc == true { outline() }
  }

  // set page(numbering: "1")

  counter(page).update(1)

  show: layout

  doc
}
