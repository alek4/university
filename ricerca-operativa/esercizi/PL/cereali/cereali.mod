# Esercizio Cereali
# DATI

param nC;
set Cereali := 1..nC;
param nT;
set Terreni := 1..nT;
param p {Cereali};												# Profitti unitari [€/q]
param a {Terreni, Cereali};								# Fabbisogno di area
param h {Cereali};												# Fabbisogno di acqua
param H;
param A {Terreni};											# Area disponibile [acri]

# VARIABILI

var x {Terreni,Cereali} >= 0;							#Quantità coltivata [q]

# VINCOLI
# Area disponibile
subject to Consumo_area {i in Terreni}:
		sum {j in Cereali} a[i,j] * x[i,j] <= A[i];

#Acqua disponibile
subject to Consumo_acqua:
		sum {i in Terreni, j in Cereali} h[j] * x[i,j] <= H;

# OBIETTIVO
maximize Profitti: sum {i in Terreni, j in Cereali} p[j] * x[i,j];

##############################
data;

param nC := 6;
param nT := 2;

param :		p		h :=
1		48				120
2		62				160
3		28				100
4		36				140
5		122				215
6		94				180;

param a :		1		2		3		4		5		6 :=
1						0.02	0.03	0.02	0.016 	0.05	0.04
2						0.02	 0.034	0.024	0.02	0.06	0.034;

param H := 400000;

param A :=
1		200
2		400;

end;
