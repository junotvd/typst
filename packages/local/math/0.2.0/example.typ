#import "lib.typ": *
#show: math-rules
#set par(justify: true)

#set text(font: "CMU Serif")


#theorem(title: [Taylor's Formula over $RR$], label: <taylor>)[
  Let $E subset.eq RR^n$ be open and let $overline(B_r (a)) subset.eq E$.
  Suppose $f in cal(C)^k (E)$.
  Then
  $
    f(x) = sum_(abs(alpha) <= k) (D^alpha f(a))/(alpha!) (x-a)^(alpha) + sum_(abs(a)=k) h_alpha (x) (x-a)^(alpha)
  $
  for any $x in B_r (a)$, where $alpha$ is a multi-index, and $h_alpha : B_r (a) -> RR$ such that $h_(alpha) (x) -> 0$ when $x -> a$ for all $abs(alpha) = k$.

]
#note[
  Observe
  $
    abs((x-a)^(alpha)) = abs(product_(i=1)^(n) (x_i - a_i)_(i)^(alpha)) = product_(i=1)^(n) abs(x_i - a_i)_(i)^(alpha) <= abs(x-a)^(abs(alpha))
  $
  Therefore we have that
  $
    abs(sum_(abs(alpha)=k) h_(alpha) (x) (x-a)^(alpha)) <= abs(x-a)^(k) sum_(abs(alpha)=k) abs(h_(alpha) (x)).
  $
]

#proof(title: [van @taylor[!!!]])[
  Let $x in B_r (a)$ and define $[a,x] = {phi(t) | t in [0,1]}$, where $phi : [-1,1] -> RR^(n)$ is defined by $phi(t) = a + t(x - a)$.
  Now let $g(t) = f(phi(t))$ so that $g(0) = f(a)$ and $g(1) = f(x)$.
  Thus $g in cal(C)^(k) ([-1,1])$, meaning
  $
    g(1) = g(0) + 1/(1!) g'(0) + dots.h.c + 1/((k-1)!) g^((k-1)) (0) + 1/(k!) g^((k)) (c)
  $
  for some $c in [0,1]$.
  As shown previously, we have
  $
    f(x) = sum_(abs(alpha)<=k-1) D^(alpha) f(phi(t)) dot (x-a)^(alpha)
  $
  for $m=1, ... , k$ by the Mixed Derivative Theorem.
  This implies
  $
    f(x) = sum_(abs(alpha) <= k-1) (D^(alpha) f(a))/(alpha!) (x-a)^(alpha) + sum_(abs(alpha)=k) (D^(alpha) f(y))/(alpha!) (x-a)^(alpha)
  $
  for some $y in [a,x]$.
  Now observe $D^(alpha) f(y) = D^(alpha) f(a) + (D^(alpha) f(y) - D^(alpha) f(a))$, where $D^(alpha) f(y) - D^(alpha) f(a) -> 0$ as $y -> a$.
  Lastly define $h_(alpha) (x) = (D^(alpha) f(y) - D^(alpha) f(a))/(alpha!) -> 0$ as $x -> a$, where $y$ is a function of $x$.
]

#let lemma2(body, ..args) = [
  #box(stroke: (left: 2.5pt), inset: (left: 10pt, y: 5pt))[
    #lemma(..args)[#body]
  ]
]

#lemma(title: "Archimedes")[
  Voor elke $x in RR$ bestaat er een $n in NN$ zodat $x < n$.

  #proof[
    Veronderstel dat er een $x in RR$ zou bestaan zodat $x >= n$ voor alle $n in NN$.
    Dan zou $NN$ naar boven begrensd zijn en volgens de supremumeigenschap een supremum hebben, zeg $s = sup NN$.
    Omdat $s$ de kleinste bovengrens is van $NN$, is $s - 1$ geen bovengrens van $NN$.
    We kunnen dus een $k in NN$ vinden zodat $s - 1 < k$, maar dan $s < k + 1$ en omdat $k + 1 in NN$ is dit strijdig met de aanname dat $s$ een bovengrens van $NN$ is.
  ]
]
