#algoritmi-strutture-dati  #algoritmo 

L'algoritmo di Kruskal è un algoritmo di ricerca di un [[Albero ricoprente minimo|albero ricoprente minimo]] in un grafo connesso e pesato. Funziona selezionando gli archi del grafo in modo da minimizzare il peso totale del grafo, e allo stesso tempo garantendo che il sotto-grafo formato sia connesso.

Il funzionamento dell'algoritmo di Kruskal è il seguente:

1.  Inizialmente, ogni nodo del grafo viene trattato come un grafo separato.
2.  Gli archi del grafo vengono ordinati in base al loro peso, da quello di peso minimo a quello di peso massimo.
3.  Si prende l'arco di peso minimo e si verifica se i nodi a cui è connesso appartengono a grafi separati. Se è così, l'arco viene aggiunto all'albero ricoprente e i due grafi vengono uniti. Se i nodi appartengono già allo stesso grafo, l'arco viene ignorato.
4.  Si ripete il passo 3 per tutti gli archi rimanenti, in ordine di peso crescente, fino a quando tutti i nodi del grafo originale sono stati uniti in un unico grafo connesso.

L'algoritmo di Kruskal garantisce che l'albero ricoprente minimo venga trovato, poiché seleziona sempre l'arco di peso minimo disponibile. Tuttavia, richiede di ordinare gli archi del grafo in base al loro peso, il che implica un costo computazionale non trascurabile.

In poche parole:

>Inizialmente:
>	- $T=(V, \varnothing)$ 
>	- $C = E$ -> insieme dei candidati
>
>Ad ogni passo:
>	- Prelevo da C l'arco di peso minimo e lo aggiungo a T se non forma cicli con gli archi gia' scelti

### Pseudo codice

```python
Algoritmo Kruskal(Grafo G = (V, E, w)) -> albero
	ordina E in maniera non decrescente in base ai pesi
	T <- (V, ∅)
	foreach (x, y) ∈ E secondo l`ordine do
		if x e y non sono connessi in T then
			aggiungi a T l`arco (x, y)
	return T
```

### Correttezza

#TODO 

_Teorema_: L'algoritmo di Kruskal trova un albero ricoprente minimo
_Dimostrazione_: 
>$T$ albero trovato da Kruskal
>$T_0$ albero ricoprente minimo con il maggior numero di archi in comune con $T$
>Per _assurdo_ sia $T_0 \neq T$
>Sia $(x, y)$ il primo arco in $T$ ma non in $T_0$

### Implementazione

L'utilizzo di [[Union-Find]] ci permetterà di determinare se il vertice che stiamo aggiungendo alla nostra struttura è già presente o meno. Per fare ciò, organizzeremo gli insiemi dei vertici in modo da formare delle partizioni. Se due vertici appartengono allo stesso elemento della partizione, significa che sono connessi da un cammino nella struttura.

All'inizio, ogni nodo del grafo formerà una partizione singola. Ad ogni passo, verificheremo se i nodi x e y sono già connessi nella struttura T. Se non lo sono, significa che appartengono a due insiemi differenti. In questo caso, potremo aggiungere l'arco che li collega a T e unire gli elementi della partizione corrispondenti. Rappresenteremo il grafo sotto forma di una lista di archi.

### Pseudo codice con implementazione Union/Find

```python
Algoritmo Kruskal(Grafo G = (V, E, w)) -> albero
	ordina E in maniera non decrescente in base ai pesi
	T <- (V, ∅)
	
	foreach vertice v ∈ V 
		do makeSet(v)
	
	foreach (x, y) ∈ E secondo l`ordine do
		T_x <- Find(x)
		T_y <- Find(y)
		if T_x != T_y then
			Union(T_x, T_y)
			aggiungi a T l`arco (x, y)
	return T
```

### Complessita'

![[complessita-kruskal.png]]

