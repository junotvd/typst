#import "@preview/physica:0.9.5": *
#import "@preview/theoretic:0.2.0" as theoretic: proof, qed, theorem
#import "@preview/wrap-it:0.1.1": *
#import "@preview/glossarium:0.5.9": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/cetz:0.4.1": *
#import "@preview/cetz-plot:0.1.2"
// #import "@preview/lilaq:0.4.0" as lq


/*
  Theorems
*/
// Otherwise, references won't work.
//#show ref: theoretic.show-ref

// set up your needed presets
#let theorem = theorem.with(
  supplement: "Stelling",
  fmt-prefix: (s, n, t) => {
    text(font: "CMU Bright", weight: "bold")[#s #n]
    if t != none {
      h(3pt)
      text(font: "CMU Bright")[(#t)]
      h(1em)
    } else { h(1em) }
  },
  block-args: (
    // stroke: (left: 1.0pt),
    inset: (y: 5pt),
  ),
)

#let proof = proof.with(
  supplement: "Bewijs",
  fmt-prefix: (s, n, t) => {
    text(font: "CMU Bright", weight: "bold")[#s #n]
    if t != none {
      h(3pt)
      text(font: "CMU Bright")[(#t)]
      h(1em)
    } else { h(1em) }
  },
  // block-args: (
  //   stroke: (left: 2.5pt),
  //   inset: (left: 7pt, y: 5pt),
  // ),
)
#let solution = proof.with(supplement: "Oplossing")

#let lemma = theorem.with(supplement: "Lemma")
#let example = theorem.with(supplement: "Voorbeeld")
#let definition = theorem.with(supplement: "Definitie")
#let question = theorem.with(supplement: "Vraag")
#let exercise = theorem.with(supplement: "Oefening")

#let note = theorem.with(supplement: "Opmerking", number: none)


/*
  Operators
*/
// Algemeen
#let sgn = math.op("sgn")
#let bgtan = math.op("Bgtan")
#let bgsin = math.op("Bgsin")
#let bgcos = math.op("Bgcos")
#let bgtan = math.op("Bgtan")
#let bgcot = math.op("Bgcot")
#let bgsec = math.op("Bgsec")
#let bgcsc = math.op("Bgcsc")

// Algebraïsche structuren
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
#let adj = math.op("adj")
#let vct = math.op("vct")
#let span = math.op("span")

// Analyse
#let diam = math.op("Diam")

// Calculus
#let grad = $nabla$
#let div = $nabla dot.c$
#let curl = $nabla times$
#let laplacian = $nabla^2$

// Numerieke wiskunde
#let fl = math.op("fl")


#let math-rules(body) = {
  show ref: theoretic.show-ref
  // emptyset symbol
  show math.equation: set text(features: ("cv01",))
  // slanted gteq and lteq
  show math.gt.eq: math.gt.eq.slant
  show math.lt.eq: math.lt.eq.slant
  // QED symbol not filled
  show math.qed: math.square
  // increase gap for cases
  set math.cases(gap: 1em)

  // more spacing around dot symbol
  show math.dots.h.c: math.space.hair + math.dots.h.c + math.space.hair
  // more spaced out matrices
  set math.mat(column-gap: 10pt, row-gap: 6pt)

  // numbered equations
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }
  show math.equation: it => {
    if it.has("label") {
      math.equation(
        block: true,
        numbering: n => {
          if heading.numbering != none {
            numbering("(1.1)", counter(heading).get().first(), n)
          } else {
            numbering("(1)", n)
          }
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
      if heading.numbering != none {
        link(el.location(), numbering(
          "(1.1)",
          counter(heading).at(el.location()).at(0),
          counter(math.equation).at(el.location()).at(0) + 1,
        ))
      } else {
        link(el.location(), numbering(
          "(1)",
          counter(math.equation).at(el.location()).at(0) + 1,
        ))
      }
    } else {
      it
    }
  }


  body
}


#let text-rules(body) = {
  set text(font: "New Computer Modern")
  set text(lang: "nl")
  set block(spacing: 1.2em)
  set par(first-line-indent: 1.5em, spacing: 0.65em, justify: true)
  set enum(numbering: "1.a.")
  body
}
