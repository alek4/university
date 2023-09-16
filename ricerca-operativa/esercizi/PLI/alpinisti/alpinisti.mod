param nA;
param nS;
param nSA;
param nSK;
set A := 1..nA;
set Sk := 1..nSK;
set S := 1..nS;

param skillAlpinisti {A, Sk};
param rischio {A};
param skillRichiesti {Sk};

# Variabili
var x {A, S} binary;

# Vincoli
subject to nComponenti {j in S}:
	sum {i in A} x[i,j] = 4; 

subject to minSkill {j in S, k in Sk}:
	sum {i in A} x[i,j] * skillAlpinisti[i,k] >= skillRichiesti[k];
	
# Obiettivo
minimize z: sum {j in S} (sum {i in A} x[i,j] * rischio[i]);

data;

param nA := 20;
param nS := 4;
param nSA := 4;
param nSK := 3;

param skillAlpinisti: 1  2  3 :=
		 1            3  2  5
		 2            3  2  5
		 3            4  5  4
		 4            4  5  5
		 5            2  4  4
		 6            1  4  4
		 7            2  5  3
		 8            5  5  3
		 9            4  5  4
		10            5  3  5
		11            3  2  5
		12            3  5  4
		13            4  5  5
		14            4  5  4
		15            5  4  2
		16            5  4  2
		17            5  4  3
		18            3  1  4
		19            4  3  5
		20            5  5  4;
		
param rischio := 
 1              0.21
 2              0.15
 3              0.12
 4              0.11
 5              0.12
 6              0.14
 7              0.08
 8              0.10
 9              0.05
10              0.19
11              0.13
12              0.01
13              0.07
14              0.15
15              0.18
16              0.16
17              0.09
18              0.08
19              0.02
20              0.10;

param skillRichiesti :=
 1         16
 2         16
 3         16;

end;
