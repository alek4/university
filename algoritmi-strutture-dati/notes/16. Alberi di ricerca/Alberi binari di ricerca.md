#algoritmi-strutture-dati  #struttura-dati 

Gli [[Alberi|alberi binari]] di ricerca (BST, dall'inglese Binary Search Tree) sono strutture dati utilizzate per memorizzare e organizzare in modo efficiente un insieme di elementi. 

Un albero binario di ricerca ha le seguenti proprietà:

1. Il valore del nodo figlio sinistro di un nodo deve essere sempre minore del valore del nodo padre.
2. Il valore del nodo figlio destro di un nodo deve essere sempre maggiore o uguale del valore del nodo padre.

Per esempio, considera l'albero binario di ricerca qui sotto:

```
      4
     / \
    2   6
   / \ / \
  1  3 5  7
```

Gli alberi binari di ricerca sono utilizzati in molti campi, come la ricerca di dati in database, il rendering di grafi e la gestione della memoria in sistemi operativi. Sono anche una componente importante di molti algoritmi di ordinamento.

### Operazioni

#### Trovare il massimo

```python
Funzione massimo(AlberoRicerca r) -> Nodo
	if r == null then
		retirn null
	else 
		n <- r
		while n.dx != null do
			n <- n.dx
		return n
```

#### Ricerca

```python
# versione ricorsiva
Funzione trova (AlberoRicerca r, tipoChiave k) → Nodo  
	if r = null then return null  
	else if k < r.chiave then return trova(r.sx, k)  
	else if k > r.chiave then return trova(r.dx, k)  
	else return r
```

```python
# versione iterativa
Funzione trova (AlberoRicerca r, tipoChiave k) → Nodo  
	while r != null and r.chiave != k do  
		if k < r.chiave then r ← r.sx  
		else r ← r.dx  
	return r
```

#### Inserimento

```python
# versione ricorsiva
Funzione inserisci (AlberoRicerca r, elemento d) →AlberoRicerca  
	# Inserisce nell’albero di binario di ricerca riferito dal parametro r un  
	# nuovo nodo contenente il dato d, nella posizione opportuna.  
	# Restituisce il riferimento alla radice dell’albero cosi' modificato.  
	k ← d.chiave  
	if r = null then  
		r ← riferimento a nuovo nodo  
		r.chiave ← k  
		r.altri campi← d.altri campi  
		r.sx ← null  
		r.dx ← null  
	else if k < r.chiave then r.sx ← inserisci(r.sx, d)  
	else r.dx ← inserisci(r.dx, d)  
	return r
```

```python
# versione iterativa
Funzione inserisci (AlberoRicerca r, elemento d) →AlberoRicerca  
	# Inserisce nell’albero di binario di ricerca riferito dal parametro r un  
	# nuovo nodo contenente il dato d, nella posizione opportuna.  
	# Restituisce il riferimento alla radice dell’albero cosi' modificato.  
	k ← d.chiave  
	# Preparazione del nodo da inserire  
	t ← riferimento a nuovo nodo  
	t.chiave ← k  
	t.altri campi← d.altri campi  
	t.sx ← null  
	t.dx ← null  
	# Ricerca la posizione dove inserire  
	padre ← null  
	n ← r  
	while n != null do  
		padre ← n  
		if k < n.chiave then n ← n.sx  
		else n ← n.dx  
	# in questo punto padre si riferisce al nodo sotto il quale inserire  
	# (contiene null se l’inserimento va fatto alla radice - albero vuoto) 
	 
	# Inserisci  
	if padre = null then r ← t  
	else if k < padre.chiave then padre.sx ← t  
	else padre.dx ← t  
	return r
```

#### Cancellazione

```python
Funzione cancella (AlberoRicerca r, tipoChiave k) →AlberoRicerca  
	# Elimina dall’albero di ricerca un nodo di chiave k, se presente.  
	# Restituisce il riferimento alla radice dell’albero cos`ı modificato.  
	
	# Ricerca il nodo da cancellare e il suo nodo padre  
	padre ← null  
	n ← r  
	while n != null and n.chiave != k do  
		padre ← n  
		if k < n.chiave then n ← n.sx  
		else n ← n.dx  
	
	# Cancella il nodo se e' stato trovato  
	if n != null then  
		if n.sx = null then          # manca figlio sinistro: sostituisce il  
			if padre != null then    # nodo con il suo sottoalbero destro  
				if n.chiave < padre.chiave then padre.sx ← n.dx  
				else padre.dx ← n.dx  
			else r ← r.dx            # caso particolare: cancellazione radice  
		else if n.dx = null then     # manca figlio destro: sostituisce il  
			if padre != null then    # nodo con il suo sottoalbero sinistro  
			if n.chiave < padre.chiave then padre.sx ← n.sx  
			else padre.dx ← n.sx  
			else r ← r.sx            # caso particolare: cancellazione radice  
		else  # ci sono entrambi i figli  
			# ricerca il nodo contenente la chiave piu' piccola  
			# del sottoalbero destro  
			t ← n  
			m ← n.dx  
			while m.sx̸ != null do  
				t ← m  
				m ← m.sx
			
			# in questo punto m si riferisce al nodo contenente la chiave piu'  
			# piccola del sottoalbero destro, t si riferisce al padre di m  
			n.chiave ← m.chiave # copia la chiave presente in m nel nodo n  
			n.altri campi← m.altri campi # e copia anche tutti gli altri dati  
			
			# elimina il nodo riferito da m  
			if t == n then n.dx ← m.dx # se il nodo m e' figlio destro del nodo n  
			else t.sx ← m.dx  
	return r
```

### Alberi binari: \#nodi vs altezza

- numero _minimo_ di nodi per alberi di altezza $h$ e' $h + 1$
- numero *massimo* di nodi per alberi di altezza $h$ è $2^{h+1} - 1$
- numero di nodi $n$: $h+1 \le n \le 2^{h+1}$
- altezza albero $h$: $log_2(n+1)-1 \le h \le n-1$
