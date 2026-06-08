#let sans = "eb garamond"
#let serif = "eb garamond"

#let klassiek(body) = {
  set text(lang: "nl", region: "BE", size: 10pt, font: serif)
  show math.equation: set text(font: "garamond-math")
  set page(margin: (x: 4cm))
  set par(justify: true)
  show figure.caption: set text(font: "CMU Bright", size: 8pt)
  set heading(numbering: "1.1")
  show heading: it => {
    set text(
      number-type: "lining",
      style: "normal",
      weight: 400,
      font: "cormorant garamond",
    )
    if it.level == 1 {
      set align(center)
      block(
        above: 1.5em,
        below: 1.5em,
        smallcaps(it),
      )
    } else if it.level == 2 {
      set text(style: "italic")
      block(
        above: 1em,
        below: 1em,
        it,
      )
    } else { it }
  }

  body
}

#let code(body, sans: "Lato", serif: "Georgia") = {
  set par(justify: true)
  set text(font: serif, size: 10pt, lang: "nl")
  show raw: set text(font: "SFMono Nerd Font Mono")
  show raw.where(block: true): block.with(
    width: 100%,
    fill: luma(240),
    inset: 1.0em,
    radius: 3pt,
  )
  show raw.where(block: false): box(
    fill: red,
    inset: (x: 2pt),
    outset: (y: 2pt),
  )[TODO: RAW CODE BLOCKS]

  set heading(numbering: "1.1")
  show heading: it => {
    set text(font: sans)
    if it.level == 1 {
      block(above: 3em, below: 3em)[
        #counter(heading).display()
        #it.body
        #text(fill: red)[TODO HEADING STYLING]
      ]
    } else if it.level == 2 {
      block(above: 2.0em, below: 2.0em, it)
    } else {
      block(above: 1.5em, below: 1.5em, it)
    }
  }

  body
}

#let big-heading-numbers(body) = {
  let sans = "Lato"
  set heading(numbering: "1.1")
  set page(margin: (x: 4cm))
  show heading: set text(font: sans)
  show heading: it => {
    set par(justify: false)
    set text(font: sans)
    if it.level == 1 {
      set align(center)
      block(width: 100%, above: 4em, below: 4em)[
        #place(left, dx: -2cm, dy: -1.5em, text(
          size: 5em,
          counter(heading).display(),
        ))
        #it.body
      ]
    } else {
      place(left, counter(heading).display())
      h(6em)
      it.body
    }
  }
  body
}

