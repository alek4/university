#DATI
set Prodotti;
set Ingredienti;
set Confezioni;
param prezzivendita {Prodotti};							# prezzi di vendita [€/kg]
param composizione {Ingredienti, Prodotti};	#composizione percentuale prodotti [%
param qdisp {Ingredienti};									# quantità disponibile [Kg/g]

#VARIABILI
var x {Confezioni, Prodotti} >= 0;						# qta prodotti x confezioni
var y {i in Ingredienti} >= 0, <=qdisp[i];			# qta ingredienti usati
var q {Prodotti} >= 0;												# qta prodotti

#VINCOLI
subject to xxx {p in prodotti}:
		sum {c in Confezioni}  x[c, p] = q[p];

subject to yyy {i in Ingredienti}:
		


##############################
data;
set Prodotti := merendine brioches biscotti_normali biscotti_speciali tortine;
set Ingredienti := pasta zucchero marmellata cioccolato acqua;
set Confezioni := piccola grande

param prezzivendita := 
merendine      					8
brioches  							6
biscotti_normali   			12
biscotti_speciali 			   14
tortine    						   10;

param composizione: merendine  brioches  biscotti_normali   biscotti_speciali  tortine :=
pasta    20      40      70      25      20
zucchero 25      15      10      20      30 
marmellata 40      30       0      10      10  
cioccolato 10       0      15      40      30  
acqua     5      15       5       5      10;

param qdisp :=
Zucchero   		300
Marmellata 		320
Cioccolato 		240;
end;
