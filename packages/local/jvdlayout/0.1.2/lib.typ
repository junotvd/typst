#let mnote(body) = {
  let content = block(body)
  place(left, dx: -10pt, content)
}


/*

   FONTS

*/

#let headingfont = "Tex Gyre Heros"
#let sansfont = "New Computer Modern Sans"
#let regfont = "New Computer Modern"
#let mathfont = "New Computer Modern Math"




/*

TEXT related

*/

#let textrules(doc) = {
  set text(size: 10pt, font: regfont, lang: "nl")
  show math.equation: set text(font: mathfont)
  set par(justify: true)

  let list_config = (
    indent: 5pt,
    spacing: auto,
    tight: true,
  )
  set enum(numbering: "(a.1)", ..list_config)
  set list(..list_config)
  // very hacky for centering math blocks in list envs
  show math.equation.where(block: true): eq => {
    block(width: 93%, inset: 0pt, align(center, eq))
  }

  // show list: it => block(it)
  // show enum: it => block(it)
  doc
}
#let layout(doc) = {
  set page(paper: "a4")


  /*

     HEADINGS

  */
  show heading.where(level: 4): set heading(numbering: none)

  show heading: it => block({
    set par(justify: false)
    // set text(hyphenate: true)
    let headingtext(body) = text(
      font: sansfont,
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
      v(1em, weak: false)
      grid(
        columns: (auto, 1fr),
        {
          if it.numbering != none {
            headingtext(counter(heading).display(it.numbering) + " ")
            h(0.3em)
          }
        },
        {
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
      v(1em, weak: false)
    } else {
      align(top + left, {
        v(7em)
        text(font: sansfont, weight: "regular", size: 26pt, it)
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


  /*

     HEADERS AND FOOTERS

  */

  // From the Typst Forum
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
    margin: (inside: 2.5cm, outside: 6.0cm),
    header: context {
      let current = here().page()
      if (
        not query(heading.where(level: 1).after(here()))
          .map(h => h.location().page())
          .at(0, default: 0)
          == here().page()
      ) {
        if calc.even(current) [
          #counter(page).display()
          #h(1fr)
          #text(font: sansfont, size: 10pt, style: "oblique")[#upper(currentH(
              level: 2,
            ))]
        ] else [

          #text(font: sansfont, size: 10pt, style: "oblique")[#upper(currentH())]
          #h(1fr)
          #counter(page).display()

        ]
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
      ) { counter(page).display() }
    },
  )


  doc
}


/*

   TOC

*/

#let tocrules(doc) = {
  show outline.entry.where(level: 1): it => {
    text(font: sansfont, weight: "bold", it)
  }

  show outline.entry.where(level: 1): set outline.entry(fill: box(
    height: 3pt,
    line(length: 100%, stroke: 0.0pt),
  ))

  doc
}


#let hftrrules(doc) = {
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
    header: context {
      let current = here().page()
      if (
        not query(heading.where(level: 1).after(here()))
          .map(h => h.location().page())
          .at(0, default: 0)
          == here().page()
      ) {
        if calc.even(current) [
          #counter(page).display()
          #h(1fr)
          #text(font: sansfont, size: 10pt, style: "oblique")[#upper(currentH(
              level: 2,
            ))]
        ] else [

          #text(font: sansfont, size: 10pt, style: "oblique")[#upper(currentH())]
          #h(1fr)
          #counter(page).display()

        ]
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
      ) { counter(page).display() }
    },
  )
  doc
}


#let headingrules(doc) = {
  show heading.where(level: 4): set heading(numbering: none)

  show heading: it => block({
    set par(justify: false)
    // set text(hyphenate: true)
    let headingtext(body) = text(
      font: sansfont,
      size: {
        if it.level == 2 {
          15pt
        } else if it.level == 3 {
          12pt
        } else {
          10pt
        }
      },
      weight: "bold",
      body,
    )
    if it.level != 1 {
      v(0.5em, weak: false)
      headingtext(it)
      v(0.5em, weak: false)
    } else if it.level == 1 {
      align(top + left, {
        v(7em)
        text(font: sansfont, weight: "bold", size: 23pt, it)
        v(3em)
      })
    }
  })


  show heading: set text(hyphenate: false)
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    it
  }

  set heading(numbering: "1.1")


  // show heading.where(level: 1): it => {
  //   counter(math.equation).update(0)
  //   it
  // }
  //

  doc
}
