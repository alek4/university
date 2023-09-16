# esercizio ordini

# dati
param N;
set O := 1..N;		# insieme ordini
param p {O};		# processing time
param d {O};		# due date di ogni ordine

# variabili
var x {O,O} binary;	# matrice di precedenze x(i,j) = 1 <=> i precede j
var c {O};			# tempo di completamento di ogni ordine
var t {O} >= 0;		# tardiness di ogni 
var TMAX >= 0;		# massima tardiness

# vincoli
subj to NoLoop3 {i in O, j in O, k in O: i <> j and j <> k and i <> k}:
	x[i,j] + x[j,k] + x[k,i] <= 2;

subj to Nodiag {i in O}:
	x[i,i] = 0;
	
subj to Preced {i in O, j in O: i<>j}:
	x[i,j] + x[j,i] = 1;

subj to Completion {i in O}:
	c[i] = sum {j in O} p[j] * x[j,i] + p[i];
	
subj to Tardiness {i in O}:
	t[i] >= c[i] - d[i];
	
# obiettivo
# (a) minimizzare somma tardiness
minimize z1: sum {i in O} t[i];
# (b) minimizzare ritardo massimo
#minimize z2: TMAX;
#subj to MaxTardiness {i in O}:
#	TMAX >= t[i];

data;
param N := 10;

param: 		 p		 d :=
	 1		24		 50
	 2		12		 50
	 3		30		 90
	 4		15		 70
	 5		18		 50
	 6	 	 7		 80
	 7	 	 8		100
	 8		15	 	 90
	 9		14		120
	10		22		150;
 
end;
