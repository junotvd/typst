#set page(margin: (x: 4.0cm), numbering: "1")
#set text(font: "eb garamond", number-type: "lining", size: 10pt, lang: "nl")
#show math.equation: set text(font: "garamond-math", stylistic-set: 11)
#show math.equation.where(block: true): set par(spacing: 1.2em)
#set par(spacing: 0.55em, justify: true, leading: 0.55em, first-line-indent: (
  amount: 1.5em,
  all: true,
))
#set heading(numbering: "1.1")
#show heading.where(level: 1): smallcaps
#show heading.where(level: 1): set align(center)
#show heading.where(level: 3): set heading(numbering: none)
#show heading: set text(font: "cormorant garamond")
#show heading: block.with(above: 1.5em, below: 1.5em)
#show heading: set par(justify: false)
#show strong: set text(font: "cormorant garamond")
#set table(stroke: (x, y) => (
  left: if x > 0 { 0.5pt },
  top: if y > 0 { 0.5pt },
))
#set list(indent: 1em, body-indent: 0.5em)
#set enum(numbering: "(a)", indent: 1em, body-indent: 0.5em)
#show enum: set par(spacing: 1.0em)


= $sigma$-algebra

Een $sigma$-*algebra* van verzamelingen die gesloten is onder aftelbare vereniging.

#let def(body) = block(
  width: 100%,
  above: 1.2em,
  below: 1.2em,
)[
  #set par(first-line-indent: 0em)
  *Definitie* #body
]

#block(
  width: 100%,
  above: 1.0em,
  below: 1.0em,
  stroke: (left: 1.0pt),
  inset: (left: 0.5em, bottom: 0.0em),
)[
  *Definitie 1.1.* Een familie $cal(A)$ van deelverzamelingen van een verzameling $Omega$ is een $sigma$-_algebra van verzamelingen over_ $Omega$ als aan de volgende eigenschappen is voldaan:
  + $Omega in cal(A)$

  + $forall X in cal(A): X^(cal(C)) (= Omega without X) in cal(A)$
  + $forall X_1, X_2, dots in cal(A) : X_1 union X_2 union dots.h.c in cal(A)$
]
De enige verstrakking ten opzichte van de definitie van een algebra van verzamelingen is dat $cal(A)$ niet alleen voor eindige, maar ook voor aftelbaar oneindige verenigingen gesloten moet zijn.

De verzameling $Omega$ wordt in dit verband *universele verzameling* of *universum* genoemd.

De elementen van $cal(A)$ heten meetbare verzamelingen (gebeurtenissen in de kansrekening) en het koppel $(Omega, cal(A))$ een meetbare ruimte.


= Open en gesloten verzamelingen, recursief gedefinieerde rijen
We behandelen in deze paragraaf enkele begrippen die samenhangen met open en gesloten verzamelingen.
Een open verzameling is een veralgemening van een open interval.
Een gesloten verzameling is een veralgemening van een gesloten interval.

== Open en gesloten verzamelingen
We beginnen met de begrippen inwendig en uitwendig punt en randpunt.


#def[
  Zij $A subset RR$ en $x subset RR$.
  + We noemen $x$ een *inwendig punt* van $A$ als
    $ exists r > 0 : lr(\]x-r, x+r\[) subset A. $
    In dat geval noemen $A$ een *omgeving* van $x$.

  + We noemen $x$ een *uitwendig punt* van $A$ als
    $
      exists r > 0 : lr(\]x-r, x+r\[) inter A = emptyset
    $

  + In alle andere gevallen noemen we $x$ een *randpunt* van $A$.
]
Merk op dat in Definitie ... niet geëist wordt dat $x in A$.
Het is echter eenvoudig in te zien dat een inwendig punt altijd tot $A$ behoort en een uitwendig punt nooit tot $A$ behoort.
Een randpunt kan zowel tot $A$ behoren, als niet tot $A$ behoren.

Uit de definities volgt eenvoudig dat $x$ een randpunt is van $A$ als en slechts als voor elke $r > 0$ het interval $lr(\]x-r, x+r\[)$ zowel elementen van $A$ als elementen van $RR without A$ bevat.
De verzameling van randpunten van $A$ noteren we met $partial A$.
