#import "@preview/physica:0.9.5": * // useful math stuff
#import "@preview/cetz:0.4.0": canvas, draw, matrix, vector
#import "@preview/cetz-plot:0.1.2": chart, plot
#import "@preview/lovelace:0.3.0": * // algorithms
#import "@preview/marge:0.1.0": * // margin notes
#import "@local/jvdtheorems:0.1.0": *
#let sidenote = sidenote.with(numbering: "1", padding: 1.3em)

#let mathrules(body) = {
  show: thmrules
  set heading(numbering: "1.1")
  set text(size: 10pt, font: "New Computer Modern")
  show math.equation: set text(font: "New Computer Modern Math")
  show heading.where(level: 4): set heading(numbering: none)

  // Nicer emptyset symbol
  show math.equation: set text(features: ("cv01",))
  // slanted gteq and lteq
  show math.gt.eq: math.gt.eq.slant
  show math.lt.eq: math.lt.eq.slant
  // QED symbol not filled
  show math.qed: math.square
  // increase gap for cases
  set math.cases(gap: 1em)

  // prevent subscripts in inline mode from "dipping" too much
  show math.attach: it => {
    if it.base.func() == math.lr {
      let attachments = it.fields()
      _ = attachments.remove("base")
      it.base
      math.attach(sym.zws, ..attachments)
    } else {
      it
    }
  }

  // Line numbering for code blocks
  let style-number(number) = text(black)[#number]
  show raw.where(block: true): it => grid(
    columns: 2,
    align: (right, left),
    gutter: 0.5em,
    ..it
      .lines
      .enumerate()
      .map(((i, line)) => (style-number(i + 1), line))
      .flatten()
  )


  // Numbered equations
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


  // list/enum envs
  set list(indent: 10pt)
  set enum(indent: 10pt, numbering: "(1)")
  // try to center math equations in list envs (hacky)
  // show math.equation.where(block: true): eq => {
  //   block(width: 93%, inset: 0pt, align(center, eq))
  // }


  body
}



// Font for calligraphic letters
#let cal(it) = math.class(
  "normal",
  box({
    show math.equation: set text(
      font: "Ralph Smiths Formal Script Companion",
      // stylistic-set: 3,
    )
    $#math.cal(it)$
  })
    + h(0pt),
)


/*
  Operators
*/
// Algemeen
#let sgn = math.op("sgn")
#let ggd = math.op("ggd")
#let kgv = math.op("kgv")


// Kansrekenen en Statistiek
#let Var = math.op("Var")
#let Uni = math.op("Uni")
#let Cov = math.op("Cov")
#let Corr = math.op("Corr")
#let Ber = math.op("Ber")
#let med = math.op("med")
#let mad = math.op("mad")
#let cov = math.op("cov")
#let corr = math.op("corr")
#let MSE = math.op("MSE")
#let BI = math.op("BI")
#let Bin = math.op("Bin")

// Lineaire Algebra
#let ord = math.op("ord")
#let ker = math.op("ker")
#let im = math.op("im")
#let Hom = math.op("Hom")
#let Id = math.op("Id")

// Analyse
#let diam = math.op("Diam")


#let mathlayout(doc) = {
  show heading: set text(font: "New Computer Modern Sans")
  set page(margin: (outside: 6.5cm))

  doc
}
