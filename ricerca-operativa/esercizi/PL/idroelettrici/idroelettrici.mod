set Impianti := 1..3;
param Capacita {Impianti};								# Capacità massima del bacino [mc]
param Produz_max {Impianti};						# limite massimo produzione energia [MWh/g]
param Alimentazione {Impianti};					# quantità di acqua riversata nei bacini [mc/g]
param Vol_iniz {Impianti};
param Vol_fin {Impianti};

set Giorni := 1..20;
param Fabbisogno {Giorni};
param Costo {Giorni};

# variabili
var x {i in Giorni, j in Impianti} >= 0, <= Capacita[j];
var y {i in Giorni, j in Impianti} >= 0, <= ;

# vincoli


data;

param:  Capacita  Alimentazione  Produz_max  Vol_iniz  Vol_fin :=
   1      1000000       25000          24       500000     250000
   2      1200000       55000          30       600000     300000
   3      1800000       40000          30       900000     450000;
   
end;