#let fonts = (
  main: "Tex Gyre Termes",
  mono: "Iosevka Curly",
)
#let royalblue = rgb("#4169E1")

// ----------------------------------------------------------------------------
// Spaced Small Caps (key ClassicThesis feature)
// ----------------------------------------------------------------------------

#let spaced-smallcaps(content) = {
  text(tracking: 0.1em, smallcaps(content))
}

/// Apply letter-spaced all caps to content
#let spaced-allcaps(content) = {
  text(tracking: 0.15em, upper(content))
}

#let klassiek(
  title: "Title",
  subtitle: none,
  author: none,
  date: datetime.today().display("[year]"),
  lang: "nl",
  figure-supplement: [Fig.],
  bibliography: none,
  doc,
) = {
  set text(
    font: fonts.main,
    size: 10pt,
    spacing: 0.35em,
    lang: lang,
  )
  show math.equation: set text(font: "Tex Gyre Pagella Math")

  set par(
    justify: true,
    leading: 0.5em,
    spacing: 0.5em,
    first-line-indent: (amount: 1em, all: true),
  )

  let item-config = (
    indent: 1em,
    body-indent: 0.9em,
  )
  set enum(
    numbering: "1)a)i)",
    ..item-config,
  )
  set list(
    ..item-config,
  )

  show raw.where(block: false): it => {
    box(
      fill: luma(245),
      inset: (x: 0.3em),
      radius: 2pt,
      text(font: fonts.mono, size: 0.9em, it),
    )
  }

  show raw.where(block: true): it => {
    block(
      width: 100%,
      fill: luma(248),
      inset: 1em,
      radius: 2pt,
      text(
        font: fonts.mono,
        size: 0.90em,
        weight: "light",
        features: (calt: 0),
        it,
      ),
    )
  }

  show link: it => text(fill: royalblue, it)

  set heading(numbering: "1.1")

  // show heading.where(level: 1): it => {
  //   v(3em, weak: true)
  //   align(center)[
  //     #text(
  //       size: 1.4em,
  //       weight: "regular",
  //       tracking: 0.1em,
  //       smallcaps(it.body),
  //     )
  //   ]
  //   v(1.0em)
  // }

  show heading: it => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).get()
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    set text(size: 10pt, weight: 400)
    if it.level == 1 {
      set align(center)
      set text(size: 11pt, tracking: 0.1em)
      show: block.with(above: 15pt, below: 13.75pt, sticky: true)
      show: smallcaps
      if it.numbering != none {
        numbering("I.", deepest)
        h(7pt, weak: true)
      }
      it.body
    } else if it.level == 2 {
      set text(style: "italic")
      show: block.with(spacing: 10pt, sticky: true)
      if it.numbering != none {
        numbering("A.", deepest)
        h(7pt, weak: true)
      }
      it.body
    } else [
      #if it.level == 3 {
        numbering("a)", deepest)
        [ ]
      }
      _#it.body:_
    ]
  }

  set table(stroke: none, inset: 0.7em)
  show table: set text(size: 0.95em)

  set columns(gutter: 12pt)
  set page(
    columns: 2,
    paper: "a4",
    margin: (x: 41.5pt, top: 80.51pt, bottom: 89.51pt),
  )

  // Tables & figures
  show figure: set block(spacing: 15.5pt)
  show figure: set place(clearance: 15.5pt)
  show figure.where(kind: table): set figure.caption(
    position: top,
    separator: [\ ],
  )
  show figure.where(kind: table): set text(size: 8pt)
  show figure.where(kind: table): set figure(numbering: "I")
  show figure.where(kind: image): set figure(
    supplement: figure-supplement,
    numbering: "1",
  )
  show figure.caption: set text(size: 8pt)
  show figure.caption: set align(start)
  show figure.caption.where(kind: table): set align(center)

  // Adapt supplement in caption independently from supplement used for
  // references.
  set figure.caption(separator: [. ])
  show figure: fig => {
    let prefix = (
      if fig.kind == table [TABEL] else if fig.kind
        == image [Fig.] else [#fig.supplement]
    )
    let numbers = numbering(fig.numbering, ..fig.counter.at(fig.location()))
    // Wrap figure captions in block to prevent the creation of paragraphs. In
    // particular, this means `par.first-line-indent` does not apply.
    // See https://github.com/typst/templates/pull/73#discussion_r2112947947.
    show figure.caption: it => block[#prefix~#numbers#it.separator#it.body]
    show figure.caption.where(kind: table): smallcaps
    fig
  }

  // ----------------------------------------------------------------------------
  // Begin document
  // ----------------------------------------------------------------------------

  place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 3em,
    {
      set align(center)
      text(tracking: 0.15em, size: 2em, upper(title))
      if subtitle != none {
        v(1em)
        text(size: 1.3em, style: "italic", subtitle)
      }
      if author != none {
        v(3em)
        text(size: 1.2em, spaced-smallcaps(author))
      }
      v(2em)
      text(size: 1em, date)
    },
  )

  doc

  bibliography
}
