#algoritmi-strutture-dati  #algoritmo 

L'algoritmo di Prim è un algoritmo di ricerca di una copertura di un grafo minimale, cioè un insieme di archi che copre tutti i nodi del grafo senza formare cicli e con il peso minimo possibile. Si tratta di un algoritmo di ottimizzazione di tipo [[Tecnica greedy|greedy]], ovvero che effettua scelte ottimali locali allo scopo di ottenere un risultato ottimale complessivo.

L'algoritmo di Prim può essere utilizzato per risolvere il problema del [[Albero ricoprente minimo|minimo albero di copertura]] (Minimum Spanning Tree, MST), ovvero per trovare l'albero di copertura di peso minimo di un grafo connesso e non orientato.

Ecco come funziona l'algoritmo di Prim in modo dettagliato:

1.  Scegliere un nodo arbitrario come punto di partenza e aggiungerlo all'albero di copertura corrente.
2.  Trovare tutte le connessioni (archi) del nodo corrente con gli altri nodi del grafo che non fanno parte dell'albero di copertura corrente.
3.  Scegliere l'arco di peso minimo che connette il nodo corrente a un altro nodo non ancora incluso nell'albero di copertura e aggiungere questo nuovo nodo all'albero di copertura.
4.  Ripetere i passi 2 e 3 fino a quando tutti i nodi del grafo sono stati aggiunti all'albero di copertura.

L'algoritmo di Prim è garantito per trovare sempre la soluzione ottimale per il problema del minimo albero di copertura, a meno che il grafo non sia un grafo di pesi negativi.

In poche parole:

>Inizialmente:
>	- $T=$ albero costituito da un unico vertice 
>
>Ad ogni passo:
>	- Espando $T$ aggiungendo l'arco $(x,y)$ di peso minimo con un vertice in $T$ e l'altro non in $T$

### Pseudo codice

```python
Algoritmo Prim(Grafo G = (V, E, w)) -> albero
	T <- albero costituito da un unico vertice s ∈ V qualsiasi
	while T ha meno di n vertici do
		si (x, y) l`arco di peso minimo con x in T e y non in T
		aggiungi a T il vertice y e l`arco (x,y)
	return T
```

### Implementazione

Le [[Code con priorità|code con priorità]] ci consentono di gestire efficacemente la frontiera, che viene sottoposta a operazioni di ricerca del minimo e di aggiornamento. In particolare, questa struttura ci aiuta a scegliere l'arco di peso minimo presente nella frontiera.

All'inizio, ogni vertice v ha una priorità $\infty$ (albero vuoto). In ogni passo, si seleziona il vertice $y$ con l'arco di peso minimo e lo si aggiunge a $T$ insieme all'arco $(x, y)$, dove $x$ è un vicino di $y$. Successivamente, si aggiorna la priorità/distanza dei vicini di $y$ e si riprende il processo.

### Pseudo codice con implementazione Union/Find

```python
Algoritmo Prim(Grafo G = (V, E, w)) -> albero
	sia C una coda con priorita` vuota
	siano d e vicino due array con indici in V
	
	foreach v ∈ V do
		d[v] <- ∞
		C.insert(v, ∞)
	T <- (∅, ∅)
	do
		y <- C.deleteMin()
		V_t <- V_t ∪ {y}
		if d[y] != ∞ then
			x <- vicino[y]
			E_t <- E_t ∪ {(x,y)}
		foreach (y, z) ∈ E do
			if z ∉ V_t and w(y, z) < d[z] then
				d[z] <- w(y,z)
				C.changeKey(z, w(y,z))
				vicino[z] <- y
	while c != ∅
	return T
```

### Complessita'

![[complessita-prim1.png]]
![[complessita-prim2.png]]

