#algoritmi-strutture-dati  #algoritmo 

La breadth-first search (BFS) è un algoritmo di ricerca utilizzato per esplorare i nodi di un grafo in modo ordinato. L'algoritmo parte da un nodo specifico, detto nodo di partenza, e visita tutti i nodi raggiungibili da esso, espandendo l'area di ricerca ad ogni iterazione.

La BFS utilizza una coda per gestire i nodi da visitare. Ad ogni iterazione, il nodo in testa alla coda viene rimosso e viene inserito in una lista dei nodi già visitati. Quindi, tutti i nodi adiacenti (cioè connessi) al nodo corrente vengono inseriti in coda, in modo che vengano visitati nell'ordine in cui sono stati inseriti.

Il vantaggio della BFS rispetto ad altri algoritmi di ricerca come la traversata in profondità (DFS) è che garantisce di visitare tutti i nodi raggiungibili dal nodo di partenza, in ordine di distanza dal nodo di partenza stesso. In altre parole, nella BFS i nodi più vicini al nodo di partenza vengono visitati per primi.

```python
Algoritmo visitaInAmpiezza(grafo G = (V, E), vertice s) → albero  
	# Visita in ampiezza di un grafo non orientato connesso a partire da un  
	# vertice s e costruzione di un albero ricoprente ottenuto selezionando  
	# gli archi secondo l’ordine della visita
	C ← coda vuota  
	T ← ({s}, ∅) # albero formato dal solo vertice s marca s come raggiunto  
	
	C.enqueue(s)  
	while not C.isEmpty() do  
		u ← C.dequeue()  
		foreach (u, v) ∈ E do  
			if v non `e marcato come raggiunto then  
				T ← (vertici(T) ∪ {v}, archi(T) ∪ {(u, v)})  
				# aggiunge il vertice v e l’arco (u, v) a T 
				marca v come raggiunto  
				C.enqueue(v)  
	return T
```

### Tempo: per ogni tipo di rappresentazione

- **Lista di archi**: $O(mn)$ 
- **Lista di adiacenza e incidenza**: $O(n + m)$
- **Matrice di adiacenza**: $O(n^2)$
- **Matrice di incidenza**: $O(nm)$



