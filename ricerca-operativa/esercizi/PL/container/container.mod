# DATI
param n;																# numero tipi oggetti
set N := 1..n;															# insieme tipi oggetti
param numero {N};											# numero di oggetti da trasportare per ogni tipo
param volume {N};											# volume oggetti per ogni tipo
param nT;                                                             # numero tipi container
set T := 1..nT;                                                        # tipi container
param cap {T};															# capacità dei containers
param m {k in T} := ceil(sum {i in N} volume[i] * numero[i]/cap[k]) + 2;							# ho sparato questo numero a buon senso guardando l'ordine di grandezza dei dati
set c {k in T} := 1..m[k];														# insieme containers vettore di insiemi



# VARIABILE
var y {k in T, c[k]} binary;													# uso dei containers 1 = usatoo 0 = non usato
var x {N, k in T, c[k]} >= 0 integer;															# numero di oggetti di ogni tipo in ogni container
var slack {k in T, c[k]} >= 0;                                        # capacità non utilizzata in container usati

# OBIETTIVO
#minimize z:  sum {j in c} y [j];
minimize z2: sum {k in T, j in c[k]} slack[k,j];

# VINCOLI
# vincolo di capacità per ogni container
subject to Capacity {k in T, j in c[k]}:
		(sum {i in N} volume[i] * x [i,k,j]) + slack[k,j] = cap[k] * y[k, j];
		
#subject to xy {i in N, j in c}:								fa cagare zio pera
#		x[i,j] <= y[j] * numero[i];

# vincolo sul trasporto di tutti gli oggetti
subject to Assegnamento {i in N}:
		sum {k in T, j in c[k]} x[i,k,j] = numero[i];

# Symmetry breaking contraints
subject to SBC {k in T, j in c[k]: j>1}:
    y[k,j] <= y[k,j-1];
    
# Numero di container
subject to Ncontainer:
    sum {k in T, j in c[k]} y[k,j] = 6;                    # << Valore ottimo f.o. principale

##############################
data;
param n := 10;
param nT := 3;

param: numero volume :=
  1          68               30
  2          90               25
  3          10              200 
  4          48               40
  5          28              105
  6          70              150
  7          56               18
  8          10              250
  9          45               54
 10          12               67;

param cap := 
1       5000
2       3000
3       4000;

end;
