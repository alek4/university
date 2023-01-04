#algoritmi-strutture-dati  #algoritmo 

Gli algoritmi di QuickFind fanno parte della famiglia delle union-find, ovvero degli algoritmi utilizzati per gestire l'unione di insiemi di elementi e la ricerca del rappresentante di un elemento in un insieme. Gli algoritmi di QuickFind sono caratterizzati dalla loro semplicità e velocità di esecuzione nell'operazione di ricerca del rappresentante di un elemento, ma sono più lenti nell'operazione di unione degli insiemi. Essi sono rapprensentati da alberi di altezza 1, le cui foglie sono gli elementi e la radice e' il nome dell'insieme.

![[QuickFind.excalidraw|1000x800]]

Gli algoritmi di QuickFind sono semplici da implementare e sono adatti a problemi in cui le operazioni di unione degli insiemi sono relativamente rare rispetto alle operazioni di ricerca del rappresentante di un elemento. Tuttavia, non sono molto efficienti in termini di tempo di esecuzione quando le operazioni di unione degli insiemi sono frequenti.

### "QuickFind" con bilanciamento

Per velocizzare le operazioni di *union* ci bastera' memorizzare il numero di elementi dell'insieme nella radice e modificare l'algoritmo di *union* come segue:

```python
if size(A) >= size(B) then
	sposta i puntatori dalle foglie di B ad A
	rimuovi la radice di B
else
	sposta i puntatori dalle foglie di A a B
	rinomina la radice di B come A
	rimuovi la vecchia radice di A
size(A) <- size(A) + size(B)
```

In sintesi, prima di unire gli elementi di B ad A, verifico se B è più grande di A. In tal caso, unisco gli elementi di A a B e poi rinomino la radice di B come A. Con questa piccola ottimizzazione, possiamo dimostrare che, eseguendo una sequenza di n _MAKESET_, seguiti da $O(n)$ _UNION_ e _FIND_, il tempo totale è $O(nlog(n))$. Di conseguenza, il costo "ammortizzato" per l'operazione _UNION_ è $O(log(n))$.