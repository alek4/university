#algoritmi-strutture-dati  #algoritmo 

L’idea base dell’algoritmo e' di scandire ripetutamente l’array dal primo all’ultimo elemento, scambiando tra loro gli elementi adiacenti che non risultino ordinati. L’array sara' ordinato quando si riuscira' ad effettuare un’intera scansione senza alcuno scambio.

```
Algoritmo bubbleSort (array A[0..n − 1])  
	do  
		scambiato ← false // per ricordare se durante la scansione corrente  
						  // e' stato fatto almeno uno scambio  
		for j ← 1 to n − 1 do  
			if A[j] < A[j − 1] then  
				scambia A[j − 1] con A[j]  
				scambiato ← true  
	while scambiato
```

si puo' notare che con questo algoritmo, dopo l'iesima iterazione, gli ultimi i elementi dell'array sono al loro posto definitivo, dunque, per evitare di esaminarli possiamo riscrivere l'algoritmo in questo modo:

```
Algoritmo bubbleSort (array A[0..n − 1])  
	i ← 1
	do  
		scambiato ← false // per ricordare se durante la scansione corrente  
						  // e' stato fatto almeno uno scambio  
		for j ← 1 to n − i do  
			if A[j] < A[j − 1] then  
				scambia A[j − 1] con A[j]  
				scambiato ← true
		i ← i + 1
	while scambiato and i < n
```

la nuova variabile $i$ serve per tenere traccia delle scansioni ed evitare di esaminare gli ultimi  i - 1 elementi dell'array

## Numero di confronti

$n - 1$ = iterazioni del ciclo piu' esterno
$n - i$ = confronti per ogni iterazione
$$C(n) = \sum_{i=1}^{n-1}(n-i) = \sum_{i=1}^{n-1}i = \frac{n(n-1)}{2}$$
