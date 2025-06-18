#import "lib.typ": *

#show: template.with(
  author: "jvd",
  title: "test",
  // toc: true,
  // titlepage: true
)


= #lorem(5)
#lorem(20)
#sidenote[#lorem(45) #align(center, [$R: X times Y -> RR$]) #lorem(80)]
#lorem(50)

#definition()[
  #lorem(15)
  $
    forall x,y,z in R: ((x,y) in R and (y,z) in R) ==> (x,z) in R.
  $
  #lorem(10)
]

#lorem(20)

#algoritm("Examenresultaat morgen")[
  ```Python
  def exam(baseline)
  h = 60
  for t in range(4 * h)
    res_exp += baseline
  return res_exp
  ```
]
