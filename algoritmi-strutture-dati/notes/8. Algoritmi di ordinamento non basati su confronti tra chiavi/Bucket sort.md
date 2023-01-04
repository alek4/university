#algoritmi-strutture-dati  #algoritmo 

L'idea di base del bucket sort e' simile a quella dell'[[Integer sort]], ma al posto di utilizzare una array di contatori, utilizzeremo un array di liste. Infatti, al posto di ordinare solamente interi, con questo algoritmo possiamo ordinare liste di record (con chiave).

Questa chiave viene utilizzata come indice nell'array di liste di supporto per aggiungere il record alla lista corretta. Una volta aggiunti tutti gli elementi nelle liste giuste, un po' come nell'integer sort, le liste verranno svuotate in ordine nell'array di partenza.

```python
Algoritmo bucketSort(array A[0..n − 1], intero b)  
	# Ordina un array di record in base a un campo chiave intero appartenente  
	# all’intervallo [0, b − 1]  
	Sia Y [0..b − 1] un array # array di code  
	for i ← 0 to b − 1 do 
		Y [i] ← coda vuota  
	# colloca gli elementi di A in differenti code, in base alle chiavi  
	for i ← 0 to n − 1 do  
		x ← A[i].chiave  
		Y [x].enqueue(A[i])  
	
	# riempi A con i valori ordinati  
	j ← 0 # indice della prossima posizione di A da riempire  
	for i ← 0 to b − 1 do  
		# colloca i record con chiave i nelle prossime posizioni di A  
		while not Y [i].isEmpty() do  
			A[j] ← Y [i].dequeue()  
			j ← j + 1
```