set Ingredienti;
set Caramelle;
param proporzioni {Ingredienti, Caramelle};
param disponibilita {Ingredienti};
param costi {Ingredienti};
param prezzi {Caramelle};
param peso;

# variabili
var x {Caramelle} >= 0;										# qta caramelle prodotte [kg]
var y {Ingredienti, Caramelle} >= 0;				# kg di ingredienti utilizzati per caramella

# vincoli
subject to proporzioni_ingredienti {i in Ingredienti}:
		sum {j in Caramelle} x[j] * proporzioni[i,j] / 100 <= disponibilita[i];

# obiettivo
maximize z: sum {i in Caramelle} x[i] * prezzi[i] - sum {i in Ingredienti} (sum {j in Caramelle} y[i, j]) * costi[i];

data;

param peso := 10;

set Caramelle := Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety;
set Ingredienti := Fruttosio Saccarosio Glucosio Destrosio Estratti_di_erbe Estratti_di_frutta Coloranti Conservanti Aromatizzanti;
param proporzioni: Dolce Delizia Bacetto Golosa Sfizio Slurp Sweety :=
Fruttosio           30      0       5       5      5    10     10
Saccarosio          20     30       0       5      5     5     10
Glucosio            15     20      30       0      5     5      5
Destrosio           10     15      20      30      0     5      5
Estratti_di_erbe    10     10      15      20     30     0      5
Estratti_di_frutta   5     10      10      15     20    30      0
Coloranti            5      5      10      10     15    20     30
Conservanti          5      5       5      10     10    15     20
Aromatizzanti        0      5       5       5     10    10     15;

param disponibilita :=
Fruttosio            9
Saccarosio           5
Glucosio            20
Destrosio           18
Estratti_di_erbe    20
Estratti_di_frutta  17
Coloranti           18.4
Conservanti         12.5
Aromatizzanti       10;

param costi :=
Fruttosio           4
Saccarosio          2
Glucosio            1
Destrosio           3.5
Estratti_di_erbe    8
Estratti_di_frutta 10
Coloranti           2
Conservanti         5 
Aromatizzanti       6;

param prezzi :=
Dolce   5
Delizia 4
Bacetto 8
Golosa  5
Sfizio  6
Slurp   7.5
Sweety  4.5;

end;
