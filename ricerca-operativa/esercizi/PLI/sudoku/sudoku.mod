# sudoku

# dati
param nR := 9;
set R := 1..nR;
param nC := 9;
set C := 1..nC;
set K := 1..9;
set MR := 1..3;
set MC := 1..3;

# variabili
var x {R,C,K} binary;		# assegnamento riga, colonna e cifra

# vincoli
subj to RigaColonna {r in R, c in C}:
	sum {k in K} x[r,c,k] = 1;
subj to RigaCifra {r in R, k in K}:
	sum {c in C} x[r,c,k] = 1;
subj to ColonnaCifra {c in C, k in K}:
	sum {r in R} x[r,c,k] = 1;

subj to Quadrato {k in K, h1 in MR, h2 in MC}:
	sum {r in R, c in C: r >= 3*h1-2 and r <= 3*h1 and c >= 3*h2-2 and c <= 3*h2} x[r,c,k] = 1;
	