# linear ordering

param N;							# numero nodi
set Nodi := 1..N;
param c {Nodi,Nodi};				# peso degli archi

# variabili
var x {Nodi, Nodi} binary;			# precendenza: x[i,j] = 1 sse i precede j nell'ordinamento

# vincoli
# vincoli su orientamento per ogni coppia
subject to Coppia {i in Nodi, j in Nodi: i < j}:
	x[i,j] + x[j,i] = 1;

# vincoli che proibiscono cicli
subject to NoCicli {i in Nodi, j in Nodi, k in Nodi: (i<>j) and (j<>k) and (i<>k)}:
	x[i,j] + x[j,k] + [k,i] <= 2;

# obiettivo
# minimizzare cosi archi orientati secondo le precedenze
minimize z: sum {i in Nodi, j in Nodi} c[i,j] * x[i,j];

#####################################
data;

# dati non ho voglia di prenderli

end;
