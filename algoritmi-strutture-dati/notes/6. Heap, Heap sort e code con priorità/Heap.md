
#algoritmi-strutture-dati  #struttura-dati

Uno **heap** (o max-heap) e' un [[Alberi#Alberi binari *quasi completi*|albero binario quasi completo]] in cui la chiave contenuta in ciascun nodo e' maggiore o uguale delle chiavi contenute nei figli, per comodita' considereremo solo heap in cui le foglie dell'ultimo livello si trovano piu' a sinistra possibile.

Poiché la radice di uno heap contiene sempre la chiave maggiore, possiamo estrarre l'elemento presente nella radice di uno heap contenente le chiavi che dobbiamo ordinare e inserirlo come primo elemento della sequenza ordinata che stiamo creando, partendo dal fondo. In questo modo, siamo in grado di costruire una sequenza ordinata a partire da uno heap.

### Risistemare uno heap

Una volta prelevato l'elemento che si trova nella radice, dovremo risistemare lo heap; non bastera' "far risalire" il figlio piu' grande perche' potremmo rompere la rigida struttura dello heap. Dunque, la soluzione e' quella di sostituire la radice con l'ultimo elemento dell'albero (ovvero la chiave piu' a destra dell'ultimo livello)

```python
Procedura risistema (heap H)  
	v ← H  
	x ← v.chiave # chiave del nodo radice  
	y ← v.altri campi # altri campi del nodo radice  
	daCollocare ← true  
	do  
		if v e` una foglia then  
			daCollocare ← false # la posizione appropriata per x `e stata
								# trovata  
		else  
			u ← figlio di v di valore massimo  
			if u.chiave > x then  
				v.chiave ← u.chiave # i dati in u risalgono: chiave  
				v.altri campi ← u.altri campi # i dati in u risalgono: altri
											  # campi  
				v ← u # si prosegue su u  
			else  
				daCollocare ← false # posizione appropriata per x `e stata 
									# trovata  
	while daCollocare  
	v.chiave ← x # copia la ex-radice nella posizione trovata: chiave  
	v.altri campi ← y # copia la ex-radice nella posizione trovata: altri campi
```

In pratica, quando estraiamo il valore presente nella radice di uno heap, dobbiamo "farlo scendere" verso la posizione corretta nell'albero, che potrebbe essere una foglia a distanza massima dalla radice. Durante questo processo, ad ogni passo confronteremo la chiave del nodo che stiamo ispezionando con la chiave massima dei suoi figli, determinando così dove posizionare il nodo in modo che lo heap mantenga la sua proprietà di ordinamento. Da questa deduzione si puo' intuire che, nel caso peggiore, il numero di confronti sara' $\Theta(h)$ dove $h$ e' l'altezza dello heap.

### Costruzione di uno heap

Come possiamo costruire uno heap dato un albero binario quasi completo?
1. Soluzione ricorsiva: Tecnica divide-et-impera (strategia top-down)
2. Soluzione iterativa: Dai sottoalberi piu' piccoli a quelli piu' grandi (strategia bottom-up)

#### 1. Soluzione divide-et-impera

- se l'albero e' vuoto, non fare nulla
- se l'albero non e' vuoto, trasformiamo ricorsivamente ognuno dei sottoalberi sinistro e destro nello heap;  a questo punto tutti i nodi, eccetto la radice, soddisfano la condizione di heap; applicando la procedura risistema possiamo trasformare l’intero albero in uno heap.

```python
Procedura creaHeap (albero binario T )  
	# Trasforma l’albero binario T in uno heap
	if T != albero vuoto then  
		creaHeap(T.sx)  
		creaHeap(T.dx)  
		risistema(T)
```

Nonostante la sua semplicita', non useremo questa soluzione per via della memoria aggiuntiva che verrebbe occupata dalle chiamate ricorsive.

#### 2. Partiamo dalle foglie (iterativa)

-   Iniziamo a considerare ogni nodo di profondità h da destra verso sinistra e trasformiamo in heap il sottoalbero con radice in questo nodo (che sono foglie, quindi i relativi sottoalberi sono già heap e non richiedono ulteriori azioni).
-   Passiamo quindi ai nodi di profondità h-1 sempre da destra verso sinistra e trasformiamo in heap i sottoalberi con radice in questi nodi.
-   Continuiamo questo processo per profondità sempre più basse fino a raggiungere la radice. A questo punto, l'intero albero sarà uno heap.

```python
Procedura creaHeap (albero binario T )  
	# Trasforma l’albero binario T in uno heap
	h ← altezza di T  
	for p ← h downto 0 do  
		foreach nodo x di profondita` p do  
			risistema(sottoalbero Tx di radice x)
```

##### Numero di confronti

- 1 chiamata di risistema per ogni nodo
- risistema fa $\Theta(profondita' dell'albero) \le log(n)$
- n chiamate di risistema
$$
\le nO(log(n)) = O(nlog(n))
$$
#### Analisi migliorata

- risistema su un nodo di profondita' $p$: $\Theta(h-p)$
- \#nodi di profondita' $p$: $2^p$

Da questi dati possiamo calcolare il numero dei passi del _foreach_: $\Theta(2^p(h-p))$
Ora che sappiamo il numero di passi per ogni profondita' ci bastera' sommare ogni livello con:
$$
\sum_{p=0}^{h}{2^p(h-p)} = \sum_{p=0}^{h}{h2^p} - \sum_{p=0}^{h}{p2^p} = h(2^{h+1}-1) - (h-1)2^{h+1}-2 = 2^{h+1}-h-2 \cong \Theta(n)
$$

### Ulteriori operazioni

#### 1. Trova elemento di chiave massima
- $O(1)$

#### 2. Cancella elemento di chiave massima
- $O(1) +\Theta(log(n))[risistema] = \Theta(log(n))$ 

#### 3. Inserisci un nuovo elemento
- Aggiungi un nuovo elemento in coda all'ultima foglia, poi **risistema dal basso**
- $\Theta(log(n))$

> _NOTE_: **risistema dal basso** consiste nello swappare il padre con il figlio finche' il figlio non e' minore del padre

#### 4. Cancella un elemento di chiave _x_
- Sostituisco l'elemento da cancellare con l'ultimo figlio, che viene rimosso
- Sia $f$ il valore che c'era nell'ultima foglia:
	- Se $f < x$ -> applico **risistema**
	- Se $f > x$ -> applico **risistema dal basso**
- $\Theta(log(n))$ passi (conoscendo la posizione di x)

#### 5. Modifica la chiave di un elemento
- Sia $x$ la nuova chiave e $f$ la chiave da sostituire:
	- Se $f < x$ -> **risistema**
	- Se $f > x$ -> **risistema dal basso**
- $\Theta(log(n))$ passi (conoscendo la posizione di f)