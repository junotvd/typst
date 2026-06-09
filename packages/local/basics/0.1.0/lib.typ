#let myref(label) = context {
  if query(label).len() != 0 {
    ref(label)
  } else {
    text(fill: red)[???]
  }
}

#let outline-rules(body) = {
  show outline.entry.where(level: 1): set outline.entry(fill: none)

  body
}

#let text-rules(lang: "nl", region: "BE", body) = {
  set text(size: 10pt, lang: lang, region: region)
  body
}
