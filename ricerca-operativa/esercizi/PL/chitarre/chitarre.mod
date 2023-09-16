
param nC;
set C := 1..nC;
param r {C};				# ricavo per ogni unità [€/u]
set R := 1..3;						# insieme reparti
param n_addetti {R};
param ore_addetto;
set S := 1..3;				# insieme stadi
param t {S,C};
param min_qta;

# variabili
var x {C} >= 0 integer;			# produzione chitarre [u/sett]

# vincoli
subject to Min_Chitarre:
	sum {i in C} x[i] >= 100;
	
subject to Ore_lavorative {i in S}:
	sum {j in C} x[j] * t[i,j] <= n_addetti[i] * ore_addetto;
	
# obiettivo
maximize z: sum {i in C} x[i] * r[i];
	
data;

param nC := 3;

param r := 
1	350
2	160
3	100;

param n_addetti :=
1	10
2	 5
3	 3;

param ore_addetto := 40;

param t: 	     1   		  2     		  3	:=
1    			 2            4               1
2 		         2            4               1.5
3                4            1               1;

param min_qta := 100;


end;
