#import "@preview/theoretic:0.2.0" as theoretic: proof, qed, theorem


//#show ref: theoretic.show-ref

#let theorem = theorem.with(supplement: "Stelling", fmt-prefix: (s, n, t) => {
  text(font: "New Computer Modern Sans")[*#s #n*]
  if t != none {
    h(3pt)
    text(font: "New Computer Modern Sans")[(#t)]
    h(1em)
  } else { h(1em) }
})

#let proof = proof.with(supplement: "Bewijs")
#let solution = proof.with(supplement: "Oplossing")

#let lemma = theorem.with(supplement: "Lemma")
#let example = theorem.with(supplement: "Voorbeeld")
#let definition = theorem.with(supplement: "Definitie")

#let note = theorem.with(supplement: "Opmerking", number: none)
