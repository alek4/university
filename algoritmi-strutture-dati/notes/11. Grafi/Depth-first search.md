#algoritmi-strutture-dati  #algoritmo 

La depth-first search (DFS) è un algoritmo di ricerca utilizzato per esplorare i nodi di un grafo in modo ordinato. L'algoritmo parte da un nodo specifico, detto nodo di partenza, e visita tutti i nodi del grafo, cercando di arrivare il più in profondità possibile ad ogni iterazione.

La DFS utilizza uno stack (pila) per gestire i nodi da visitare. Ad ogni iterazione, il nodo in cima allo stack viene rimosso e viene inserito in una lista dei nodi già visitati. Quindi, tutti i nodi adiacenti (cioè connessi) al nodo corrente vengono inseriti in cima allo stack, in modo che vengano visitati in modo ricorsivo.

Il vantaggio della DFS rispetto ad altri algoritmi di ricerca come la breadth-first search (BFS) è che permette di trovare il primo risultato valido che soddisfa la condizione di ricerca, senza dover visitare tutti i nodi del grafo. Inoltre, la DFS è più efficiente in termini di spazio di memoria rispetto alla BFS, poiché non richiede l'utilizzo di una coda per gestire i nodi da visitare.

```python
Algoritmo visitaInProfondita`(grafo G = (V, E), vertice s) → albero  
	# Visita in profondit`a di un grafo non orientato connesso a partire da un  
	# vertice s e costruzione di un albero ricoprente ottenuto selezionando  
	# gli archi secondo l’ordine della visita
	T ← ({s}, ∅) # albero formato dal solo vertice s  
	visitaRicorsiva(G, s, T )  
	return T  
	
Procedura visitaRicorsiva(grafo G = (V, E), vertice u, albero T)  
	marca u come visitato  
	foreach (u, v) ∈ E do  
		if v non `e marcato come visitato then  
			T ← (vertici(T) ∪ {v}, archi(T) ∪ {(u, v)}) # aggiunge il vertice v 
														# e l’arco (u, v) a T  
			visitaRicorsiva(G, v, T)
```