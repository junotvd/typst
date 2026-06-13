#let solutions = state("solutions", ())
#let c-vraag = counter("vraag")
#let vraag(title: none, solution: "", label: none, body) = {
  c-vraag.step()
  context {
    let n = c-vraag.get().first()
    if solution != none {
      solutions.update(it => it + ((n, solution),))
    }
    let label2-string = [vraag#n]
    [
      #figure(
        kind: "vraag",
        supplement: "Vraag",
        block(
          above: 1.5em,
          below: 1.5em,
        )[
          #text(weight: "bold")[
            Vraag
            #if title != none {
              context c-vraag.display()
              text(weight: "regular")[ (#title).]
            } else [
              #context c-vraag.display().
            ]
          ]
          #h(0.3em)
          #body
        ],
      )<#label2-string>
      #counter(figure.where(kind: "vraag")).display()
    ]
  }
}
#show figure.where(kind: "vraag"): set align(left)
#let show-sol = context {
  for (n, body) in solutions.get() {
    [
      #block(width: 100%)[
        #text(weight: "bold")[
          Oplossing
        ]
        #let r = "vraag" + str(n)
        // (#ref(label(r))).
        #box[ ]
        #body
      ]
    ]
  }
}

#vraag(solution: [Oplossing 1])[Een vraag]
#vraag(solution: [Oplossing 2])[Een volgende vraag]
#vraag(solution: [Oplossing 3])[Een volgende volgende vraag]
#vraag(
  solution: [Oplossing 4],
)[Een volgende volgende volgende vraag]

#figure(block[Een figuur])<figuur>
@figuur

#context query(ref)

#show-sol
