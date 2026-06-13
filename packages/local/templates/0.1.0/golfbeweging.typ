#import "@preview/physica:0.9.5": *
#import "@preview/cetz:0.3.4": canvas, draw, matrix, vector

#set page(margin: (x: 4.0cm), numbering: "1")
#set text(font: "eb garamond", number-type: "lining", size: 10pt, lang: "nl")
#show math.equation: set text(font: "garamond-math")
#set par(justify: true)
#set heading(numbering: "1.1")
#show heading.where(level: 1): smallcaps
#show heading.where(level: 3): set heading(numbering: none)
#show heading: set text(font: "cormorant garamond")
#show heading: block.with(above: 1.5em, below: 1.5em)
#show strong: set text(font: "cormorant garamond")
#set table(stroke: (x, y) => (
  left: if x > 0 { 0.5pt },
  top: if y > 0 { 0.5pt },
))
#set list(indent: 1em, body-indent: 0.5em)
#set enum(indent: 1em, body-indent: 0.5em)


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
Hangt op een gespannen koord af van de trekspanning $F_T$ en de massa per lengte: $mu = m/l$.
De snelheid:
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
#figure(
  canvas({
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
  }),
  caption: [Golfbeweging],
)

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

== Golfvergelijking
Beschouw amplitude klein in vgl met golflengte, uitwijking enkel verticaal en $F_T$ constant.
Pas tweede wet van Newton toe voor stuk snaar met massa $m = mu Delta x$ met $mu$ de massa per eenheid van lengte:
$
  sum F_y m a_y arrow.double F_T sin theta_2 - F_T sin theta_1 = (mu Delta x) pdv(D, t, 2).
$
Voor kleine uitwijkingen geldt volgens benadering
$ sin theta approx tan theta = pdv(D, x) = s $
met $s$ lokale helling van de snaar.
We kunnen resultaat van Newton nu herschrijven:
$ F_T(s_2 - s_1) = (mu Delta x) pdv(D, t, 2) arrow.double F_T = (Delta s)/(Delta x) = mu pdv(D, t, 2) $.
Voor limiet $Delta x arrow 0$ vinden we $display(F_T pdv(D, x, 2) = mu pdv(D, t, 2))$.
Herschrijven van $v$ levert de *golfvergelijking*:
$ pdv(D, x, 2) = 1/v^2 pdv(D, t, 2) $.
Deze vergelijking geldt ook voor longitudinale geluidsgolven (kleine $A$) en voor EM-golven (zie Maxwell).

De golfvergelijking is *lineair* ($D$ verschijnt maar eenmaal in elke term) $arrow.double$ *superpositiebeginsel*.

Als $D_1(x,t)$ en $D_2(x,t)$ oplossingen $arrow.double$ volgende oplossing:
$ D_3(x,t) = a D_1(x,t) + b D_2(x,t). $
*ENKEL KLEINE $A$*

=== Superpositiebeginsel
Uit dit superpositiebeginsel volgt dat als twee of meer lopende golven door een medium bewegen, de totale verplaatsing van de resulterende golf in ieder punt de algebraïsche (of algemeen: vectoriële) som is van de verplaatsingen van de individuele golven.

Golven die hieraan voldoen zijn *lineaire golven*.

Volgens Fourier kan elke periodische functie geschreven worden als een reeks.
Voor de $t$-afhankelijkheid geldt
$
  D(t) = a_0/2 + sum_n A_n cos(2 pi f_n t) + B_n sin(2 pi f_n t) space.quad "bij vaste" x.
$
De laagste frequentie is de *fundamentele frequentie $f_1 = 1/T_1$* en de *harmonischen* zijn $f_n = n f_1$ met $n = 1,2,3, ...$
Fourier-analyse werkt ook voor de $x$-afhankelijkheid.


=== Superpositie en interferentie
De combinatie van twee aparte golven in hetzelfde gebied van de ruimte tot een resulterende golf wordt *interferentie* genoemd:
- *Constructieve*: uitwijkingen in dezelfde richting, golven in fase
- *Destructieve*: analoog, $180 degree$ uit fase $arrow.double A$ resterende golf $= 0$.

=== Staande golven
#grid(
  columns: (auto, 1fr, auto),
  align: center + horizon,
  block(
    $
      D_1(x,t) = A sin(k x - omega t) \
      D_2(x,t) = A sin(k x - omega t)
    $,
  ),
  [$
    stretch(arrow, size: #150%)_"superpositiebeginsel"
  $],
  block(
    $
      D(x,t) & = D_1(x,t) + D_2(x,t) \
             & = A sin(k x - omega t) + A sin(k x - omega t)
    $,
  ),
)

Resulterende golf is een staande golf met snelheid $v = 0$:
$
  D(x,t) = [2 A sin(k x)] cos(omega t)
$
Drie amplitudes:
- $A$ van individuele golven
- Plaatselijke $2 A sin(k x)$ van beweging van element op pos $x$
- $2A$ van staande golf.


=== Staande golven


=== Breking
De wet voor breking:
$ (sin theta_1)/(sin theta_2) = v_2/v_1 space.quad "wet van Snellius" $


=== Buiging
$ theta approx = lambda/l $
