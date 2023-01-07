#algoritmi-strutture-dati  #algoritmo 

L'algoritmo di Bellman-Ford è un algoritmo utilizzato per risolvere il problema dei cammini minimi in un grafo con pesi negativi. Funziona su grafi connessi e può essere utilizzato per trovare il percorso più breve tra un singolo nodo di partenza e tutti gli altri nodi del grafo.

L'algoritmo di Bellman-Ford utilizza una tabella di distanze per memorizzare le distanze minime dal nodo di partenza a ogni altro nodo del grafo. Inizialmente, la distanza dal nodo di partenza a se stesso viene impostata su 0, mentre tutte le altre distanze vengono impostate sull'infinito. Successivamente, l'algoritmo esegue un certo numero di iterazioni, ognuna delle quali aggiorna le distanze utilizzando la seguente formula:

d\[v\] = min(d\[v\], d\[u\] + w(u,v))

In questa formula, d\[v\] rappresenta la distanza minima dal nodo di partenza al nodo v, d\[u\] rappresenta la distanza minima dal nodo di partenza al nodo u e w(u,v) rappresenta il peso dell'arco (u,v).

L'algoritmo di Bellman-Ford termina quando le distanze non vengono più aggiornate, ovvero quando il grafo è stato "rilassato" completamente. A quel punto, la tabella di distanze contiene le distanze minime dal nodo di partenza a ogni altro nodo del grafo.

L'algoritmo di Bellman-Ford ha una complessità di $O(nm)$, dove n è il numero di nodi del grafo e m è il numero di archi. Ciò significa che il tempo di esecuzione cresce in modo lineare con il numero di nodi e di archi del grafo. Tuttavia, a differenza dell'algoritmo di [[Dijkstra]], che funziona solo per grafi con pesi positivi, l'algoritmo di Bellman-Ford può essere utilizzato anche per grafi con pesi negativi.

Inizialmente, questo algoritmo parte dall'ipotesi che, se un grafo G non ha cicli negativi, esiste un percorso minimo semplice tra qualsiasi coppia di vertici. Pertanto, è sufficiente considerare percorsi composti da al massimo n vertici, ovvero n-1 archi. In al massimo n-1 passaggi, tutti i nodi possono essere raggiunti, ottenendo così i pesi dei percorsi minimi.

### Pseudo codice

```python
Sia d[V] un vettore con indici in V
d[s] <- 0
foreach v ∈ V\{s} do 
	d[v] <- ∞
for k <- 1 to n-1 do
	foreach (u,v) ∈ E do
		if d[u] + w(u,v) < d[v] then
			d[v] <- d[u] + w(u,v)
return d
```

### Complessita'

![[complessita-bellmanford.png]]