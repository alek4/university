# Esercizio elettrodo

# NON VA UN CAZZO

# DATI
param nP;
set Paesi := 1..nP;					# insieme dei paesi
param x {Paesi};			# ascissa di ogni paese [km]
param y {Paesi};			# ordinata di ogni paese [km]
param Dmax;					# distanza limite dal paese [km]
param pred {i in Paesi: i <> 1};		# predecessore di ogni paese
param epsilon := 0.01;

# VARIABILI
# coordinale delle cabine di trasformazoine	[km]
var xc {i in Paesi: i > 1} := x[i] + epsilon;
var yc {i in Paesi: i > 1} := y[i] + epsilon;
var dist_cp {i in Paesi: i > 1} >= 0, <= Dmax, = sqrt(xc[i]-x[i])^2 + (yc[i]-y[i])^2;
var dist_e {Paesi} >= 0;

# VINCOLI
# distanza tra cabina e paese
subject to Distanza {i in Paesi: i > 1}:
	dist_cp[i]^2 = (xc[i]-x[i])^2 + (yc[i]-y[i])^2; 

# distanza tra nodi dell'elettrodotto
subject to Distanza_e {i in Paesi: i > 2}:
	dist_e[i]^2 = (xc[i]-xc[pred[i]])^2 + (yc[i]-yc[pred[i]])^2; 

subject to Distanza_e2:
	dist_e[2]^2 = (xc[2]-x[1])^2 + (yc[2]-y[1])^2; 

# OBIETTIVO
#minimize Tizio: sum {i in Paesi: i <> 1} dist_cp[i];

#minimize Caio: sum {i in Paesi: i <> 1} dist_e[i];

minimize Sempronio: sum {i in Paesi: i <> 1} (1.5 * dist_cp[i]) + dist_e[i]; 

#############################
data;
param nP := 16;

param: 	 x	 y :=
1		 0	 0
2		 4	 8
3		10	12
4		15	12
5		22	28
6		31	30
7		40	34
8		42	46
9		50	50
10		25	15
11		32	15
12		37	10
13		46	13
14		31	38
15		28	45
16		35	54;

param pred := 
2	1
3	2
4	3
5	4
6	5
7	6
8	7
9	8
10	4
11	10
12	11
13	12
14	6
15	14
16	15;



param Dmax := 2;

end;












