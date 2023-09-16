# editoria

# dati
param nA;
set A := 1..nA;
param p {A};			# numero pagine
param u {A};			# urgenza
param nF;				# numero fascicoli
set F := 1..nF;			# set fascicoli
param nP;				# numero pagine fascicoli

# variabili
var x {A, F} binary;	# assegnamento
var U;
var L;

# vincoli
subj to Assegnamento {a in A}:
	sum {f in F} x[a,f] <= 1;

subj to Capacity {f in F}:
	sum {a in A} p[a] * x[a,f] <= nP;

subj to Urgenza {a in A: u[a]>=1}:
	sum{f in F: f+u[a] <= 4} x[a,f] = 1;
	
# obiettivo1: rinviare il minimo numero di articoli
maximize z1: sum {a in A, f in F} x[a,f];

# obiettivo2: equilibrare i fascicoli (most uniform)
#minimize z2: U-L;
#subj to maxmin {f in F}: L <= sum {a in A} p[a] * x[a,f];
#subj to minmax {f in F}: U >= sum {a in A} p[a] * x[a,f];
#subj to NonPeggioramento: sum {a in A, f in F} x[a,f] >= ???

################################àà
data;
param nA := 12;

param: 		p		u := 
	 1	 	5		2
	 2		11		0
	 3		17		2
	 4		10		0
	 5		18		3
	 6	 	 8		0
	 7		14		0
	 8		 9		1
	 9		16		1
	10		12		0
	11		14		0
	12		13		0;

param nF := 3;
param nP := 44;

end;
