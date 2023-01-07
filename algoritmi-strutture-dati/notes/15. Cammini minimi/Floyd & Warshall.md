#algoritmi-strutture-dati  #algoritmo 

Il problema dei cammini minimi tra tutte le coppie di vertici (noto anche come problema di tutte le coppie di cammini minimi o APSP, ovvero All Pairs Shortest Paths) consiste nell'individuare il percorso più breve tra ogni coppia di nodi in un grafo. Si tratta di una generalizzazione del problema dei cammini minimi tra due nodi, in cui si cerca di trovare il percorso più breve tra tutte le possibili coppie di nodi invece che solo tra due nodi specifici.

Ci sono diversi algoritmi che possono essere utilizzati per risolvere il problema dei cammini minimi tra tutte le coppie di vertici, come ad esempio l'algoritmo di **Floyd-Warshall** e l'algoritmo di Johnson. Entrambi questi algoritmi utilizzano la tecnica della [[programmazione dinamica]] per risolvere il problema in modo efficiente.

Il problema dei cammini minimi tra tutte le coppie di vertici è molto importante in molti campi, come l'ingegneria del traffico, la pianificazione del percorso per la consegna di pacchi e la ricerca di percorsi più brevi in mappe online. Inoltre, può essere utilizzato come base per risolvere altri problemi di cammini minimi, come il problema del commesso viaggiatore.

### L'Algoritmo

L'algoritmo di Floyd-Warshall è un algoritmo di programmazione dinamica utilizzato per risolvere il problema dei cammini minimi tra tutte le coppie di vertici in un grafo. Funziona su grafi con pesi positivi o negativi e non necessita che il grafo sia connesso.

L'algoritmo di Floyd-Warshall utilizza una matrice di distanze per memorizzare le distanze minime tra ogni coppia di nodi. Inizialmente, la distanza tra ogni coppia di nodi viene impostata sull'infinito, tranne per le coppie di nodi (i,i), per cui la distanza viene impostata su 0. Successivamente, l'algoritmo itera su ogni nodo intermedio k e aggiorna la distanza tra ogni coppia di nodi (i,j) utilizzando la seguente formula:

D\[i\]\[j\] = min(D\[i\]\[j\], D\[i\]\[k\] + D\[k\]\[j\])

In questa formula, D\[i\]\[j\] rappresenta la distanza minima tra i nodi i e j, D\[i\]\[k\] rappresenta la distanza minima tra i nodi i e k e D\[k\]\[j\] rappresenta la distanza minima tra i nodi k e j.

L'algoritmo di Floyd-Warshall termina quando tutte le coppie di nodi sono state esaminate e le loro distanze minime sono state aggiornate. A quel punto, la matrice di distanze contiene le distanze minime tra ogni coppia di nodi.

L'algoritmo di Floyd-Warshall ha una complessità di $O(n^3)$, dove n è il numero di nodi del grafo, questo perche' si creano $n$ matrici per per memorizzare ogni iterazione di $k$; una miglioria per abbassare la complessita' a $O(n^2)$ e' quella di unire tutte quelle matrici in unica sola.

### Pseudo codice

```python
Algoritmo FloydWarshall(Grafo G) -> Matrice
	Sia D[1...n, 1...n] una matrice
	for i <- 1 to n do 
		for j <- 1 to n do 
			if i == j then D[i,j] <- 0
			else if (v_i, v_j) ∈ E then D[i,j] <- w(i,j)
			else D[i,j] <- ∞
	
	for k <- 1 to n do
		for i <- 1 to n do
			for j <- 1 to n do
				if D[i,k] + D[k,j] < D[i,j] then
					D[i,j] <- fD[i,k] + D[k,j]
	return D
```

Inoltre e' possibile ricavare il cammino minimo tra $v_i$ e $v_j$ aggiungendo una matrice ausiliaria $P$ tale che $P$\[i,j\] e' uguale al massimo indice dei vertici intermedi sul cammino minimo da $v_i$ a $v_j$. Stando ai valori poi contenuti alle fine in $P$ si puo' ricavare il cammino.

```python
Algoritmo FloydWarshall(Grafo G) -> Matrice
	Sia D[1...n, 1...n] una matrice
	for i <- 1 to n do 
		for j <- 1 to n do 
			if i == j then D[i,j] <- 0
			else if (v_i, v_j) ∈ E then D[i,j] <- w(i,j)
			else D[i,j] <- ∞
			P[i,j] <- 0 <------
	
	for k <- 1 to n do
		for i <- 1 to n do
			for j <- 1 to n do
				if D[i,k] + D[k,j] < D[i,j] then
					D[i,j] <- fD[i,k] + D[k,j]
					P[i,j] <- k <------ # mi salvo il nodo intermedio
	return D, P
```