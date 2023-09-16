# Esercizio idrocarburi

# DATI
set Sostanze;
set Benzine;
param b {Sostanze};											# Quantit� max disponibili [barili/giorno]
param c {Sostanze};											# Prezzo delle sostanze [$/barile]
param r {Benzine};											# Prezzi di vendita delle benzine [$/barile]
param amin {Sostanze,Benzine};					# Percentuale minima
param amax {Sostanze,Benzine};					# Percentuale massima

# VARIABILI
var x {i in Sostanze, j in Benzine} >= 0;		# Quantit� di sostanza in ogni benzina [barili]
var q {Benzine} >= 0;

# VINCOLI
subject to TotaleProd {j in Benzine}:
		q[j] = sum {i in Sostanze} x[i,j];
 
# Vincolo sulle quantit� consumate per ogni sostanza [barili/giorno]
subject to Consumi {i in Sostanze}:
		sum {j in Benzine} x[i,j]  <= b[i];

subject to Composizione_min {i in Sostanze, j in Benzine}:
		x[i,j] >= amin[i,j]/100 * q[j];
subject to Composizione_max {i in Sostanze, j in Benzine}:
		x[i,j] >= amax[i,j]/100 * q[j];

# OBIETTIVO
# Massimizzazione dei profitti [$/giorno]
maximize z: sum {j in Benzine} r[j] * sum {i in Sostanze} x[i,j]
						- sum {i in Sostanze} c[i] * sum {j in Benzine} x[i,j];

#############################
data;

set Sostanze := A B C D
set Benzine := Normale Super Verde;

param amin: Nomale	Super		Verde :=
A						30				50			70
B						  0				  0			  0
C						50				  0			  0
D						  0				  0			  0;

param amax: Nomale	Super		Verde :=
A						  100				50			70
B						    40				  0			  0
C						  50				  0			  0
D					   	    0				  0			  0;

param: b 				c:=
A			3000			3
B			2000			6
C			4000			4
D			1000			5;

param r :=
Normale		5.5
Super				4.5
Verde				3.5;

end;