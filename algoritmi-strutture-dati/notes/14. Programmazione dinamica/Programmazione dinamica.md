#algoritmi-strutture-dati 

La programmazione dinamica è una tecnica di risoluzione di problemi di ottimizzazione che si basa sulla risoluzione di sottoproblemi e sulla memorizzazione delle soluzioni per utilizzarle in seguito, al fine di evitare di risolvere più volte lo stesso sottoproblema. In questo modo, si può ridurre il tempo di esecuzione di un algoritmo, a costo di utilizzare più spazio di memoria per memorizzare le soluzioni dei sottoproblemi.

La programmazione dinamica viene solitamente utilizzata per risolvere problemi di tipo ricorsivo, ovvero problemi che possono essere suddivisi in sottoproblemi più piccoli che possono essere risolti separatamente. Una volta risolti i sottoproblemi, le soluzioni possono essere combinate per ottenere la soluzione del problema originale.

La programmazione dinamica è molto utile quando si lavora con problemi che presentano una struttura di dipendenza tra i sottoproblemi, ovvero quando la soluzione di un sottoproblema dipende dalla soluzione di altri sottoproblemi. In questi casi, la programmazione dinamica può aiutare a ridurre il tempo di esecuzione dell'algoritmo, poiché permette di risolvere i sottoproblemi solo una volta e di riutilizzare le soluzioni ottenute in seguito.

1. Si individuano sottoproblemi del problema dato
2. Si risolvono i sottoproblemi a partire dai piu' semplici
	- sottoproblemi "base": soluzione immediata -> *memorizzata in tabella*
	- altri sottoproblemi: soluzione ottenuta utilizzando le soluzioni di sottoproblemi risolti in precedenza -> *consultazione e aggiornamento tabella*
3. Soluzione finale: ricavata dalle soluzioni dei sottoproblemi -> *funzione di alcuni elementi della tabella*

## Per esempi consultare le [[Lavagna24.pdf|slide]] del professore allegate
