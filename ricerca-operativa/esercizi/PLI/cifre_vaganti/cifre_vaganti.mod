# cifre vaganti
# dati
param N;					
set Posizioni := 0..N-1;				# posizione 0=unità 3=migliaia, ogni posizione p pesa 10^p
set Cifre := 1..9;
set Speciale within Cifre;				# set cifre speciali
param S;								# somma fatta dalle cifre speciali
param k;								# numero di cifre speciali che devono comparire nei numeri

# variabili
var x1 {Posizioni, Cifre} binary;		# assegnamento che descrive il numero 1
var x2 {Posizioni, Cifre} binary;		# assegnamento che descrive il numero 2

# vincoli
# la stessa cifra non può comparire più volte
subject to TutteDiverse {c in Cifre}:
	sum {p in Posizioni} x1[p,c] <= 1;
	
# una cifra per ogni posizione
subject to Assign {p in Posizioni}:
	sum {c in Cifre} x1[p,c] = 1;
	
# permutazione delle cifre
# migliaia 1 = decine 2
subject to Permut1 {c in Cifre}:
	x1[3,c] = x2[1,c]
# centinaia 1 = unità 2
subject to Permut2 {c in Cifre}:
	x1[2,c] = x2[0,c]
# decine 1 = centinaia 2
subject to Permut3 {c in Cifre}:
	x1[1,c] = x2[2,c]
# unità 1 = migliaia 2
subject to Permut4 {c in Cifre}:
	x1[0,c] = x2[3,c]

# somma
subject to Somma:
	sum{p in Posizioni} 10^p * (sum {c in Cifre} x1[p,c] * c) + sum{p in Posizioni} 10^p * (sum {c in Cifre} x2[p,c] * c) = S; 
	
# k cifre speciali
subject to Speciali:
	sum {p in Posizioni, c in Speciali} x1[p,c] = k;
	
# no obiettivo???? non ho massimo ne minimo

###########################################
data;

param N := 4;
set Speciale := 1 2 6 8;
param S := 8612;
param k := 2;

end;