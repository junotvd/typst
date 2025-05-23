#import "@preview/physica:0.9.5": *
#import "form.typ": conf
#show: conf.with()

= Calculus formules

=== Differentiatie regels
#grid(
  columns: (1fr, 1fr, 1fr),
  align: left + horizon,
  block($
    dv(, x)(f(x) + g(x)) = f'(x) + g'(x)
  $),
  block($
    dv(, x)(c f(x)) = c f'(x)
  $),
  block($
    dv(, x)(f(x) g(x)) = f'(x) g(x) + f(x) g'(x)
  $),

  v(1em), v(1em), v(1em),
  block($
    dv(, x)(1 / f(x)) = -(f'(x)) / ((f(x))^2)
  $),
  block($
    dv(, x)((f(x)) / (g(x))) = (f'(x) g(x) - f(x) g'(x)) / ((g(x))^2)
  $),
  block($
    dv(, x)f(g(x)) = f'(g(x)) g'(x)
  $),
)


=== Elementaire afgeleiden
#grid(
  columns: (1fr, 1fr, 1fr),
  align: left + horizon,
  row-gutter: 0.3em,
  block($
    dv(, x) x^r = r x^(r-1)
  $),
  block($
    dv(, x) a^x = a^x ln a space.quad (a > 0)
  $),
  block($
    dv(, x) ln x = 1 / x space.quad (x > 0)
  $),

  block($
    dv(, x) sin x = cos x
  $),
  block($
    dv(, x) cos x = -sin x
  $),
  block($
    dv(, x) tan x = sec^2 x
  $),

  block($
    dv(, x) sec x = sec x tan x
  $),
  block($
    dv(, x) csc x = -csc x cot x
  $),
  block($
    dv(, x) cot x = -csc^2 x
  $),

  block($
    dv(, x) sin^(-1) x = 1 / sqrt(1 - x^2)
  $),
  block($
    dv(, x) tan^(-1) x = 1 / (1 + x^2)
  $),
  block($
    dv(, x) abs(x) = sgn x = x / abs(x)
  $),
)


=== Trigonometrische identiteiten
#grid(
  columns: (1fr, 1fr, 1fr),
  align: left + horizon,
  row-gutter: 0.4em,
  block($
    sin^2 x + cos^2 x = 1
  $),
  block($
    sin(-x) = -sin x
  $),
  block($
    cos(-x) = cos x
  $),

  block($
    sec^2 x = 1 + tan^2 x
  $),
  block($
    sin(pi - x) = -sin x
  $),
  block($
    cos(pi - x) cos x
  $),

  block($
    csc^2 x = 1 + cot^2 x
  $),
  block($
    sin(pi / 2 - x) = cos x
  $),
  block($
    cos(pi / 2 - x) = sin x
  $),

  block($
    sin(x plus.minus y) = sin x cos y = cos x sin y
  $),
  block($
    cos(x plus.minus y) = cos x cos y minus.plus sin x sin y
  $),
  block($
    tan(x plus.minus y) = (tan x plus.minus tan y) / (1 minus.plus tan x tan y)
  $),

  block($
    &sin 2x = 2 sin x cos x \
    &cos 2x = 2cos^2 x - 1 = 1 - 2sin^2 x
  $),
  block($
    sin^2 x = (1 - cos 2x) / 2
  $),
  block($
    (1 + cos 2x) / 2
  $),
)

=== Kwadratische vergelijking
$
  text("Als") A x^2 + B x + C = 0, text("dan") x = (-B plus.minus sqrt(B^2 - 4 A C)) / (2 A)
$


=== Vectoridentiteiten
#grid(
  columns: (1fr, auto),
  align: left + horizon,
  // stroke: 1pt,
  block($
    text("Als") & u_1 bold(i) + u_2 bold(j) + u_3 bold(k) \
    & v_1 bold(i) + v_2 bold(v) + v_3 bold(k) \
    & w_1 bold(i) + w_2 bold(w) + w_3 bold(k)
  $),
  block($
    & text("(dot product)")
    && bold(u) dot bold(v)
    & = & bold(u)_1 bold(v)_1 + bold(u)_2 bold(v)_2 + bold(u)_3 bold(v)_3 \
    & text("(cross product)")
    && bold(u) times bold(v)
    & = & matrixdet(
      bold(i), bold(j), bold(k);
      u_1, u_2, u_3;
      v_1, v_2, v_3
    ) \
    &&&& = & (u_2 v_3 - u_3 v_2)bold(i) + (u_3 v_1 - u_1 v_3)bold(j) + (u_1 v_2 - u_2 v_1)bold(k)
  $),

  // ---
  v(1em), v(1em),
  // ---

  block($
    text("lengte van") bold(u)
    = abs(u) = sqrt(u_1^2 + u_2^2 + u_3^2)
  $),
  block($
    text("hoek tussen") bold(u) text("en") bold(v)
    = cos^(-1)((bold(u) dot bold(v)) / (abs(bold(u)) abs(bold(v))))
  $),

  // ---
  v(1em), v(1em),
  // ---

  block($
    text("drievoudig product")
  $),
  block($
    &bold(u) dot (bold(v) times bold(w))
    &=& bold(v) dot (bold(w) times bold(u)) = bold(w) dot (bold(u) times bold(v)) \
    &bold(u) times (bold(v) times bold(w))
    &=& bold(u) times (bold(u) dot bold(w)) bold(v) - (bold(u) dot bold(v)) bold(w)
  $)
)


=== Identiteiten m.b.t. gradient, divergentie, curl en Laplaciaan
#grid(
  columns: (1fr, 1fr),
  align: left + horizon,
  // gutter: 0.35em,
  // stroke: 1pt,
  // ---
  block($
    grad = bold(i) pdv(, x) + bold(j) pdv(, y) + bold(k) pdv(, z) space.quad text("\"del\" of \"nabla\" operator")
  $),
  block($
    bold(F)(x,y,z) = F_1(x,y,z) bold(i) + F_2(x,y,z) bold(j) + F_3(x,y,z) bold(k)
  $),

  // ---
  v(1em), v(1em),
  // ---

  block($
    grad phi.alt(x, y, z) = pdv(phi.alt, x)bold(i) + pdv(phi.alt, y)bold(j) + pdv(phi.alt, z)bold(k)
  $),
  block($
    div bold(F)(x,y,z) = pdv(F_1, x) + pdv(F_2, y) + pdv(F_3, z)
  $),

  // ---
  v(1em), v(1em),
  // ---

  [],
  block($
    curl bold(F)(x,y,z) & = op("curl") bold(F)(x,y,z) = matrixdet(bold(i), bold(j), bold(k); pdv(, x), pdv(, y), pdv(, z); F_1, F_2, F_3) \
    & = (pdv(F_3, y)-pdv(F_2, z))bold(i) + (pdv(F_1, z)-pdv(F_3, x))bold(j) + (pdv(F_2, x)-pdv(F_1, y))bold(k)
  $),

  // ---
  v(1em), v(1em),
  // ---

  block($
    & grad (phi.alt psi) & = & phi.alt grad psi + psi grad phi.alt \
    & div (phi.alt bold(F)) & = & (grad phi.alt) times bold(F) + phi.alt(div bold(F)) \
    & curl (phi.alt bold(F)) & = & (grad phi.alt) times bold(F) + phi.alt (curl bold(F)) \
    & curl (grad phi.alt) & = & bold(0)
  $),
  block($
    & div (bold(F) times bold(G)) & = & (curl bold(F)) dot bold(G) - bold(F) dot (curl bold(G)) \
    & curl (bold(F) times bold(G)) & = & bold(F)(div bold(G)) - bold(G)(div bold(F)) - (bold(F) dot grad)bold(G) + (bold(G) dot grad)bold(F) \
    & grad (bold(F) dot bold(G)) & = & bold(F) times (curl bold(G)) + bold(G) times (curl bold(F)) + (bold(F) dot grad)bold(G) + (bold(G) dot grad)bold(F) \
    & div (curl bold(F)) & = & 0 \
  $),

  // ---
  v(1em), v(1em),
  // ---

  block($
    & laplacian phi.alt(x, y, z) & = & div grad phi.alt(x, y, z)
    && = & pdv(phi.alt, x, 2) + pdv(phi.alt, y, 2) + pdv(phi.alt, z, 2)
  $),
  block($
    curl (curl bold(F)) = grad (div bold(F)) - laplacian bold(F)
  $),
)


=== Varianten fundamentele stelling van Calculus

#grid(
  columns: (1fr, 1fr),
  align: left + top,
  // stroke: 0.5pt,
  block($
    1 text("dimensie")
  $),
  block($
    integral_a^b f'(t) d t = f(b) - f(a)
  $),
  // ---
  v(1em), v(1em),
  // ---

  [],
  block($
    integral_C grad phi.alt dot d bold(r) = phi.alt(bold(r)(a)) text("als") C text("de kromme") bold(r) = bold(r)(t) text("is, met") a <= t <= b
  $),

  // ---
  v(1em), v(1em),
  // ---

  block($
    text("Theorema van Green")
  $),
  block($
    & integral.double_R (pdv(F_2, x) - pdv(F_1, y)) d A
    & = & integral.cont_C bold(F) dot d bold(r) \
    && = & integral.cont_C F_1(x,y) + F_2(x,y) d y \
    &&& text("waarbij") C text("de positieve grens is van") R
  $),

  // ---
  v(1em), v(1em),
  // ---

  block($
    text("Theorema van Stokes")
  $),
  block($
    & integral.double_S curl bold(F) dot hat(bold(N)) d S
    & = & integral.cont_C bold(F) dot d bold(r) \
    && = & integral.cont_C F_1(x,y,z) d x + F_2(x,y,z) d y + F_3(x,y,z) d z \
    &&& text("waarbij") C text("de georienteerde grens is van") S
  $),

  // ---
  v(1em), v(1em),
  // ---

  grid.cell(align: center + horizon, colspan: 2)[3D varianten],
  v(1em), v(1em),

  block($
    text("Divergentie theorema")
  $),
  block($
    integral.triple_D div bold(F) d V
    = integral.surf_S bold(F) dot hat(bold(N)) d S
  $),

  // ---
  v(1em), v(1em),
  // ---

  [],
  block($
    integral.triple_D grad phi.alt d V
    = integral.surf_S phi.alt hat(bold(N)) d S
  $),

  // ---
  v(1em), v(1em),
  // ---

  [],
  block($
    integral.triple_D curl bold(F) d V
    = -integral.surf_S bold(F) times hat(bold(N)) d S
  $),
)


=== Formules over krommen in driedimensionale ruimte
#grid(
  columns: (1fr, 1fr, 1fr),
  align: left + horizon,
  // stroke: 0.5pt,
  block($
    text("Kromme:") bold(r) = bold(r)(t) = x(t) bold(i) + y(t) bold(j) + z(t) bold(k)
  $),
  block($
    text("Velociteit:") bold(v) = dv(bold(r), t) = v hat(bold(T))
  $),
  block($
    text("Snelheid:") v = abs(bold(v)) = dv(s, t)
  $),

  v(1em), v(1em), v(1em),

  block($
    text("Booglengte:") s = integral_(t_0)^t v d t
  $),
  block($
    text("Versnelling") bold(a) = dv(bold(v), t) = dv(bold(r), t, 2)
  $),
  block($
    text("Tangentiele componenten:") bold(a) = dv(v, t) hat(bold(T))
  $),

  v(1em), v(1em), v(1em),

  block($
    text("Unit tangent:") hat(bold(T)) = bold(v) / v
  $),
  block($
    text("Binormaal:") hat(bold(B)) = (bold(v) times bold(a)) / (abs(bold(v) times bold(a)))
  $),
  block($
    text("Normaal:") hat(bold(N)) = hat(bold(B)) times hat(bold(T)) = (d hat(bold(T)) slash d t) / (abs(d hat(bold(T)) slash d t))
  $),

  v(1em), v(1em), v(1em),

  block($
    text("Kromming:") kappa = (abs(bold(v) times bold(a))) / (v^3)
  $),
  block($
    text("Kromtegraad:") rho = 1 / kappa
  $),
  block($
    text("Torsie") tau = ((bold(v) times bold(a)) dot (d bold(a) slash d t)) / (abs(bold(v) times bold(a))^2)
  $),

  v(1em), v(1em), v(1em),
  grid.cell(colspan: 3, align: center + horizon)[Frenet-Serret formules],
  v(1em), v(1em), v(1em),

  block($
    dv(hat(bold(T)), s) = kappa hat(bold(N))
  $),
  block($
    dv(hat(bold(N)), s) = -kappa hat(bold(T)) + tau hat(bold(B))
  $),
  block($
    dv(hat(bold(B)), s) = -tau hat(bold(N))
  $),
)
