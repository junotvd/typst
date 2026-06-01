#import "lib.typ": *
#import "@local/math:0.3.0": *
#show: mathrules
#show: detijd


#intro[Donderdagnacht werd de centenindex na een maandenlange discussie dan toch goedgekeurd in het parlement. Wat betekent hij concreet voor u?]

#kader(title: "De essentie")[
  - Door de centenindex zullen lonen boven 4.000 euro bij de eerstvolgende indexatie een beperktere indexering krijgen.
  - Voor pensioenen ligt de drempel op 2.000 euro.
  - Ook in 2028 volgt nog zo’n rem. De impact op het nettoloon is niet exact te voorspellen, maar blijft beperkt.
]

#meer[#link(
  "https://www.tijd.be/netto/pensioen/pensioenwet-gestemd-wat-zijn-de-gevolgen-voor-u/10662376.html?source=netto",
  "Pensionswet gestemd: wat zijn de gevolgen voor u?",
)]


#dropcap()[
  De centenindex is een verkapte indexsprong, waarbij hogere lonen, pensioenen en uitkeringen niet volledig geïndexeerd worden. Wie een maandelijks voltijds brutoloon heeft dat hoger uitkomt dan 4.000 euro, of een brutopensioen boven 2.000 euro, krijgt bij de volgende indexering na 1 juni alleen een volledige indexering tot die drempel. Boven de drempel komt er ook nog een indexering, maar pas na aftrek van 2 procent. Dat principe wordt een tweede keer toegepast bij de eerstvolgende indexering vanaf 1 januari 2028.
]

= Wat is de impact van de centenindex?
#lorem(20)
#kader(
  title: [Sociale kantoren klaar voor centenindex, maar 'praktische problemen niet uit te sluiten'],
)[
  De centenindex is nog maar net gestemd, of hij mag in sommige sectoren al meteen in juni toegepast worden. Sociale kantoren zeggen klaar te zijn, al sluiten ze praktische problemen niet uit. ’We hebben ons de voorbije maanden al volop voorbereid’, luidt het bij de kantoren. ‘We stemmen ook maximaal af met de sociale partners in de sectoren, omdat zij de loonschalen en de indexmechanismen bepaald hebben. Maar, dat is een titanenwerk. Er zijn pakweg zo’n 150 (sub-)sectoren. We weten dat er her en der nog haperingen zullen zijn. Zaken die we nu al voorzien, maar ook zaken die we nog niet in beeld hebben’, zegt Geert Vermeir van SD Worx.

  Ook Acerta wijst erop dat een aantal praktische modaliteiten nog verder geconcretiseerd moeten worden. ‘Op basis van de huidige stand van zaken verwachten we geen systematische problemen, al blijft het in deze fase belangrijk om rekening te houden met sectorspecifieke verschillen en bijkomende verduidelijkingen die nog kunnen volgen. Hierdoor zijn praktische problemen door de hoge complexiteit niet uit te sluiten’, zegt Tom Dirix van Acerta.
]

#meer(title: [Lees ook])[Pensioenwet gestemd: wat zijn de gevolgen voor u?]
#figure(caption: [Dit is in sans font], table(
  columns: 4,
  [Dit], [is], [een], [tabel.],
))


#show raw.where(lang: "python"): set raw(tab-size: 4)
= Is er support voor code?
Hieronder een implementatie van het `quicksort` algoritme in `python`:
```python
def quicksort(arr):
    if len(arr) <= 1:
        return arr

    piv = arr[len(arr) // 2]
    le = [x for x in arr if x < piv]
    mi = [x for x in arr if x == piv]
    ri = [x for x in arr if x > piv]

    return quicksort(le) + mi + quicksort(ri)
```
```python [x.name for x in lst if x.name == name]```
```[x.name for x in lst if x.name == name]```
```
def quicksort(arr):
    pass
```


= Wiskunde
== Analyse achtig
#kader(title: "Definitie")[
  Het *Cartesisch product* van twee verzamelingen, $X$ en $Y$, is de verzameling van alle geordende paren $(x,y)$ voor $x in X$ en $y in Y$:
  $
    X times Y = { (x,y) | x in X and y in Y }
  $
]

== Natuurkunde
$E = dd(E) = k Q/R^2$ met $lambda = q/l$, $dd(q) = lambda dd(l)$ en $dd(E) = (dd(q))/r^2$.
Dus
$
  E &= integral dd(E)_(x) = integral dd(E) cos theta = integral dd(E) dot x/R \
  &= k integral dd(q)/r^2 dot x/r = (k x)/r^3 integral lambda dd(l) = (k x)/r^3 lambda integral_(0) l dot dd(l) \
  &= x/(4 pi epsilon_0) dot 1/((x^2 + a^2)^(3 slash 2)) dot Q/l dot l \
  &= (Q x)/(4pi epsilon_0 (x^2 + a^2)^(3 slash 2))
$

== Gaussische integraal
$
  integral_(-infinity)^(infinity) e^(-x^2) dd(x) = sqrt(pi), space.quad lim_(n -> infinity) (1 + 1/n)^(n) = e
$

== Sommen, producten en binomiaalcoëfficiënten
$
  sum_(k=0)^(n) mat(n; k) x^(k) y^(n-k) = (x + y)^(n), space.quad
  product_(p "priem") 1/(1-p^(-s)) = zeta (s)
$

== Vectoren
$
  hat(a) times arrow(b) = norm(arrow(a)) norm(arrow(b)) sin theta hat(n), space.quad
  dot(arrow(x)) = dv(arrow(x), t), space.quad
  tilde(phi.alt), overline(psi), div arrow(E) = rho/epsilon_0
$

== Matrices
$
  mat(alpha, beta; gamma, theta) mat(x; y) = mat(alpha x, beta y; gamma x, theta y)
$

== Verzamelingenleer, logica, relaties
$
  forall epsilon > 0: abs(x - x_0) < delta ==> abs(f(x) - f(x_0)) < epsilon
$
$
  A union B, A inter, A subset.eq B, x in RR without QQ, emptyset != S subset NN
$

== Cases
$
  sgn (x) = cases(
    -1 & "als" x < 0,
    0 & "als" x < 0,
    +1 & "als" x < 0,
  )
$

== Blackboard, kalligrafie, fraktur
$
  RR, CC, ZZ, QQ, NN, HH, space.quad cal(A), cal(B), cal(C), cal(D), space.quad frak(g), frak(s l)_(2), frak(p)
$

$
  root(3,(x^2 + 1)/(sqrt(y) - z)), space.quad e^(i pi) + 1 = 0, space.quad
  (partial^2 u)/(partial t^2) = c^2 nabla^2 u
$

== Cauchy
$
  abs(chevron.l u\, v chevron.r) <= norm(u) norm(v), space.quad
  integral.cont_(partial Sigma) bold(F) dot dd(bold(l)) = integral.double_(Sigma) (nabla times bold(F)) dot dd(bold(S))
$
