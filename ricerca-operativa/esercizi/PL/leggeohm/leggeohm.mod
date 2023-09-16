# Legge di Ohm
# DATI
set Studenti;
param V {Studenti};											# Valore di tensione [Volt]
param I {Studenti};											# Valore di intensitò di corrente [mA]

# VARIABILI
var e {Studenti};													# Errore di misura per ogni sutdente [Volt]
var R;																		# Valore della resistenza [KOhm]
var z1;																	# Massimo errore in valore assolto
var z2;																	# Minimo valore assoluto del valor medio degli errori
var z3 {Studenti};												# Valore assoluto dell'errore di ogni studente

# VINCOLI
# Errore di misura = differenza tra valore misurato e valore calcolato [Volt]
subject to Def_errore {s in Studenti}:
		e[s] = V[s] - R * I[s];
		
# OBIETTIVO
# Obj1: minimizzare max errrore in valore assoluto
minimize obj1: z1;
subject  to Minmax1 {s in Studenti}: z1 >=  e[s];
subject  to Minmax2 {s in Studenti}: z1 >= -e[s];

# Obj2: minimizzare il valore assoluto del valore medio degli errori [Volt]
minimize obj2: z2;
subject to MinAbs1: z2 >= (sum {x in Studenti} e[s]/card(Studenti));
subject to MinAbs2: z2 >= -(sum {x in Studenti} e[s]/card(Studenti));

#Obj3: minimizzare il valore medio del valore assoluto degli errori [Volt]
minimize obj3: sum {s in Studenti} z3[s]/card(Studenti)
subject to MinAbs1 {s in Studenti}: z3[s] >=   e[s];
subject to MinAbs2 {s in Studenti}: z3[s] >= -e[s];
 
 # Obj4: minimizzare l'errore quadratico medio [Volt]
 minimize obj4: sum {s in Studenti} (e[s] ^ 2)/card(Studenti)
 
##############################
data; 

set Studenti := Ambrogio Barnaba Cinzia Deborah Emilio Federica Giueseppe Ilaria Luigi Mirella Oscar Piero;

param : 		V			I :=
Ambrogio 
Barnaba 
Cinzia 
Deborah 
Emilio 
Federica 
Giueseppe 
Ilaria 
Luigi 
Mirella 
Oscar 
Piero


end;
