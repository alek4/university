# Esercizio "tempo e' denaro"

# DATI
param nP;
param nC;
set P := 1..nP;
set C := 1..nC;
param c {P};					# Ricavi [€/u]
param t {P};					# tempo assemblaggio [hu/u]
param a {C, P};					# coefficienti tecnologici [pezzi/motociclo]
param b {C};					# dsponibilità materie prime [pezzi/mese]


# VARIABILI
var x {P} >= 0;					# produzione [u/m]

# VINCOLI
# ivncolo consumo componenti [pezzi/mese]
subject to Consumi {i in C}:
	sum {j in P} a[i,j] * x[j] <= b[i];

# OBIETTIVO
# massimizzazione profitti [€/m]
maximize z: sum {j in P} c[j] * x[j];

##################################

data;

param nP := 3;
param nC := 3;

param c := 
    1      1200
    2      1300
    3      1200;
    
param t := 
   1        1
   2        1
   3        1;
   
param a:  	  1       2       3 :=
   1         10      12      14
   2          5       7       6
   3         10      15       9;

param b :=
   1       91
   2       40
   3       59;
   
end;
