#algoritmi-strutture-dati 

Indichiamo con $tempo(I)$ il tempo di esecuzione dell-algoritmo su quella istanza.

- ***Worst case***: quante operazioni eseguiamo nel caso peggiore?

$$T_{worst}(n) = max\{tempo(I)\}$$

- ***best case***: numero minimo di operazioni richieste per l'istanza di ingresso particolarmente favorevole?

$$T_{best}(n) = min\{tempo(I)\}$$

- ***average case***: qual e' il tempo impiegato nel caso medio, ovvero su istanze "tipiche" su quel particolare problema? Assumendo che ogni istanza $I$ ha probabilita' $P(I)$

$$T_{avg}(n) = \sum\{P(I) * tempo(I)\}$$

L'analisi peggiore sara' quella che utilizzeremo perche' il caso migliore non da' informazioni utili, il caso medio sarebbe molto piu' preciso ma calcolare la distribuzione di probabilita' di ogni possibile input e' impossibile.