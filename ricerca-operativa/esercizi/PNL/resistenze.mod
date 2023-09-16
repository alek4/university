# esercizio resistore
# problema di assegnamento resistore -> posizione

# dati	
param nT;				#numero tipi
set T := 1..nT;			#insieme dei tipi di resistori
param num {T};			# numero risisroei disponibili per ogni tipo
param res {T};			# valore di resistenza per ogni tipo
param Rtarget;			# valore di resistenza desiderato
set P := 1..4;			# posizioni


#variabili
var x {T,P} binary;		# assegnamento resistori
var R {P};
var delta;

# vincoli
subject to Assign {p in P}:
	sum {t in T} x[t,p] = 1;
	
subject to AssignT {t in T}:
	sum {p in P} x[t,p] <= num[t];
	
subject to Resistenze {p in P}:
	R[p] = sum {t in T} res[t]*x[t,p];

minimize z: delta;
subject to val_ass1: 
	delta >= Rtarget - (1/((1/R[1])+(1/R[2])) + 1/((1/R[3])+(1/R[4])));
	
subject to val_ass2:
	delta >= (1/((1/R[1])+(1/R[2])) + 1/((1/R[3])+(1/R[4]))) - Rtarget;

#################################à
data;
param nT := 6;

param: 	num		res :=
1		 1		12
2		 1		15
3		 2		20
4		 2		22
5		 1		30
6		 1		40;

param Rtarget := 65;

end;