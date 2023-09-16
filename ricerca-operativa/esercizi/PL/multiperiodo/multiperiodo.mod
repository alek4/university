# Esercizio Pianificazione multi--periodo

#DATI
set Mesi;
param d {Mesi};													# Domanda [tom]
param q {Mesi};													# Capacità prod [ton]
param p {Mesi};													# Prezzo ingredienti [€/ton]
param h {Mesi};													# Costo immagazzinamento [€/ton]
param s0;															# Scorta iniziale

#VARIABILI
var x {m in Mesi} >= 0, <= q[m];												# Produzione mensile [ton]
var s {m in Mesi} >= 0;

#VINCOLI
subject to Conservazione1:
		s0 + x[1] = d[1] + s[1];

subject to Conservazione {m in Mesi: m > 1}:
		s[m-1] + x[m] = d[m] + s[m];

#OBIETTIVO
minimize z: sum {m in Mesi}  p[m] * x[m]
					+  sum {m in Mesi} h[m] * (sum {i in Mesi: i<=m} x[i] - d[i]);

data;


set Mesi := 1 2 3 4;
param: d					q 				p					h  :=
1			200			  400			  34					2000
2			300			  500			  36					3000
3 		500			  300			  32					2000
4 		400			  500			  38					3000;