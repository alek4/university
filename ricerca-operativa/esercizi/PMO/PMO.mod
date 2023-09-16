# Esercizio PMO

#DATI
set P;
set R;
param a {R, P};
param b {R};
param c1 {P};
param c2 {P};
#param z1;															# termine noto del vincolo su cui fare analisi parametrica

#VARIABILI
var x {P} >= 0;

#BINCOLI
subject to Consumi {i in R}:
		sum {j in P} a[i,j] * x[j] <= b[i];
		
#OBIETTIVI
#maximize z1: sum {j in P} c1[j] * x[j];
maximize z2: sum {j in P} c2[j] * x[j];

subject to obj1: 
		sum {j in P} c1[j] * x[j] >= 27.130;
#####################

data;

set P := X Y Z W;
set R := A B C D;

param a: X Y Z W :=
A				3 2 5 4
B				8 10 1 1
C				1 3 6 5
D				2 0 8 11;

param b :=
A 100
B 120
C 90
D 110;

param: c1 c2 :=
X				1.0	1.7
Y				1.5	0.4
Z				1.1	2.0
W			2.5	0.7;