# Esercizio biscotti

#DATI
set Biscotti;
set Ingredienti;
param a {Ingredienti, Biscotti};						# Composizione percentuale
param pmg {Biscotti};										# Produzione massima giornaliera [Kg/g]
param t {b in Biscotti} := 1/pmg[b];				# Tempi di lavorazione [g/Kg]
param pv {Biscotti};											# Prezzo di vendita [€/Kg]
param c {Ingredienti};										# Prezzo ingredienti [€/Kg]
param qpmin {Biscotti};
param qpmax {Biscotti};
param qimin {Biscotti};
param budget;													# Budget trimestrale [€]

#VARIABILI
var x {b in Biscotti} >= qpmin[b], <= qpmax[b];			# Produzione di biscotti [Kg/sett]
var y {i in Ingredienti} >= qimin[i];									# Quantità acquistate [Kg/sett]

#VINCOLI
subject  to Consumi {i in Ingredienti}:
		sum {b in Biscotti} x[b] * a[i,b]/100 <= y[i];

# Vincolo su tempo disponibile [g/sett]
subject to Tempo:
		sum {b in Biscotti} x[b] * t[b] <= 5;

# Vincolo sul budget settimanale  [€/sett]
subject to Budget:
		sum {i in Ingredienti} c[i] * y[i] <= budget/12;

#OBIETTIVO
# Massimizzazione profitti [€/sett]
maximize z: sum {b in Biscotti} pv[b] * x[b] - sum {i in Ingredienti} c[i] * y[i];

##############################
data;

set Biscotti :=   Svegliallegra   Frollino       Alba      ProntiVia;
set Ingredienti := Farina Uova Zucchero Burro Latte Additivi Nocciole;

param a : Svegliallegra   Frollino       Alba      ProntiVia :=
Farina                   20               25              30           20
Uova                     15                 0              10           20
Zucchero             20               15              25           10
Burro                      0                 0              10           10
Latte                     10               20              20           15
Additivi                 15               20                0           15
Nocciole               10                 0                0             0;

param pmg :=
Svegliallegra     165
Frollino               250
Alba                    500
ProntiVia            250;

param pv :=
Svegliallegra    1.75
Frollino  			1.00
Alba 					1.25
ProntiVia       	1.50;

param c :=
Farina    0.5
Uova      2
Zucchero  0.5
Burro     1
Latte     1.5
Additivi  1
Nocciole  5;

param qimin :=
Farina    450
Uova      200
Zucchero  320
Burro     140
Latte     320
Additivi  100
Nocciole   50;

param:			qpmin		qpmax :=
Svegliallegra       	  50     300
Frollino    				100     500
Alba 					   500    1000
ProntiVia	            300     500;

param budget := 21600;

end;
