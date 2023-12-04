# esercizio zoo

# dati
param nA := 20;													# numero animali
set A := 1..nA;														# insieme animali
param nP := 4;													# numero prodotti
set P := 1..nP;														# insieme prodotti
param nS := 8;													# numero sostanze
set S := 1..nS;														# insieme sostanze

param qA {A};														# quantità animali [unità]
param comp_P {S, P};										# composizione prodotti [%]
param fabbisogno {A, S};									# fabbisogno animali [kg/g]
param costi {P};													# costi prodotti [€/kg]

# variabili
var x {P} >= 0;														# kg prodotti acquistati
var y {S} >= 0;

# vincoli

subj to Composizione{j in S}:
		y[j] = sum {i in P} x[i] * comp_P[j,i]/100;
		
subj to Fabbisogno_Complessivo {j in S}:
		y[j] >= sum {i in A} fabbisogno[i, j];

# obiettivo
minimize z: sum{i in P} x[i] * costi[i];


##################################
data;

param qA :=
1		1
2		2 
3		1 
4		1 
5		1 
6		8 
7		1 
8		1 
9		3 
10	2 
11	2 
12	1 
13	1 
14	8 
15	1 
16	6 
17	1 
18	4 
19	4 
20	2;

param comp_P : 1		2		3		4 :=
1     80       5       0      25
2			0       5       0       0
3     0      25      30       5
4    5      40      25      10
5   5       0       0       0
6     0       0       0      15
7     0       0      25       0
8     10      25      20      45;

param fabbisogno: 1		2		3		4		5		6		7		8 :=
1   0.0  0.0  0.0  2.0  0.2  0.5  1.0  3.0
2   1.0  1.0  3.0  0.3  0.2  0.2  0.0  2.0
3   0.1  0.5  0.1  1.0  0.1  0.3  0.0  4.0
4   0.5  0.5  1.0  0.5  0.1  0.5  0.5  5.0
5   0.0  0.5  5.0  9.0  0.5  1.0  1.0  9.0
6   0.0  0.0  0.0  0.0  0.0  0.0  0.1  0.1
7   0.0  0.0  0.2  3.0  0.0  0.0  0.0  4.0
8   0.0  0.0  8.0  6.0  0.5  1.0  0.0 20.0
9   0.0  1.0  1.0  1.0  0.0  0.0  0.2  0.5
10   5.0  0.0  0.0  0.0  1.0  0.5  0.0  5.0
11   0.0  1.0  0.0  5.0  0.0  0.0  0.0  3.0
12   0.0  0.0  0.0  0.0  0.0  0.0  3.0  0.0
13   5.0  0.5  3.0  1.0  0.0  0.0  0.0 10.0
14   0.0  0.0  0.0  0.0  0.0  0.0  0.2  0.5
15   1.0  0.0  0.0 12.0  0.0  2.0  0.0 15.0
16   0.5  0.0  0.0  0.1  0.0  0.0  0.0  0.1
17   0.0  0.2  1.0  9.0  0.2  0.5  0.0  6.0
18   0.0  0.0  0.0  0.5  0.1  0.0  0.5  1.0
19   0.0  0.2  0.5  3.0  0.0  0.0  1.0  1.0
20   0.0  0.0  0.0  5.0  0.5  0.2  0.5  5.0;

param costi := 
1		5
2		2
3		3
4		4;


end;
