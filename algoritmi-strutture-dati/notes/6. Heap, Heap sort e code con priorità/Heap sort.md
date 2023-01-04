#algoritmi-strutture-dati  #algoritmo 

L'heapsort è un algoritmo di ordinamento che utilizza una struttura di dati chiamata [[Heap]] per ordinare gli elementi di un array. L'algoritmo di heapsort funziona estraendo gli elementi dall'heap uno alla volta e inserendoli nell'array di output, producendo così un array ordinato. 

```
Algoritmo heapSort(albero binario A) → lista
	crea uno heap H da A <== Θ(n)
	X ← lista vuota  
	| while H != ∅ do  
	| 	- aggiungi all’inizio di X l’elemento presente nella radice di H  
	| 	colloca nella radice di H l’elemento che si trova nella foglia piu' in 
	| 	- basso a destra
	| 	- rimuovi tale foglia  
	| 	- risistema(H) <== O(log(n))
	^ n iterazioni ==> O(nlog(n))
	return X
```

Il numero totale di confronti e' $\Theta(n) + O(nlog(n)) = O(nlog(n))$

E' possibile inoltre riscrivere le operazioni della struttura dati [[Heap]] per trasformare l'algoritmo heapsort in un algoritmo di ordinamento in *loco* rappresentando lo heap tramite un array posizionale.