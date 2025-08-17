#import "lib.typ": *

#show: mathpaper.with(
  author: [jvd],
  title: [Algemene Natuurkunde I],
  subtitle: [Mechanica],
  subsubtitle: [Notities en andere opmerkingen],
  date: [2024-2025],
)


= Gravitatie
== Planetary motions

Elk voorwerp trekt elk ander voorwerp aan met een kracht die voor elke twee voorwerpen (massa's $m$ en $m'$) gelijk is aan
$
  F = G (m m')/r^2.
$


== Wetten van Kepler

+ Een ellips is een gesloten kromme zodat de som van de afstanden van eender welk punt $P$ op de kromme tot twee vaste punten, de _brandpunten_ $F_1 P$ en $F_2 P$, een constante is.

+ De *perkenwet* zegt dat elke planeet beweegt zodanig dat de denkbeeldige lijn, getrokken van de Zon tot de planeet, een gelijke oppervlakte bestrijkt over gelijke tijdsintervallen.

  Dit betekent dat een planeet sneller beweegt als deze dichter bij de zon is (perihelium) en langzamer als deze verder weg is (aphelium).
  Hierdoor blijft de snelheid consistent met de afstand tot de zon.

+ De verhouding van de kwadraten van de omlooptijden van een willekeurig paar planeten, draaiend rond de Zon, is gelijk aan de verhouding van de derde machten van hun halve lange assen van hun banen.

  Zij $T_1$ en $T_2$ twee omlooptijden van twee willekeurige verschillende planeten en $s_1$ en $s_2$ hun, respectievelijke, halve lange assen.
  Dan geldt
  $
    (T_1/T_2)^2 = (s_1/s_2)^3.
  $
  Dit kunnen we herschrijven als
  $
    frac(s_1^3, T_1^2) = frac(s_2^3, T_2^2),
  $
  waarbij $s^3/T^2$ hetzelfde is voor elke planeet; een constante dus.
  Met andere woorden is het kwadraat van de omlooptijd evenredig met de
  derde macht van de halve lange as.

Een gegeven planeet beweegt in een ellipsvormige baan.
Over een infinitesimale tijd $d t$, beweegt de planeet over een afstand $v d t$ en bestrijkt een oppervlakte $d A$, gelijk aan de oppervlakte van een driehoek met basis $r$ en hoogte $v d t sin theta$.
Dus
$
  d A = 1/2 (r) (v d t sin theta) quad "en" quad frac(d A, d t) = 1/2 r v sin theta.
$


De grootte van het angulair momentum $arrow(L)$ van de Zon is
$
  L = abs(arrow(r) times m arrow(v)) = m r v sin theta,
$
dus
$
  frac(d A, d t) = 1/(2m) L.
$
Aangezien de gravitationele kracht $arrow(F)$ in de richting van de Zon staat, is $L$ een constante.
Dus het resulterende krachtmoment is gelijk aan nul, dit bewijst de tweede wet van Kepler.

#proof([Eerste wet van Kepler])[
  We bewijzen de eerste wet met de wetten van Newton in poolcoördinaten.

  We weten
  $
    arrow(a) = (frac(d^2 r, d t^2) - r(frac(d theta, d t))^2) hat(r) + (2 frac(d r, d t) frac(d theta, d t) + r frac(d^2 theta, d t^2)) hat(theta)
  $
  en
  $
    m arrow(a) = - frac(G M_(plus.circle.big) m a, r^2) + 0 dot theta ==>
    cases(
      frac(d^2 r, d t^2) - r(frac(d theta, d t))^2 = - frac(G M_(plus.circle.big) a, r^2),
      2 frac(d r, d t) frac(d theta, d t) + r frac(d^2 theta, d t^2) = 0.
    )
  $
  Uit de tweede vergelijking volgt
  $
    1/r d/(d t) (r^2 frac(d theta, d t)) = 0.
  $
  Omdat $1/r$ niet nul is kunnen we deze laten vallen:
  $
    frac(d theta, d t) = L/r^2.
  $
  Stel nu dat $u = 1/r$, dan $r = 1/u$.
  Dit geeft $ frac(d r, d t) = - 1/u^2 frac(d u, d theta) frac(d theta, d t) = - 1/u^2 L u^2 frac(d u, d theta) = - L frac(d u, d theta). $
  Dan $L/r^2 = L u^2$.
  De tweede afgeleide is dan
  $
    frac(d^2 r, d t^2) = - L frac(d^2 u, d theta^2) frac(d theta, d t) = - L^2 u^2 frac(d^2 u, d theta^2).
  $
  Invullen in de eerste vergelijking geeft
  $
    -L^2 u^2 frac(d^2 u, d theta^2) - 1/u L^2 u^(4) = - G M_(plus.circle.big) u^2.
  $
  Vereenvoudig:
  $
    frac(d^2 u, d theta^2) + 1 dot u = frac(G M_(plus.circle.big), L^2).
  $
  Dan
  $
    u(theta) = c cos(theta - phi) + frac(G M_(plus.circle.big), L^2)
  $
  en
  $
    r(theta) = frac(1, frac(G M_(plus.circle.big), L^2) (1 + e cos(theta - phi)))
  $
  met $e = frac(c L^2, G M_(plus.circle.big))$.
  Dit is de vergelijking van een kegelsnede in poolcoördinaten, dus van een cirkel, parabool, _ellips_.
]

= Golfbeweging

== Mechanische golven
#align(center, table(
  columns: 2,
  align: center + horizon,
  [*Mechanische golven*], [*Elektromagnetische golven*],
  [Fysisch medium], [Geen medium ("ether")],
))
Golfbeweging transfereert energie (geen materie).

De verstoring plant zicht voor door de cohesiekrachten in het medium.

De snelheid van een golf met frequentie $f = 1/T$ waarbij $T$ de periode is $ v = lambda/T = lambda f $.
- *Transversale golf*: medium trilt loodrecht op voortplantingsrichting.
- *Longitudinale golf*: medium trilt evenwijdig met voortplantingsrichting.
  Er is periodische compressie en expansie in de veer $arrow$ komen overeen met toppen en dalen bij een transversale golf.
  Een voorbeeld: geluidsgolven in de lucht of elders.


==== Voortplantingssnelheid transversale golven
Hangt op een gespannen koord af van:
+ Trekspanning $F_T$
+ Massa per lengte: $mu = m/l$
- De snelheid:
$ v = sqrt(F_T/mu) $
- *Kwalitatief*: Meer massa $arrow.double$ meer inertie $arrow.double$ tragere reactie.
- *Kwantitatief*: $F_("res")$ in lengterichting.
$ F_("net") = (P_0 + Delta P)S - P_0 S = S Delta P $ met $S$ de dwarsdoorsnede.
Snelheid van golven in een vloeistof: $ v = sqrt(B/rho) $ met $B = rho v^2$.


=== Energietransport door golven
Energie met massa $m$ en amplitude $A$: $ E = 1/2 k A^2 = 2 pi^2 m f^2 A^2 $.
Gemiddelde vermogen: $ overline(P) = E/t = 2 pi^2 rho v S f^2 A^2 $
Intensiteit: $ overline(B)/S = 2 pi^2 rho v f^2 A^2 $

Beschouw 1-dimensionale sinusgolf (trans- of longitudinaal) met golflengte $lambda$ en frequentie $f$.
De momentopname op $t = 0$ kunnen we beschrijven als
$
  D(x) = A sin((2pi)/lambda x).
$
$D$ is de verplaatsing op positie $x$ en $A$ de amplitude.
Deze vorm herhaalt zich iedere golflengte.
#canvas({
  import draw: *

  set-style(mark: (
    transform-shape: false,
    fill: black,
  ))
  let wave(
    amplitude: 1,
    fill: none,
    phases: 2,
    scale: 8,
    offset: 0,
    samples: 100,
    stroke: 1pt,
  ) = {
    line(
      ..(
        for x in range(-30, samples + 1) {
          let x = x / samples
          let p = offset + (2 * phases * calc.pi) * x
          ((x * scale, calc.sin(p) * amplitude),)
        }
      ),
      fill: fill,
      stroke: stroke,
    )
  }
  line((-2.8, 0), (8.5, 0), mark: (end: ">"))
  content((8.65, 0), $x$, anchor: "west")
  line((0, -1.5), (0, 1.5), mark: (end: ">"))
  content((0, 1.65), $y$, anchor: "south")
  line((4, -1.5), (4, 0), stroke: (dash: "dashed", thickness: 0.7pt))
  wave(stroke: (paint: rgb(255, 0, 0, 170), thickness: 2pt))
  wave(offset: -1.5, stroke: (dash: "dashed", paint: rgb(255, 0, 0, 170)))
  line((0, -1.3), (1.6, -1.3), mark: (start: ">"), stroke: 0.5pt)
  line((2.4, -1.3), (4, -1.3), mark: (end: ">"), stroke: 0.5pt)
  content((2, -1.42), $lambda$, anchor: "south")
  line((-0.20, -1), (0.20, -1))
  content((-0.3, -1.1), $-A$, anchor: "east")
  line((-0.20, 1), (0.20, 1))
  content((-0.3, 1.1), $A$, anchor: "east")
  line((4.32, 0.5), (3.9, 1), stroke: 0.5pt)
  content((4, 1.1), $text("golf voor") \ t = 0$, anchor: "south")
  line((6.73, 0.3), (7.9, 1), stroke: 0.5pt)
  content((7.6, 1.3), $text("golf op tijd") t$, anchor: "west")
})

De top van de heeft zich na tijd $t$ verplaatst over een afstand $v t$.
Wiskundig impliceert dit dat we $x$ moeten vervangen door $x - v t$.
Voor de verplaatsing krijgen we dan
$
  D(x,t) = A sin[(2pi)/lambda (x - v t)].
$


Aangezien de snelheid $v = lambda f = lambda slash T$, kunnen we uitdrukking voor de verplaatsing herschrijven als
$
  D(x,t) = A sin(frac(2pi x, lambda) - frac(2pi t, T)).
$
Dit kunnen we ook schrijven als $display(D(x,t) = A sin(k x - omega t))$.
Hierbij is $k = 2pi slash lambda$ het *golfgetal* en $omega = 2pi f$ de *hoekfrequentie*, $k x - omega t$ wordt ook de *fase* van de golf genoemd.
De snelheid van de golf wordt de *fase-snelheid* genoemd:
$
  v = lambda f = (frac(2pi, k))(frac(omega, 2pi)) = omega/k.
$

We kunnen ook een *fase-hoek* inbrengen:
$
  D(x,t) = A sin(k x - omega t + phi).
$

