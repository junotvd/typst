#import "lib.typ": *
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
