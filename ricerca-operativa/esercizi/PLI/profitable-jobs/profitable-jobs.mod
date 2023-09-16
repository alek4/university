# Profitable scheduling
# Generalized Assignment Problem (più o meno)

# DATI
param nJ;
param nM;
set J := 1..nJ;
set M := 1..nM;
param c {J,M};
param t {J,M};
param p {J};
param q1{M};
param q2{M};
param cjm {J,M};
param cjj {J,J};

# VARIABILI
var x {j in J, m in M} binary <= cjm[j,m];											# Assegnamento

# VINCOLI
subject to Assignment {j in J}:
		sum {m in M} x[j,m] <= 1;

subject to Capacity {m in M}:
		sum {j in J} t[j,m] * x[j,m] <= q1[m];

subject to Incopatibility {j1 in J, j2 in J, m in M: j1<>j2}:
		#x[j1, m] AND x[j2,m] SOLO SE cjj[j1,j2]=1;
		#x[j1, m] * x[j2,m] <= cjj[j1,j2]; NON E' PIU' LINEARE
		x[j1, m] + x[j2,m] <= cjj[j1,j2] + 1;


# OBIETTIVO
minimize penalty: sum {j in J} p[j] * (1 - sum {m in M} x[j,m]);
minimize z: sum {j in J, m in M} c[j,m] * x[j,m];

##############################
data;
param nJ := 9;
param nM := 3;

end;

