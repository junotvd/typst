#set heading(numbering: "1.1")
= blabla
#let _thm-block-args = (above: 1.5em, below: 1.5em, width: 100%)

= Test
#let thm(
  supplement: "sup",
  title: none,
  thm-numbering: "1.1",
  kind: "thm",
  sep: ".",
  sup-styling: (weight: "bold"),
  body-styling: (),
  set-rules: (),
  body,
) = context {
  let prefix = "_" + kind
  let n = counter(figure.where(kind: kind)).get().first() + 1
  let label-name = prefix + str(n)
  [
    #figure(
      caption: [\_],
      kind: kind,
      supplement: supplement,
      numbering: (..numbers) => numbering(
        thm-numbering,
        ..(counter(figure.where(kind: kind)).get()),
      ),
      block(.._thm-block-args)[
        #set align(left)
        #if thm-numbering != none {
          text(..sup-styling)[#supplement #n#sep]
        } else {
          text(..sup-styling)[#supplement#sep]
        } #h(0.3em)
        #set text(..body-styling)
        #body
      ],
    )#label(label-name)
  ]
}
#let proof = thm.with(
  supplement: "Bewijs",
  // thm-numbering: none,
  kind: "prf",
  sup-styling: (style: "italic"),
)
#let axi = thm.with(
  supplement: "Axioma",
  kind: "axi",
  body-styling: (
    style: "italic",
    font: "eb garamond",
  ),
)
#let stel = thm.with(supplement: "Stelling")

#stel[$forall x in RR, exists n in NN : x < n$]
#proof[
  Veronderstel...
]
@_thm1
@_prf1

#axi[
  De natuurlijke getallen bestaan uit een verzameling $NN$ met $S : NN -> NN$ en een element $0 in NN$ zodanig dat
  + $S$ is een injectie
  + $0$ behoort tot het beeld van $NN$
  + Als $A$ een deelverzameling is van $NN$ met $0 in A$ en
    $ forall n in NN : n in A => S(n) in A, $ dan is $A = NN$
]



// #let solutions = state("solutions", ())
// #let c-vraag = counter("vraag")
// #let vraag(title: none, solution: "", label: none, body) = {
//   c-vraag.step()
//   context {
//     let n = c-vraag.get().first()
//     if solution != none {
//       solutions.update(it => it + ((n, solution),))
//     }
//     let label2-string = [vraag#n]
//     [
//       #figure(kind: "vraag", supplement: "Vraag", block(
//         above: 1.5em,
//         below: 1.5em,
//       )[
//         #text(weight: "bold")[
//           Vraag
//           #if title != none {
//             context c-vraag.display()
//             text(weight: "regular")[ (#title).]
//           } else [
//             #context c-vraag.display().
//           ]
//         ]
//         #h(0.3em)
//         #body
//       ])<#label2-string>
//       #counter(figure.where(kind: "vraag")).display()
//     ]
//   }
// }
// #show figure.where(kind: "vraag"): set align(left)
// #let show-sol = context {
//   for (n, body) in solutions.get() {
//     [
//       #block(width: 100%)[
//         #text(weight: "bold")[
//           Oplossing
//         ]
//         #let r = "vraag" + str(n)
//         // (#ref(label(r))).
//         #box[ ]
//         #body
//       ]
//     ]
//   }
// }
//
// #vraag(solution: [Oplossing 1])[Een vraag]
// #vraag(solution: [Oplossing 2])[Een volgende vraag]
// #vraag(solution: [Oplossing 3])[Een volgende volgende vraag]
// #vraag(
//   solution: [Oplossing 4],
// )[Een volgende volgende volgende vraag]
//
// #figure(block[Een figuur])<figuur>
// @figuur
//
// #context query(ref)
//
// #show-sol
