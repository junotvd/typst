#let base(body) = {
  let list-conf = (
    indent: 1em,
    body-indent: 0.5em,
  )
  set list(..list-conf)
  set enum(numbering: "a)", ..list-conf)

  body
}
