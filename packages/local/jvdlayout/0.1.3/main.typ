#import "lib.typ": *
#import "@preview/theoretic:0.3.1"
#import theoretic.presets.basic: *
#show ref: theoretic.show-ref
#let proof = proof.with(supplement: [Bewijs])
#let theorem = theorem.with(supplement: [Stelling])
#let definition = definition.with(supplement: [Definitie])

#show: simple.with()


#lemma[
  Voor elke $x in RR$ bestaat er een $n in NN$ zodat $x < n$.
]

#proof[
  Veronderstel dat er een $x in RR$ zou bestaan zodat $x >= n$ voor alle $n in NN$.
  Dan zou $NN$ naar boven begrensd zijn en volgens de supremumeigenschap een supremum hebben, zeg $s = sup NN$.
  Omdat $s$ de kleinste bovengrens is van $NN$, is $s - 1$ geen bovengrens van $NN$.
  We kunnen dus een $k in NN$ vinden zodat $s - 1 < k$, maar dan is $s < k + 1$ en omdat $k + 1 in NN$ is dit strijdig met de aanname dat $s$ een bovengrens van $NN$ is.
]

#theorem[
  Let $E subset.eq RR^(n)$ be open and let $overline(B_r (a)) subset.eq E$.
  Suppose $f in cal(E)^(k) (E)$, dan
  $
    f(x) = sum_(abs(alpha) <= k) (D^(alpha) f(A))/(alpha!) (x-a)^(alpha) + sum_(abs(alpha) =k) h_(alpha) (x) (x-a)^(alpha)
  $
  for any $x in B_r (a)$, where $alpha$ is a multi-index, and $h_(alpha) : B_r (a) -> RR$ such that $h_(alpha) (x) -> 0$ when $x -> a$ for all $abs(alpha) = k$.
]
