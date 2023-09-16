#biscotti
#DATI
set B;#insieme biscotti
set I; # ingredienti per biscotti
param ingredienti{I , B};
param max_t{B}; # massima produzione biscotto se produco solo quello
param prezzi{B};
param costo_i{I}; #costo di ciascun ingrediente 
param q_min{I}; #quantita da acquistare a settimana di ingredienti 
param prod_min{B}; #quantità minima da produrre 
param prod_max{B}; #quantità max da produrre 
param budget; #budget per 12 settimane di 5 giorni lavorativi
param c_pub; #costo pubblicita 12 settimane di 5 giorni lavorativi



#VARIABILI

var x{B}>=0; #quantità prodotte di ogni biscotto trimestralmente
var z{I}>=0; #quanti ingredienti acquisto trimestralmente

#VINCOLI

#vincolo su limite ingredienti usati
subject to numero_ingredienti_usati{i in I}: z[i] >= sum{b in B}x[b]*ingredienti[i , b];

#vincolo sul minimo acquisto degli ingredienti
subject to min_ingredienti{i in I}: z[i]/12>=q_min[i];

#vincolo sul  tempo dedicato alla produzione totale dei biscotti
subject to tempo_lav: sum{b in B}x[b]/max_t[b]<=60;

#vincolo produzione minima
subject to min_prod{b in B}: x[b]/12>= prod_min[b];

#vincolo produzione massima
subject to max_prod{b in B}: x[b]/12<= prod_max[b];

#vincolo acquisto ingredienti in base al budget
subject to lim_budget: (sum{i in I}costo_i[i]*z[i])<=budget;


#OBIETTIVO

#massimizzazione profitto
maximize h  : sum{b in B}(x[b] * prezzi[b]);

###############
data;

set B := Svegliallegra   Frollino_del_mattino  Alba_radiosa  ProntiVia ;

set I := Farina , Uova , Zucchero Burro , Latte  ,  Additivi  ,  Nocciole  , Acqua   ;

param ingredienti : Svegliallegra   Frollino_del_mattino  Alba_radiosa ProntiVia :=
Farina          0.20           0.25           0.30           0.20
Uova            0.15            0           0.10           0.20
Zucchero        0.20           0.15           0.25           0.10
Burro            0            0           0.10           0.10
Latte           0.10           0.20           0.20          0.15
Additivi        0.15           0.20            0           0.15
Nocciole        0.10            0            0            0
Acqua           0.10           0.20            0.5           0.10;

param max_t :=
Svegliallegra    165
Frollino_del_mattino  250
Alba_radiosa     500
ProntiVia      250;

param prezzi :=
Svegliallegra    1.75
Frollino_del_mattino  1.00
Alba_radiosa     1.25
ProntiVia       1.50;

 param costo_i :=
Farina    0.5
Uova      2
Zucchero  0.5
Burro     1
Latte     1.5
Additivi  1
Nocciole  5
Acqua 0;

param q_min :=
Farina    450
Uova      200
Zucchero  320
Burro     140
Latte     320
Additivi  100
Nocciole   50
Acqua 0;

param prod_min :=
Svegliallegra       50    
Frollino_del_mattino    100    
Alba_radiosa       500    
ProntiVia         300    ;

param prod_max :=
Svegliallegra      300    
Frollino_del_mattino    500    
Alba_radiosa       1000    
ProntiVia         500    ;

param budget := 21600;  

param c_pub := 5000;


end;


