#import "@preview/physica:0.9.5": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.4": canvas, draw, matrix, vector
#import "@preview/lovelace:0.3.0": *
#import "@preview/zebraw:0.5.5": *
#show: zebraw
#import "@preview/marginalia:0.1.4" as marginalia: note, wideblock


#let headingfont = "Tex Gyre Heros"
#let sansfont = "New Computer Modern Sans"
#let regfont = "New Computer Modern"
#let mathfont = "New Computer Modern Math"


#let ggd = math.op("ggd")
#let kgv = math.op("kgv")
#let ord = math.op("ord")
#let ker = math.op("ker")
#let im = math.op("im")
#let Hom = math.op("Hom")
#let Id = math.op("Id")

#let mythmbox(
  identifier,
  head,
  ..blockargs,
  supplement: auto,
  padding: (top: 0.8em, bottom: 0em),
  namefmt: x => [(#x)],
  titlefmt: strong,
  bodyfmt: x => x,
  separator: [#h(0.1em):#h(0.2em)],
  base: "heading",
  base_level: none,
) = {
  if supplement == auto {
    supplement = head
  }
  let boxfmt(name, number, body, title: auto, ..blockargs_individual) = {
    if not name == none {
      name = [ #namefmt(name)]
    } else {
      name = []
    }
    if title == auto {
      title = head
    }
    if not number == none {
      title += " " + number
    }
    title = titlefmt(title)
    body = bodyfmt(body)
    pad(..padding, block(
      breakable: false,
      fill: none,
      width: 100%,
      radius: 0pt,
      stroke: (thickness: 0.5pt, paint: black),
      inset: 1.2em,
      place(top, dx: -5pt, dy: -20pt, block(
        fill: white,
        inset: (x: 5pt, y: 5pt),
        stroke: 0pt,
      )[
        #text(font: sansfont)[*#title* #name]
      ])
        + body,
    ))
  }
  return thmenv(identifier, base, base_level, boxfmt).with(
    supplement: supplement,
  )
}

#let thmplain = thmbox.with(
  padding: (top: 0.5em, bottom: 0.5em),
  breakable: true,
  inset: (top: 0em, left: 0em, right: 0em),
  namefmt: name => text(font: sansfont)[(#name)],
  titlefmt: title => text(font: sansfont, weight: "bold")[#title],
)

#let theorem = mythmbox(
  "theorem",
  "Stelling",
  base_level: 2,
  bodyfmt: it => text(style: "italic", it),
)
#let property = mythmbox(
  "property",
  "Eigenschap",
  base_level: 2,
  bodyfmt: it => text(style: "italic", it),
)
#let lemma = mythmbox("lemma", "Lemma", base_level: 2, bodyfmt: it => text(
  style: "italic",
  it,
))
#let definition = mythmbox("definition", "Definitie", base_level: 2)
#let algoritm = mythmbox("algoritm", "Algoritme", base_level: 2)

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


#let part(name) = align(center + horizon, text(
  size: 30pt,
  font: sansfont,
  weight: "regular",
)[#upper(name) #pagebreak()])

#let appendix(body) = {
  set heading(numbering: "1.A.1", supplement: [Appendix])
  context { counter(heading).update((counter(heading).get().first(), 0)) }
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

  set text(size: 10pt, font: regfont, lang: "nl")
  show math.equation: set text(font: mathfont)
  set par(justify: true)

  let list_config = (
    indent: 5pt,
    spacing: 10pt,
    tight: false,
  )
  set enum(numbering: "(a.1)", ..list_config)
  set list(..list_config)
  show math.equation.where(block: true): eq => {
    block(width: 93%, inset: 0pt, align(center, eq))
  }

  show enum: it => block(it)

  show heading: it => block({
    set par(justify: false)
    // set text(hyphenate: true)
    let headingtext(body) = text(
      font: headingfont,
      size: {
        if it.level == 2 {
          15pt
        } else if it.level == 3 {
          12pt
        } else {
          10pt
        }
      },
      weight: "regular",
      upper(body),
    )
    if it.level != 1 {
      v(1em)
      grid(
        columns: (auto, 1fr),
        {
          if it.numbering != none {
            headingtext(counter(heading).display(it.numbering) + " ")
          }
        },
        {
          h(2pt)
          headingtext(it.body)
          h(5pt)
          box(
            width: 1fr,
            height: {
              if it.level == 2 {
                6pt
              } else { 4.5pt }
            },
            line(length: 100%),
          )
        },
      )
      v(1em)
    } else {
      align(top + left, {
        v(7em)
        text(font: headingfont, weight: "regular", size: 30pt, upper(it))
        v(2em)
      })
    }
  })

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    it
  }
  set heading(numbering: "1.1")

  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }

  show math.equation: it => {
    if it.has("label") {
      math.equation(
        block: true,
        numbering: n => {
          numbering("(1.1)", counter(heading).get().first(), n)
        },
        it,
      )
    } else {
      it
    }
  }

  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(el.location(), numbering(
        "(1.1)",
        counter(heading).at(el.location()).at(0),
        counter(math.equation).at(el.location()).at(0) + 1,
      ))
    } else {
      it
    }
  }

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

  let config = (
    inner: 5.0cm,
    outer: 2.5cm,
  )
  marginalia.configure(
    inner: (far: 5mm, width: 4.5cm, sep: 0mm),
    outer: (far: 5mm, width: 2.5cm, sep: 0mm),
    book: true,
  )

  set page(
    paper: "a4",
    numbering: "1",
    // ..marginalia.page-setup(..config),
    margin: {
      if { context here().page() } == 1 {
        0.5cm
      } else {
        (inside: 5.0cm, outside: 2.5cm)
      }
    },
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

  show outline.entry.where(level: 1): it => {
    text(font: headingfont)[#upper(it)]
  }
  show outline.entry.where(level: 1): set outline.entry(fill: box(
    height: 3pt,
    line(length: 100%, stroke: 0.7pt),
  ))

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
