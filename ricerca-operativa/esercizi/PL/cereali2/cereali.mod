param nC := 6;
param nT := 2;
set Cereali := 1..nC;											# insieme di cereali
set Terreni := 1..nT;											# insieme di terreni
param Profitti {Cereali};									# profitto generato da ogni cereale per ogni quintale [€/quintale]
param Area {Terreni, Cereali};						# consumo di superficie [acri/q]
param Acqua {Cereali};									# consumo di acqua [mc/q]
param Superficie {Terreni};							# area disponibile in ogni terreno [acri]
param AcquaDisp; 											# acqua disponibile [mc]

# Variabili
var x {Terreni, Cereali} >= 0;											# quantità prodotte per ogni cereale su ogni terreno [q]

# Vincoli
# Massima area disponibile su ogni terreno [acri]
subject to max_area {t in Terreni}:
		sum {c in Cereali} x[t,c] * Area[t,c] <= Superficie[t];
		
# Massimo consumo di acqua [mc]
subject to max_acqua:
		sum {t in Terreni, c in Cereali} x[t,c] * Acqua[c] <= AcquaDisp;

# Obiettivo
# massimizzare il profitto totale [€]
maximize z: sum {c in Cereali, t in Terreni} Profitti[c] * x[t, c];

#######################################
data;

param Profitti :=
1 		48 
2 		62 
3 		28 
4 		  36 
5 		122 
6			   94;

param Area: 		1 		2 		3 		4 		5 		6 :=
1 						0.02 	0.03 	0.02 	0.016   0.05 	0.04
2 						0.02 	0.034 0.024 	0.02 	0.06 	0.034;

param Acqua :=
1		0.120 
2		0.160 
3		0.100 
4		0.140 
5		0.215 
6		0.180;

param Superficie :=
1		200
2		400;

param AcquaDisp := 400000;

end;
