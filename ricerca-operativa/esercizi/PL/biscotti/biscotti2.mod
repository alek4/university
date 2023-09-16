set B;                                                                      # insieme di biscotti
set I;                                                                       # insieme ingredienti
param comp {I,B};                                             # composizione biscotti [%]
param pmg {B};                                                 # produzione massima giornaliera [kg/g]
param t {i in B} := 1/pmg[i];
param p {B};                                                        # prezzi di vendita biscotti [€/kg]
param c {I};                                                          # costi ingredienti [€/kg]
param min_ingr {I};                                            # qta minimie di ingredienti da acquistare [kg/settimana]
param min_prod {B};                                         # qta minime da produrre di biscotti [kg/settimana]
param max_prod {B};                                        # qta massima da produrre di biscotti [kg/settimana]
param budget;                                                     # budget trimestrale

# variabili
var x {i in B} >= min_prod[i], <= max_prod[i];          # qta di biscotti prodotti [kg/sett]
var y {i in I} >= min_ingr[i];                                                         # qta ingredienti acquistati [kg/sett]

# vincoli
subject to consumi{i in I}:
          sum{j in B} x[j] * comp[i,j]/100 <= y[i];
          
subject to tempo:
          sum {i in B} x[i] * t[i] <= 5;

subject to budget_sett:
          sum {i in I} y[i] * c[i] <= budget/12;
          
# obiettivo [€/sett]
maximize z: sum {i in B} x[i] * p[i] - sum {i in I} y[i] * c[i];

data;

set B := Svegliallegra Frollino Alba ProntiVia;
set I := Farina Uova Zucchero Burro Latte Additivi Nocciole;

param comp: Svegliallegra Frollino Alba ProntiVia :=
Farina          20           25           30           20
Uova            15            0           10           20
Zucchero        20           15           25           10
Burro            0            0           10           10
Latte           10           20           20           15
Additivi        15           20            0           15
Nocciole        10            0            0            0;

param pmg :=
Svegliallegra    165
Frollino  250
Alba 500
ProntiVia       250;

param p :=
Svegliallegra    1.75
Frollino 1.00
Alba 1.25
ProntiVia       1.50;

param c:=
Farina    0.5
Uova      2
Zucchero  0.5
Burro     1
Latte     1.5
Additivi  1
Nocciole  5;

param min_ingr:= 
Farina    450
Uova      200
Zucchero  320
Burro     140
Latte     320
Additivi  100
Nocciole   50;

param min_prod :=
Svegliallegra       50     
Frollino 100     
Alba 500    
ProntiVia   300;


param max_prod :=
Svegliallegra       300
Frollino 500
Alba 1000
ProntiVia       500;

param budget := 21600;

end;
