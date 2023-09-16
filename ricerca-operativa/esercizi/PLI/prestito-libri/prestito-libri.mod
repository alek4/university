# biblioteca tipo?

param nR;				# numero richieste
set R := 1..nR;
param s {R};
param e {R};
param libro {R};

# variabili
var x {R} binary;		# seelzione richieste soddisfatte

# vincoli
subj to Incompatibility {r1 in R, r2 in R: libro[r1]=libro[r2] and e[r1] >= s[r2] and e[r2] >= s[r1]}:
	x[r1] + x[r2] <=1

#obiettivi
# massimizzare numero richieste soddisfatte
maximize z1: sum {r in R} x[r];
# massimizzare durata prestiti
maximize z2: sum {r in R} (e[r]-s[r]+1) * x[r]