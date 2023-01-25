#algoritmi-strutture-dati  #algoritmo 

L'algoritmo di Dijkstra è un algoritmo utilizzato per risolvere il problema dei cammini minimi in un grafo con pesi positivi. Funziona su grafi connessi e può essere utilizzato per trovare il percorso più breve tra un singolo nodo di partenza e tutti gli altri nodi del grafo.

L'algoritmo di Dijkstra utilizza una [[Code con priorità|coda di priorità]] per tenere traccia dei nodi che sono stati visitati e per determinare quale nodo deve essere esaminato per primo. Inizialmente, il nodo di partenza viene inserito nella coda di priorità e tutte le altre distanze vengono impostate sull'infinito. Successivamente, l'algoritmo esegue le seguenti operazioni finché la coda di priorità non è vuota:

1.  Estrae il nodo con la distanza minima dalla coda di priorità. (scelta [[Tecnica greedy|greedy]])
2.  Aggiorna le distanze dei nodi adiacenti utilizzando la seguente formula:

d\[v\] = min(d\[v\], d\[u\] + w(u,v))

In questa formula, d\[v\] rappresenta la distanza minima dal nodo di partenza al nodo v, d\[u\] rappresenta la distanza minima dal nodo di partenza al nodo u e w(u,v) rappresenta il peso dell'arco (u,v).

3.  Inserisce i nodi adiacenti nella coda di priorità.

L'algoritmo di Dijkstra termina quando tutti i nodi del grafo sono stati visitati. A quel punto, le distanze contenute nella tabella di distanze rappresentano le distanze minime dal nodo di partenza a ogni altro nodo del grafo.

### Correttezza ???

![[correttezza-dijkstra.png]]

### Pseudo codice

```python
Algoritmo Dijsktra (grafo pesato G = (V, E, ω), vertice s) → vettore distanze  
	# La funzione ω assegna un peso a ciascun arco.  
	# Il grafo non deve contenere archi di peso negativo. 
	Sia D un vettore con insieme di indici V  
	D[s] ← 0  
	
	foreach v ∈ V \ {s} do 
		D[v] ← ∞  
	
	Sia C una coda con priorita` inizialmente vuota  
	foreach v ∈ V do 
		C.insert(v, D[v])  
	
	while C != ∅ do  
		u ← C.deleteMin()  
		foreach (u, v) ∈ E do  
			if D[u] + ω(u, v) < D[v] then  
				D[v] ← D[u] + ω(u, v)  
				C.changeKey(v, D[v])  
	return D
```

### Complessita'

![[complessita-dijkstra1.png]]![[complessita-dijkstra2.png]]

