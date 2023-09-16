# DATI
set V;
param rs {V};														# Resa della superficie coltivata (litri/mq)
param pv  {V};														# Prezzo di vendita (Euro/litro)
param qta_min {V};											# Limiti minimi di quantità di vino prodotta (litri)
param qta_max {V};											# Limiti massimi di quantità di vino prodotta (litri)
param colt {V};													# Coltivazione attuale (ettari)

# VARIABILI
var x {i in V} >= qta_min[i];								# qta prodotta per ogni vigneto (litri)
var y {i in V} >= 0;												# qta terra coltivata (ettari)

# VINCOLI
subject to MaxProd {i in V}:
		x[i] <= qta_max[i];
		
subject to MaxColt {i in V}:
		y[i] <= colt[i];

subject to Produzione {i in V}:
		x[i] = y[i] * rs[i] * 10000;

subject to MaxDivVit {i in V, j in V}:
		y[i] <= y[j] * 3;

subject to MaxDivVin {i in V, j in V}:
		x[i] <= x[j] * 4;

# OBIETTIVO
maximize z: sum{i in V} x[i] * pv[i];

##############################
data;

set V := Silvaner, Riesling, Pinot, Mueller-T, Merlot;

param rs :=
Silvaner 		1.2
Riesling 		0.9
Pinot 				1.0
Mueller-T 		0.8
Merlot 			1.4;

param pv :=
Silvaner 		4.50
Riesling 		5.00
Pinot 				4.00
Mueller-T 		3.00
Merlot 			3.50;

param: 			qta_min			qta_max :=
Silvaner 		150000 			1500000
Riesling 		200000 			1200000
Pinot 				100000 			  950000
Mueller-T	 	150000 			  800000
Merlot 			100000 			1500000;

param colt :=
Silvaner 		95
Riesling 		125
Pinot 				95
Mueller-T		100
Merlot 			85;

end;
