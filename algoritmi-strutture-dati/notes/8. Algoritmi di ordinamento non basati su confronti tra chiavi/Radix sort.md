#algoritmi-strutture-dati  #algoritmo 

Radix sort è un algoritmo di ordinamento basato sulla distribuzione dei dati in base ai singoli digit o cifre. Funziona sulla base del concetto di [[Bucket sort]] e viene spesso utilizzato per ordinare gli elementi di un array di interi o di stringhe.

L'idea di base di Radix sort è di ordinare gli elementi di un array iterando su ogni cifra dei numeri da ordinare. In ogni iterazione, l'array viene ordinato chiamando bucketsort in base all'$i$-esima cifra a cui il ciclo e' arrivato.

Radix sort è un algoritmo stabile, il che significa che mantiene l'ordine originale degli elementi con lo stesso valore. Inoltre, è molto efficiente in termini di tempo di esecuzione perché effettua l'ordinamento in modo molto rapido, soprattutto per array di grandi dimensioni. Tuttavia, richiede molta memoria perché richiede l'utilizzo di array di contatori per l'ordinamento.

```python
Algoritmo radixSort(array A[0..n − 1])
	# Ordina l’array A secondo un campo chiave intero
	t ← 0
	while esiste una chiave k in A con ⌊k/B^t⌋ != 0 do
		bucketSort(A, B, t)
		t ← t + 1
	
Procedura bucketSort(array A[0..n − 1], intero b, intero t)
	# Ordina l’array A secondo la cifra di posizione t nella rappresentazione
	# in base b della chiave. Le posizioni sono contate da 0, posizione della
	# cifra meno significativa.
	Sia Y [0..b − 1] un array # array di code
	for i ← 0 to b − 1 do 
		Y [i] ← coda vuota
		
	# colloca gli elementi di A in differenti code, in base alle chiavi
	for i ← 0 to n − 1 do
		x ← cifra di posizione t nella rappresentazione in base b di A[i].chiave
		Y [x].enqueue(A[i])
		
	# riempi A con i valori ordinati
	j ← 0 # indice della prossima posizione di A da riempire
	for i ← 0 to b − 1 do
		# colloca gli elementi che hanno in posizione t la cifra i nelle
		# prossime posizioni di A
		while not Y [i].isEmpty() do
			A[j] ← Y [i].dequeue()
			j ← j + 1
```

### Complessita'

La complessita' precisa di qeusto algoritmo e' $nlog_{B}n$, con B base potenza di 2, e' data da: $log_{B}n$ passate di _bucketsort_ la cui complessita' e' $O(n)$. Dato che $log_{B}n$ e' molto piccolo e dipende da una costante B, la complessita' totale puo' essere riscritta come: $\Theta(C * n)$. Di conseguenza possiamo semplificare togliendo la costante, e il risultato finale sara' $\Theta(n)$.
