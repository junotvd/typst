#import "lib.typ": *
#show: klassiek


= De onredelijke werkzaamheid van de wiskunde
- Een theorie staat of valt met experimenten.
- Wiskunde is de taal van de natuur (en is onredelijk werkzaam).
- Fysica gaat over concepten en ideeën.
- Hoofdpersonages: Simon Stevin, Galileo Galilei, Isaac Newton, William Hamilton.

= Symmetrie
- Symmetrie is het krachtigste concept uit de fysica. De natuurwetten kennen maar één god: symmetrie.
- Breekt de symmetrie, dan is ze kapot. Maar dat levert wel orde en structuur op in de veelheid van de materie.
- Groepentheorie is de wiskunde van symmetrieën.
- Hoofdpersonages: Emmy Noether, Lev Landau, Évariste Galois, Wolfgang Pauli.



= De (on)waarschijnlijkheid van een deeltje
== De nagel op de kop
Ieder fysisch lichaam stuurt onophoudelijk en vanuit zichzelf elektromagnetische stralen uit, omdat de atomen en de moleculen waaruit een voorwerp is samengesteld voortdurend trillen.
Vijfenzestig procent van het warmteverlies van ons eigenste menselijke lichaam gebeurt via elektromagnetische straling.
Of neem ijzer.
IJzer dat wordt op opgewarmd, straalt een kleur uit.
Die kleur verandert naarmate de temperatuur stijgt, waardoor ze licht uitstralen met een steeds hogere frequentie.
Is die kleur rood, dan is het ijzer al heel warm.
Word het nog heter, dan slaat die rode kleur over naar blauw.

=== Hoofding level 3


= Wetten van Kepler

*Stelling 1* (Eerste wet van Kepler). #h(0.5em) _Elke planeet beweegt over een ellipsvormige baan met de Zon in een van haar brandpunten._

*Bewijs*. #h(0.5em) We gebruiken de tweede wet van Newton om de eerste wet van Kepler te bewijzen.
We doen dit in poolcoördinaten.
We zoeken $r(theta)$, de vergelijking van een planeet rond de Zon.
Neem $r$ de afstand tussen de planeet en de Zon en de massa's van de planeet en de zon, respectievelijk $m$ en $M$.
De gravitatieconstante is gegeven door de letter $G$.

We gaan er ook vanuit dat er geen omliggende planeten (en dus massa's) in de buurt liggen.
Dit wilt zeggen dat de totale energie van een planeet, gegeven door $E = 1/2 m arrow(v)^2 - (G M)/r$ constant blijft tijdens de beweging.
Dan veranderen de snelheid $arrow(v)$ en de afstand $arrow(r)$ in samenhang en hun bijdrage aan $E$ levert altijd dezelfde waarde op.
Voor een ellips is de totale energie altijd negatief.
Dit betekent dat de planeet 'gebonden' blijft aan de Zon:
$
  E = - (G M)/(2 a),
$
waarbij $a$ de semi-hoofdas van de ellips.

De versnelling in poolcoördinaten is
$
  arrow(a) = ((d^2 r)/(d t^2) - r ((d theta)/(d t))^2) hat(r) + (2 (d r)/(d t) (d theta)/(d t) + r (d^2 theta)/(d t^2)) hat(theta).
$
We weten ook dat
$
  m arrow(a) = - (G M m)/r^2 hat(r) + 0 dot hat(theta).
$
Hieruit volgt dat
$
  (d^2 r)/(d t^2) - r((d theta)/(d t))^2 = - (G M)/r^2 \
  2 (d r)/(d t) (d theta)/(d t) + r (d^2 theta)/(d t^2) = 0
$
We kunnen de tweede vergelijking ook schrijven als
$
  1/r d/(d t) (r^2 (d theta)/(d t)).
$
Omdat $1/r$ niet nul is, kunnen we deze negeren.
Bovendien zien we dat $r^2 (d theta)/(d t) = L$ met $L$ het impulsmoment.
Het impulsmoment is hier een constante omdat er geen netto krachtmoment is bij deze beweging aangezien er geen externe krachten zijn en de beweging radiaal is.
Samen met $E$ bepaalt dit de vorm van de baan.
Hieruit halen we
$
  (d theta)/(d t) = L/r^2.
$
Stel nu $u = 1/r$, dan is $r = 1/u$ en
$
  (d r)/(d t) &= - 1/u^2 (d u)/(d t) = - 1/u^2 (d u)/(d theta) (d theta)/(d t) \
  &= - 1/u^2 L u^2 (d u)/(d theta) = - L (d u)/(d theta)
$
Dan is $L/r^2 = L u^2$.
Vervolgens berekenen we
$
  (d^2 r)/(d t^2) = d/(d t) (-L (d u)/(d theta)) = -L (d^2 u)/(d theta^2) (d theta)/(d t) = - L^2 u^2 (d^2 u)/(d theta^2)
$
Als we dit invullen in (1) krijgen we
$
  - L^2 u^2 (d^2 u)/(d theta^2) - 1/u L^2 u^(4) = - G M u^2 \
  (d^2 u)/(d theta^2) + u = (G M)/L^2
$
Hieruit volgt
$
  u(theta) = 1/r = C cos(theta) + (G M)/L^2
$
waarbij $C$ een integratieconstante is met $C = (G M)/L^2 e$.
De letter $e$ staat voor de _eccentriciteit_ van de vorm.
We krijgen
$
  u(theta) &= (G M)/L^2 e cos(theta) + (G M)/L^2 \
  &= (G M)/L^2 (1 + e cos(theta))
$
Dan vormen we terug om naar $r$:
$
  r(theta) = 1/((G M)/L^2 (1 + e cos(theta)))
$
Er is sprake van een ellips als $e < 1$ en aangezien we het over de aarde hebben (die een $e$ net iets groter dan nul heeft, is dit ook het geval).
Dit is de vergelijking van een kegelsnede in poolcoördinaten, dus van een cirkel, parabool, hyperbool of ellips; in dit specifiek geval van een ellips waarbij de Zon zich in een van de brandpunten bevindt.
Dit is wat we moesten bewijzen. #h(1fr) $square$
