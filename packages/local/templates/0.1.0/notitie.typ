#let notitie(body) = {
  let sans = "Lato"
  let serif = "Georgia"
  set page(margin: (x: 4cm, y: 3.5cm))
  set text(font: serif, size: 10pt, lang: "nl", region: "BE")
  set par(justify: true)

  let list-conf = (
    indent: 1em,
    body-indent: 0.5em,
  )
  set list(..list-conf)
  set enum(..list-conf)

  show terms: it => {
    for (i, it) in it.children.enumerate() {
      show: block.with(width: 100%)
      show: par.with(hanging-indent: 2em)
      (
        text(weight: "bold", font: sans, it.term)
          + terms.separator
          + it.description
      )
    }
  }

  show heading: it => {
    set text(font: sans)
    set block(above: 1.5em, below: 1.5em)
    if it.level == 1 {
      block(it)
    } else {
      set text(weight: 400, style: "italic")
      it
    }
  }

  place(left, dx: -4cm)[
    #set align(center)
    #block(
      width: 4cm,
      text(
        font: sans,
        weight: "light",
        style: "italic",
        datetime.today().display("[day]/[month]/[year]"),
      ),
    )
  ]
  body
}
