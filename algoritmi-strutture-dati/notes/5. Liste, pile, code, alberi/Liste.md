#algoritmi-strutture-dati  #struttura-dati

Le liste concatenate sono un tipo di dato strutturato che permette di memorizzare una sequenza di elementi in modo ordinato. Ogni elemento è contenuto in un nodo, che può essere pensato come una "scatola" che contiene sia il valore dell'elemento che un riferimento (chiamato "puntatore") ad un altro nodo. La lista è costituita da una sequenza di nodi disposti in modo da creare una catena di nodi, da cui il nome "liste concatenate".

Le liste concatenate hanno alcune caratteristiche che le rendono molto utili in alcuni contesti:

-   Sono dinamiche: è possibile aggiungere o rimuovere elementi dalla lista in modo semplice, senza doverne ricreare una nuova ogni volta.
-   Sono facili da implementare: le liste concatenate possono essere implementate in modo semplice utilizzando solo una variabile e un puntatore.

Le operazioni più comuni che possono essere eseguite su una lista concatenata sono:

-   Inserimento: è possibile aggiungere nuovi elementi alla lista, sia all'inizio che alla fine o in una posizione specifica.
-   Rimozione: è possibile rimuovere elementi dalla lista, sia dall'inizio che dalla fine o da una posizione specifica.
-   Ricerca: è possibile cercare un elemento specifico nella lista, per verificarne l'esistenza o per ottenere il suo indice.
-   Accesso: è possibile accedere agli elementi della lista in modo sequenziale, partendo dall'inizio o dalla fine.

Le liste concatenate possono essere implementate in modo statico o dinamico. Le liste concatenate statiche sono create utilizzando array di dimensione fissa, mentre le liste concatenate dinamiche utilizzano l'allocazione dinamica della memoria per creare nodi "al volo" quando necessario.

### Alcune operazioni

#### Ricerca elemento in base alla posizione

```python
funzione elemento(Lista l, indice i) -> Nodo
	p <- l
	while p != null and i > 0 do
		p <- p.pros
		i <- i - 1
	return p
```

> Per cercare un elemento in una lista, che sia tramite indice o per valore, bisognerà per forza scorrerla tutta a differenza di un array, che tramite indici, è ad accesso diretto.

#### Ricerca elemento in base alla chiave

```python
funzione trova(Lista l, tipoChiave k) -> Nodo
	p <- l
	while p != null and p.chiave != k do
		p <- p.pros
	return p
```

#### Ricerca elemento in base alla chiave in una lista *ordinata*

```python
funzione trova(ListaOrdinata l, tipoChiave k) -> Nodo
	p <- l
	while p != null and p.chiave < k do
		p <- p.pros
		
	if p = null or p.chiave > k then
		return null
	else
		return p
```

#### Inserimento in una lista ordinata

```python
funzione inserisci(ListaOrdinata l, elemento d) -> ListaOrdinata
	k <- d.chiave
	p <- l
	prec <- null
	while p != null and p.chiave < k do
		prec <- p
		p <- p.pros
	
	r <- riferimento a nuovo nodo
	r.chiave <- k
	r.altriCampi <- d.altriCampi
	r.pros <- p
	
	if prec = null then
		l <- r
	else
		prec.pros <- r
	
	return l
```