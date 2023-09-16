# Esercizio inviti a cena
# DATI
param n;																# numero di vertici
set N := 1..n;															# insieme di vertici del grafo
param w {N};														#peso di ogni vertice
#param m;																# numero di edge nel grafo
set E within N cross N;														# insieme degli edge

# VARIABILI
var x {N} binary;												# selezione dei vertici

# Vincoli
subject to Incompatibility {i in N, j in N: (i,j) in E}:
		x[i] + x[j] <= 1;

# Obiettivo
maximize z: sum {i in N} w[i] * x[i];

##############################
data;
param n := 8;
#param m := 13;

param w :=
1		100
2		100
3		90
4		85
5		50
6		20
7		15
8		10;

set E := (1,2) (1,3) (2,3) (3,4) (2,4) (2,5) (3,6) (4,7) (5,6) (5,7) (6,7) (5,8) (6,8);

end;
