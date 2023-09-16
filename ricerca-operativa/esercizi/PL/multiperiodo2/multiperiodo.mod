# Pianificazione multiperiodo
set Mesi := 1..4;
param Domanda {Mesi};									# domanda [ton]
param Cap {Mesi};											# capacità produttiva del mese [ton]
param Prezzo {Mesi};										# prezzo ingredienti [€/ton]
param C_stoccaggio {Mesi};							# costo unitario di stoccaggio mensile [€/ton]
param y0 := 0;														# scorte iniziali [ton]

# variabili
var x {i in Mesi} >= 0, <= Cap[i];						# produzione mensile [ton]
var y {Mesi} >= 0;												# Stock di gelato alla fine del mese [ton]

# vincoli
# Flow conservation constraint
subject to flow_conservation {i in Mesi: i > 1}:
		y[i-1] + x[i] = Domanda[i] + y[i];

subject to flow_conservation1:
		y0 + x[1] = Domanda[1] + y[1];

# obiettivo


data;

param:		Domanda			Cap		Prezzo		C_stoccaggio :=
1			200					400				34					2000
2			300					500				36					3000
3			500					300				32					2000
4			400					500				38					3000;

end;
