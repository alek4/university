# Gioco coi numeri

# dati
param nP;					# numero di posizioni
set P := 1..nP;				# insieme delle posizioni
param V {P};				# vettore di cifre date
param soglia;
param MaxP := log(soglia)/log(10);
set Potenze := 0..MaxP;

# variabili
var x {P, Potenze} binary;	# Assegnamento tra posizioni e potenze di 10

# vincoli
# valore massimo del nuero totale
subject to Totale:
	sum {i in P, j in Potenze} V[i] * 10^j * x[i,j] <= soglia;

# vincoli di assegnamento
subject to Num_potenze {i in P}:
	sum {j in Potenze} x[i,j] = 1;
	
# vincoli sulla posizione delle potenze
subject to Formanumeri {i in P, j in Potenze: j>=1 and i<nP}:
	x[i,j] <= x[i+1,j-1];

# vincolo su ultima cifra
subject to Unity:
	x[nP, 0] = 1;

# obiettivo
# massimizzare somma
maximize z: sum {i in P, j in Potenze} V[i] * 10^j * x[i,j];

data;

param nP := 9;
param soglia := 1000;
param V := 
1	9
2	8
3	7
4	6
5	5
6	4
7	3
8	2
9	1;

end;
