# DATI
param nM;
set M := 1..nM;													# Mesi da pianificare
param cap;															# Capacità produttiva
param cp;															# Costo unitario di produzione [€/u]
param capx;														# Capacità produttiva extra [u]
param cpx;															# Costo unitario di produzione extra [€/u]
param cg;															# Costo unitario di giacenza [€/um]
param d {M}; 														# Domanda di ogni mese [u]
param y0;															# Scorta iniziale

# VARIABILI
var x {M} >= 0 <= cap;										# Produzione in ogni mese [u]
var xx {M} >= 0 <= cap;										# Produzione extra in ogni mese [u]
var y {M} >= 0;													# Giacenza alla fine di ogni mese [u]

# VINCOLI
# Conservazione del flusso [u]
subject to Flow_conservation0:
		y0 + x[1] + xx[1] = d[1] + y[1];
subject to Flow_conservation {m in M: m > 1}:
		y[m-1] + x[m] + xx[m] = d[m] + y[m];
		
# OBIETTIVO
# Minimizzare i costi complessivi [€]
minimize z: sum {m in M} (cp * x[m] + cpx * xx[m] + cg*y[m]);

##############################

data;


end;
