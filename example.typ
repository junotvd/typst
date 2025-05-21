#import "conf.typ": conf
#show: conf.with(
  title: [Algemene Natuurkunde II],
  authors: (
    (
      name: "Junot Van Dijck",
      affiliation: "KU Leuven",
      email: "junot.vandijck@student.kuleuven.be",
    ),
  ),
)


= De vergelijkingen van Maxwell

#table(
  columns: (1fr, 1fr),
  align: center + horizon,

  table.cell(colspan: 2)[*Integraalvorm*],
  [*Elektrisch veld*], [*Magnetisch veld*],
  [Wet van Gauss $ Phi_E = integral.surf arrow(E) dot d arrow(A) = Q / epsilon_0 $],
  [Wet van Gauss $ Phi_B = integral.surf arrow(B) dot d arrow(A) = 0 $],

  [Wet van Faraday $ integral.cont arrow(E) dot d arrow(l) = - (d Phi_B) / (d t) $],
  [Wet van Ampere-Maxwell $ integral.cont arrow(B) dot d arrow(l) = mu_0 I_(text("encl")) + epsilon_0 mu_0 (d Phi_E) / (d t) $],

  table.cell(colspan: 2)[*Differentiaalvorm*],
  [Wet van Gauss $ nabla dot arrow(E) = rho / epsilon_0 $],
  [Wet van Gauss $ nabla dot arrow(B) = 0 $],

  [Wet van Faraday$ nabla times arrow(E) = - (partial arrow(B)) / (partial t) $],
  [Wet van Amepere-Maxwell $ nabla times arrow(B) = mu_0 arrow(J) + mu_0 epsilon_0 (partial arrow(E)) / (partial t) $],
)


== Integraalvorm
*In de lessen hebben we enkel de integraalvorm gezien (blijkbaar).*

De eerste twee wetten zijn van Gauss, de derde is de wet van Faraday en de laatste is de wet van Ampere-Maxwell.

1. Om een elektrisch veld te veroorzaken moet er een lading zijn, deze bepalt dan ook de divergentie van het veld.
2. Deze wet volgt uit de eerste want er bestaat geen ''magnetische lading'' (of magnetische monopool) om divergentie in een magnetisch veld te veroorzaken.
3. Het rotationele gedrag van een elektrisch veld is t.g.v. de verandering van het magnetisch veld t.o.v. de tijd.
4. Het rotationeel gedrag van een magnetisch veld kan veroorzaakt worden door twee onafhankelijke zaken:
  - (Ampere) De stroomdichtheidsvector (of de elektrische stroomdichtheid).
  - (Maxwell) De verandering van het magnetisch veld t.o.v. de tijd.


=== Omvormen van de Maxwell-wetten
We vertrekken uit de wet van *Faraday*:
$
  integral.cont arrow(E) dot d arrow(l) = - (d Phi_B) / (d t).
$
Beschouw een vlakke elektromagnetische golf: $arrow(E)$ wijst in de $y$-richting en hangt af van $x$ en $t$.
We krijgen een reeksontwikkeling van $E$ met partiële afgeleide:
$
  E(x + d x, t) approx E(x,t) + (d E(t = text("cte"))) / (d x) = E(x,t) + (partial E) / (partial x) d x.
$
We bekijken de inductiewet:
- uit het linkerlid:
$
  integral.cont arrow(E) dot d arrow(l) = E(x + d x, t) dot - E(x,t) dot l approx l dot (partial E) / (partial x) d x,
$
- uit het rechterlid:
$
  - (partial Phi_B) / (partial t) = -l d x dot (d B(x = text("cte"))) / (d t) = - l d x dot (partial B) / (partial t).
$
Nu stellen we links en rechts gelijk:
$
  (partial E) / (partial x) = - (partial B) / (partial t).
$

Vervolgens gebruiken we de wet van *Ampère-Maxwell*.
Beschouw een vlakke elektromagnetische golf: $arrow(B)$ wijst in de $z$-richting en hangt af van $x$ en $t$.
#table(
  columns: (auto, 1fr),
  stroke: none,
  align: horizon + left,
  [Linkerlid:],
  [$
      integral.cont arrow(B) dot d arrow(l) = B(x,t) dot l - B(x + d x, t) dot l approx -l dot (partial B) / (partial x) d x
    $],

  [Rechterlid:],
  [$
      mu_0 epsilon_0 (partial Phi_E) / (partial t) = mu_0 epsilon_0 (l d x) dot (partial E) / (partial t)
    $],
)
Gelijkstellen geeft
$
  (partial B) / (partial x) = - mu_0 epsilon_0 (partial E) / (partial t).
$

Samengevat hebben we nu
$
  (partial E) / (partial x) = - (partial B) / (partial t)
  space.quad text("en") space.quad
  (partial B) / (partial x) = - mu_0 epsilon_0 (partial E) / (partial t).
$
Nog eens partieel afleiden geeft
$
  (partial^2 E) / (partial x^2) = - (partial) / (partial x) ((partial B) / (partial t)) = - partial / (partial t)((partial B) / (partial x) = - partial / (partial t)(-mu_0 epsilon_0 (partial E) / (partial t))
$
en
$
  (partial^2 B) / (partial x^2) = -mu_0 epsilon_0 partial / (partial x)((partial E) / (partial t)) = -mu_0 epsilon_0 partial / (partial t)((partial E) / (partial x)) = -mu_0 epsilon_0 partial / (partial t)(-(partial B) / (partial t)).
$
Samenvatten tot de golfvergelijkingen:
$
  (partial^2 E) / (partial x^2) = mu_0 epsilon_0 (partial^2 E) / (partial t^2)
  space.quad text("en") space.quad
  (partial^2 B) / (partial x^2) = mu_0 epsilon_0 (partial^2 B) / (partial t^2).
$
De lichtsnelheid $c = 1 / sqrt(mu_0 epsilon_0)$ kan ingevuld worden in bovenstaande vergelijkingen.
Herinner: licht is een elektromagnetische golf.

=== Verband tussen $B$ en $E$
#table(
  columns: (1fr, 1fr),
  stroke: none,
  align: left + horizon,
  [$
      E = E_(text("max")) cos(k x - omega t) \
      B = B_(text("max")) cos(k x - omega t)
    $],
  [$
      omega / k = (2 pi f) / (2 pi / lambda) = f lambda = c \
    $],
)
De vergelijkingen
$
  (partial E) / (partial x) = -k E_(text("max")) sin(k x - omega t)
  space.quad text("en") space.quad
  (partial B) / (partial t) = omega B_(text("max")) sin(k x - omega t)
$
invullen in
$
  (partial E) / (partial x) = -(partial B) / (partial t)
$
leidt tot
$
  k E_(text("max")) = omega B_(text("max"))
  arrow.double E_(text("max")) / B_(text("max")) = omega / k = c.
$
Bij een elektromagnetische golf is de verhouding tussen de grootte van het elektrisch veld en van het magnetisch veld steeds gelijk aan de lichtsnelheid!
$
  E_(text("max")) / B_(text("max")) = E / B = c.
$
$
  E_(text("max")) arrow.double E_0 text("is amplitude van") E text("-veld") \
  B_(text("max")) arrow.double B_0 text("is amplitude van") B text("-veld")
$

== Kenmerken van elektromagnetische golven
De figuur op de slides (slide 18) geeft een grafische voorstelling op een bepaald moment van een sinusoïdale, lineair gepolariseerde golf die in de $x$-richting beweegt.

Het gaat om een *transversale golfbeweging*, $arrow(E)$ en $arrow(B)$ variëren beiden sinusoïdaal met $x$.

Lineaire combinaties van oplossingen van de golfvergelijkingen zijn eveneens oplossingen van deze golfvergelijkingen.

Elektromagnetische golven voldoen aan het *superpositiebeginsel*.


== Energiedichtheid
De totale ogenblikkelijke energiedichtheid is de som van de energiedichtheden van beide types van velden:
$
  u = u_E + u_B = epsilon_0 E^2 = B^2 / mu_0.
$
We kunnen dit ook uitdrukken in functie van $E$ en $B$ samen:
$
  u = epsilon_0 E^2 = epsilon_0 E c B = (epsilon_0 E B) / (sqrt(epsilon_0 mu_0)) = sqrt(epsilon_0 / mu_0) E B.
$
Deze uitdrukking geeft de energiedichtheid in elk punt van de ruimte ten gevolge van de aanwezigheid van het elektromagnetisch veld.

=== De Poynting-vector
Elektromagnetische golven transporteren energie.
Wanneer ze zich voortplanten in de ruimte, kunnen ze deze energie transfereren naar voorwerpen die op hun pad liggen.

De energie per eenheid van tijd (vermogen) die de elektromagnetische golf transfereert wordt beschreven door de *Poynting-vector*.

Om deze energie te bepalen kijken we hoeveel energie er per tijdseenheid door het oppervlak $A$ stroomt (in de figuur op slide 30):
$
  S &= 1 / A (d U) / (d t) = 1 / A (u d V) / (d t) \
  &= 1 / A ((epsilon_0 E^2)(A c d t)) / (d t) = epsilon_0 c E^2.
$
We vertalen dit dan naar een vectoriële grootheid die loodrecht staat op het elektrisch veld en het magnetisch veld:
$
  arrow(S) = 1 / mu_0 (arrow(E) times arrow(B)).
$
De Poynting-vector is tijdsafhankelijk en bereikt het maximum op hetzelfde moment als het elektrisch en het magnetisch veld.

De SI-eenheid van de Poynting-vector is $J / (s dot m^2) = W / m^2$.

Omdat de velden zo snel variëren in de tijd is in feite enkel het tijdsgemiddelde van het getransporteerde vermogen relevant:
$
  overline(S) = 1 / 2 epsilon_0 c E_0^2 = 1 / 2 c / mu_0 B_0^2 = (E_0 B_0) / (2 mu_0) = (E_(text("rms")) B_(text("rms"))) / mu_0.
$

=== Stralingsdruk
Elektromagnetische golven transporteren energie, maar ook impuls.
Wanneer dit impuls wordt geabsorbeerd door een oppervlak, wordt er druk uitgeoefend op dit oppervlak.

We maken dan gebruike van het _deeltjeskarakter_ van licht.
Volgens de kwantummechanica is de verhouding tussen energie $U$ en impuls $p$ van lichtdeeltjes (fotonen) gegeven door de lichtsnelheid $c$.
$
  text("Voor volledige absorptie is dan") p = U / c.
$
De druk $P$ is de kracht per eenheid van oppervlak en dus
$
  P = F / A = (d p slash d t) / A = (d U slash d t) / (c A) = overline(A) / c.
$
Hierbij hebben we gebruik gemaakt van de definitie van de grootte van de *Poynting-vector*: $(d U slash d t) / A = 1 / A (d U) / (d t)$.

Voor een perfect reflecterend oppervlak worden de impulsverandering en de druk twee keer groter en dan krijgen we voor de stralingsdruk dat
$
  P = F / A = (d p slash d t) / A = (2 d U slash d t) / (c A) = (2 overline(S)) / c.
$
Zoals vermeld in voorbeeld 31-7, ontvangt de Aarde ca. $1000 W slash m^2$ aan stralingsenergie van de Zon.
Dit kunnen we omrekenen naar de stralingsdruk: $P approx 3 times 10^(-6) upright(N) slash m^2$.

Stralingsdruk kan met eventueel gebruiken om een zeilboot aan te drijven dor de zonnewind (voorbeeld 31-8).

Biologen en biofysici gebruiken de stralingsdruk van een laserbundel om "optische pincetten" te vervaardigen.

Weetje: "lichtmolens" draaien niet door de stralingsdruk maar door verschillende snelheden van gasmoleculen aan de absorberende en de reflecterende kant.

== Het spectrum van elektromagnetische golven
Het elektromagnetisch spectrum bestaat uit verschillende types van elektromagnetische golven.
Er zijn geen scherpe grenzen tussen de verschillende types.

Alle types van golven worden bekomen door het versnellen van lading.

Zichtbaar licht beslaat maar een klein deel van het spectrum.

De verschillende types worden onderscheiden door hun frequentie en golflengte.

=== Indeling van het spectrum
#table(
  columns: (1fr, 1fr, 1fr),
  align: center + horizon,
  [*Soort*], [$approx$ *Golflengte*], [*Toepassing / eigenschap*],
  [*Radiogolven*],
  [$10^(-3)$ m tot $7 times 10^(-7)$ m],
  [
    Radio \
    Televisie
  ],

  [*Microgolven*],
  [10 cm tot meer dan 10 km],
  [
    Radarsystemen \
    microgolfovens
  ],

  [*Infraroodgolven*],
  [$10^(-4)$ m tot ca. 0.3 m],
  [
    Geproduceerd door hete voorwerpen en door moleculen. \
    Sterk geabsorbeerd door de meeste materialen.
  ],

  [*Ultraviolet (UV) licht*],
  [$4 times 10^(-7)$ m tot $6 times 10^(-10)$ m],
  [
    Zon \
    Geabsorbeerd door ozon in stratosfeer \
    Beschadigt DNA!
  ],

  [*X-stralen*],
  [$10^(-8)$ m tot $10^(-12)$ m],
  [
    Bron: invallen van elektronen met hoge energie op een metalen treschijf. \
    Nuttig bij medische beeldvorming
  ],

  [*Gammastralen*],
  [$10^(-10)$ m tot $10^(-14)$],
  [
    Uitgezonden door radioactieve kernen. \
    Dringen sterk door en veroorzaken zware schade bij absorptie door levend weefsel.
  ],
)
