# esercizio Spin Glass: PNLI con variabili binarie
# dati
param n;
set N := 1..n;
param a {N,N};

# variabili
var x {N} binary;			#spin di ogni particella

# obiettivo
maximize E: sum {i in N, j in N: i<j} a[i,j] * (2*x[i] - 1) * (2*x[j] - 1);


data;


end;