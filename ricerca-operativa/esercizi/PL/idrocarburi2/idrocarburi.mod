# Idrocarburi
# problema di miscelazione

set Benzine := super normale verde;
set Sostanze := A B C D;

param Risorse {Sostanze};								# barili giornalieri disponibili per ogni sostanza
param Costi {Sostanze};									# costo di un barile per ogni sostanza [€/barile]
param Ricavi {Benzine};									# ricavi per ogni barile di benzina [€/barile benzina]

param min_sostanze {Sostanze, Benzine};  # limiti minimi di sostanze contenute in ogni tipo di benzina [%]
param max_sostanze {Sostanze, Benzine}; # limiti massimi di sostanze contenute in ogni tipo di benzina [%]

# variabili
var x {Benzine} >= 0;													# barili prodotti per ogni tipo di benzina
var y {Sostanze}	>= 0;												# barili usati per ogni tipo di sostanza

# vincoli
subject to minimo_sostanze {i in Sostanze, j in Benzine}:
		y[i] >= min_sostanze[i,j] * x[j];

subject to massimo_sostanze {i in Sostanze, j in Benzine}:
		y[i] <= max_sostanze[i,j] * x[j];

subject to risorse_disponibili {i in Sostanze}:
		y[i] <= Risorse[i];

# obiettivo
maximize z: sum {i in Benzine} x[i] * Ricavi[i] - sum {j in Sostanze} y[j] * Costi[j];

data;

param Risorse :=
A		3000
B		2000
C		4000 
D		1000;

param Costi :=
A		3
B		6
C		4 
D		5;

param Ricavi := 
super 			5.5
normale 		4.5
verde				3.5;

param min_sostanze: super 		normale 		verde :=
A											0.0				0.0				  0.0
B											0.4				0.1				  0.0
C											0.0				0.0				  0.0
D											0.0				0.0				  0.0;

param max_sostanze: super 		normale 		verde :=
A											0.3				0.5				  0.7
B											1.0				1.0				  1.0
C											0.5				1.0				  1.0
D											1.0				1.0				  1.0;


end;
