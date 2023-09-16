# Esercizio patate

#Dati
set Prodotti;															# Insieme dei prodotti
set Fornitori;														# Insieme dei fornitori
param resa {Fornitori, Prodotti};					# Resa [%]
param limite {Prodotti};									# Limite alla produzione [ton]
param rendimento {Fornitori};						# Rendimento [€cent/Kg]

#Variabili
var acquisti {Fornitori} >= 0;							# Quantità acquistate [ton]

#Vincoli
# Vincolo sulla massima produzione per ogni prodotto [ton]
subject to Max_Prod {j in Prodotti}:
	.sum {i in Fornitori} acquisti[i] * resa[i,j]/100 <= limite[j];

#Obiettivo
# Massimizzare il profitto complessivo [€]
# Il fattore 10 è dovuto alla trasformazione di ton in Kg (*1000) e €cent in €(/100)
maximize profitto: sum {i in Fornitori} rendimento[i] * acquisti[i] * 10;


#########################
data;

set Prodotti := A B C;
set Fornutori := F1 F2;

param resa: 	A		B		C :=
F1		20	20	30
F2		30	10	30;

param limite :=
A			6
B			4
C			8;

param rendimento :=
F1		2
F2		3;

end;
