
set prod_type := 1..2;
param costo_prod {prod_type};						# costo produzione [€/pezzo]
param costo_stock ;											# costo giacenza [€/pezzo]
param cap_prod {prod_type};							# capacità produttiva [pezzi/settimana]

set settimane := 1..6;
param domanda {settimane};						# previsione di domanda [pezzi/settimana]

param y0;

# variabili
var x {i in settimane, j in prod_type} >= 0;
var y {i in settimane, j in prod_type} >= 0;

# vincoli
subject to fcc {i in settimane : i > 1}:
		sum {j in prod_type} (y[i-1,j] + x[i,j]) = domanda[i] + sum{j in prod_type} y[i,j];

subject to fcc1:
		sum {j in prod_type} (y0 + x[1,j]) = domanda[1] + sum{j in prod_type} y[1,j];

# obiettivo
minimize z: sum {i in settimane} (sum{j in prod_type} x[i,j] * costo_prod[j]) + sum {i in settimane} (sum {j in prod_type} y[i,j]) * costo_stock; 


data;

param y0 := 0;

param costo_prod :=
1		300
2		330;

param costo_stock := 10;

param cap_prod :=
1		110
2		55;

param domanda :=
1		100
2		130
3		150
4		100
5		170
6		160;

end;
