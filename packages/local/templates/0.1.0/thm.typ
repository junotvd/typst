#set heading(numbering: "1.1")
#show math.equation: set text(font: "Libertinus Math")
#set par(justify: true)
#let solutions = state("solutions", ())
#let thm(
  supplement: "sup",
  title: none,
  thm-numbering: "1.1",
  kind: "thm",
  sep: ".",
  // label: WIP,
  qed-symbol: false,
  sup-styling: (weight: "bold"),
  body-styling: (),
  block-styling: (above: 1.5em, below: 1.5em, width: 100%),
  solution: none,
  body,
) = context {
  let prefix = "_" + kind
  let n = counter(figure.where(kind: kind)).get().first() + 1
  let label-name = prefix + str(n)
  if solution != none {
    solutions.update(it => it + ((label-name, solution),))
  }
  [
    #figure(
      // caption: [\_],
      kind: kind,
      supplement: supplement,
      numbering: if thm-numbering != none {
        (..numbers) => numbering(
          thm-numbering,
          ..(counter(figure.where(kind: kind)).get()),
        )
      },
      block(..block-styling)[
        #set align(left)
        #text(..sup-styling)[
          #supplement
          #if thm-numbering != none [ #n]
        ]
        #if title != none {
          text[ (#title)]
        }
        #text(..sup-styling)[#sep]
        #set text(..body-styling)
        #body
        #if qed-symbol != false [#h(1fr)#qed-symbol]
      ],
    )#label(label-name)
  ]
}


#let proof = thm.with(
  supplement: "Bewijs",
  thm-numbering: none,
  kind: "prf",
  sup-styling: (style: "italic"),
  body-styling: (font: "eb garamond"),
  qed-symbol: text(font: "New Computer Modern Math", math.square.stroked),
)
#let axi = thm.with(
  supplement: "Axioma",
  kind: "axi",
  body-styling: (
    style: "italic",
  ),
  block-styling: (
    above: 1.5em,
    below: 1.5em,
    stroke: (left: 1.0pt),
    inset: (left: 1em),
  ),
)
#let stel = thm.with(supplement: "Stelling")
#let vraag = thm.with(supplement: "Vraag")
#let opl = thm.with(supplement: "Oplossing", thm-numbering: none)
#let show-sol(title: [Oplossingen], thm-func: opl, supplement: [Oplossing]) = {
  heading(title)
  context {
    for (l, body) in solutions.get() {
      thm-func(
        supplement: ref(label(l)),
        title: none,
        thm-numbering: none,
      )[#body]
    }
  }
}




// testing

#stel[$forall x in RR, exists n in NN : x < n$]
#proof[
  Veronderstel dat er een $x in RR$ bestaat zodat $x >= n$ voor alle $n in NN$.
  Dan is $NN$ naar boven begrensd en moet $NN$, volgens de supremumeigenschap, een supremum hebben, zeg $s = sup NN$.
  Dan is $s - 1$ geen bovengrens van $NN$.
  Er bestaat dus een $k in NN$ zodat $s - 1 < k$.
  Maar dan is $s < k + 1$ en omdat $k + 1 in NN$ is dit strijdig met het feit dat $s$ een bovengrens van $NN$ is.
]
@_thm1

#axi[
  De natuurlijke getallen bestaan uit een verzameling $NN$ met $S : NN -> NN$ en een element $0 in NN$ zodanig dat
  + $S$ is een injectie
  + $0$ behoort tot het beeld van $NN$
  + Als $A$ een deelverzameling is van $NN$ met $0 in A$ en
    $ forall n in NN : n in A => S(n) in A, $ dan is $A = NN$
]


#vraag(solution: [#lorem(50)])[Een vraag]



#show-sol()
