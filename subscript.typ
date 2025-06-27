#show math.equation: set text(font: "New Computer Modern Math")
#set text(font: "New Computer Modern")
#set page(height: auto, margin: 0.5cm)

$(x_(n_k))_(k in NN)$, $(x_n)_(n in NN_0)$

#show math.attach: it => {
  if it.base.func() == math.lr {
    let attachments = it.fields()
    _ = attachments.remove("base")
    it.base
    math.attach(sym.zws, ..attachments)
  } else {
    it
  }
}
$(x_(n_k))_(k in NN)$, $(x_n)_(n in NN_0)$
#lorem(20)\
$\(x_(n_k)\)_(k in NN)$, $(x_n)_(n in NN_0)$
#lorem(20)\

Zij $(x_n)_(n in NN_0)$ een rij in $RR$.
Neem nu een deelrij $(x_(n_k))_(k in NN)$ van bovenstaande rij.
Dan kunnen we zien dat voor een bepaalde waarde van de deelrij van de bovenstaande, vooraf gedefinieerde rij in $RR$, yappayappa.


$(x_(n_k))_(k in NN)$, $(x_n)_(n in NN_0)$


$(x_(n_k))_(k in NN)$,


$(x_(n))_(n in NN_0)$
