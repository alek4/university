# Esercizio Mars express

# DATI
set Memorie := 1..5;
set Orbite := 1..10;
param c {Orbite, Memorie};							# Quantità dei dati in arrivo [Mbit]
param durate{Orbite};										# Durata TW per la trasmissione [min]
param bitRate;
param cap{Memorie};										# Capacità di ogni memoria [Mbit]
param c0{Memorie};										# Livello iniziale di occupazione di ogni memoria [Mbit]
var w;																	# Massimo livello di riempimento [adimensionale]

# VARIABILI
var x {o in Orbite, m in Memorie} >= 0;		# Dati trasmessi alla fine di ogni orbita [Mbit]
var y {o in Orbite, m in Memorie} >= 0; 		# Dati in memoria alla fine di ogni TW (time window) [Mbit]
var z {o in Orbite, m in Memorie} >= 0;		# Dati in memoria dopo la trasmissione e prima della ricezione in ogni TW [Mbit]

# VINCOLI
# Capacità di trasmissione [Mbit]
subject to LimiteOrbite {o in Orbite}:
		sum {m in Memorie} x[o, m] <= durate[o] * bitRate;
		
# Vincolo di capacità [Mbit]
subject to capacity {o in Orbite, m in Memorie}:
		y[o,m] <= cap[m];
		
# Vincoli di conservazione del flusso [Mbit]
subject to flow_conservation0 {m in Memorie}:
		c0[m] = x[1,m] + z[1,m];

subject to flow_conservation1 {o in Orbite, m in Memorie: o>1}:
		y[o-1,m] = x[o,m] + z[o,m];
		
# Vincoli di conservazione del flusso [Mbit]
subject to flow_conservation2 {o in Orbite, m in Memorie}:
		z[o,m] + c[o,m] = y[o,m];
		
# OBIETTIVO

minimize maxliv: w;
subject to Minmax {m in Memorie, o in Orbite}: w >= y[o,m] / cap[m];

##############################

data;

param c: 1 2 3 4 5 :=
1 			  35 0 80 25 50
2 			200 70 100 25 0
3 				0 150 0 25 100
4 			600 300 0 25 75
5 			200 0 210 25 200
6 			  50 0 85 0 45
7 			  40 60 50 0 300
8 			300 90 20 60 0
9 				0 100 100 60 20
10 				0 20 100 60 250;

param durate :=
1 	45
2 	47
3 	55
4 	45
5 	35
6 	42
7 	30
8 	35
9 	44
10 	40;

param bitRate := 9;

param:   cap			 c0 :=
	1 		1000 			500
	2 		1200 			600
	3 		1000 			500
	4 		  500 			250
	5 		  700 			350;

end;
