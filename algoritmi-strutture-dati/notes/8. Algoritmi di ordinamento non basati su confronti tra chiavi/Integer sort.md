#algoritmi-strutture-dati  #algoritmo 

Integer sort, noto anche come counting sort, è un algoritmo di ordinamento utilizzato per ordinare un array di interi nell'intervallo \[0, k-1\] in modo efficiente, dove k è un intero noto. Si basa sull'idea di contare quante volte ogni elemento dell'array di input appare nell'array e di utilizzare questi contatori per determinare la posizione di ogni elemento nell'array ordinato.

L'algoritmo integer sort è considerato molto efficiente quando l'intervallo di valori degli elementi dell'array di input è limitato e noto in anticipo. Tuttavia, non è una buona scelta per ordinare array di interi con un intervallo di valori molto ampio o per ordinare array di elementi di tipo diverso da interi. Inoltre, poiché l'algoritmo integer sort è di tipo stabile, mantiene l'ordine originale degli elementi uguali nell'array di input.

```python
Algoritmo integerSort(array A[0..n − 1], intero b)  
	# Ordina un array di interi appartenenti all’intervallo [0, b − 1]
	Sia Y [0..b − 1] un array # array di contatori  
	for i ← 0 to b − 1 do 
		Y [i] ← 0 # azzera i contatori  
	# Conta le occorrenze nell’array A di ciascun intero appartenente  
	# a [0, b − 1]  
	for i ← 0 to n − 1 do  
		x ← A[i]  
		Y [x] ← Y [x] + 1  
	
	# riempi A con i valori ordinati  
	j ← 0 # indice della prossima posizione di A da riempire  
	for i ← 0 to b − 1 do  
		# assegna l’intero i alle successive Y[i] posizioni di A  
		for h ← 1 to Y[i] do  
			A[j] ← i  
			j ← j + 1
```

Questo algoritmo ordina $n$ numeri in \[0, n - 1\] in tempo $O(n)$ non effettuando confronti.