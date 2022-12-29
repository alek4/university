#algoritmi-strutture-dati  #algoritmo 

L'algoritmo di ordinamento **merge sort** utilizza una strategia di tipo "[[Divide-et-impera]]" per ordinare una lista di elementi. Ciò significa che la lista viene suddivisa ricorsivamente in parti sempre più piccole, che vengono poi ordinate separatamente. Successivamente, le parti ordinate vengono ricombinate confrontando gli elementi uno per uno per ottenere la lista completa ordinata. Il numero di confronti effettuati dall'algoritmo per ordinare una lista di lunghezza n (denotato come $C(n)$) dipende dal numero di confronti necessari per ordinare le due sottoliste di lunghezza $⌊n/2⌋$ e $⌈n/2⌉$ (chiamate ricorsive), nonché dal numero di confronti necessari per unire le due sottoliste ordinate (chiamata di *merge*). Possiamo quindi scrivere un'equazione di ricorrenza per calcolare il numero di confronti necessari per ordinare una lista di lunghezza n utilizzando l'algoritmo di merge sort.

$$
C(n) = 
\begin{cases}
	0 \text{ se n <= 1}  \\
	C(⌊n/2⌋) + C(⌈n/2⌉) + C_{merge(n)} \text{ altrimenti}
\end{cases}
$$

```
algoritmo mergeSort (array A[0..n − 1])  
	if n > 1 then  
		m ← n/2  
		B ← A[0..m − 1]  
		C ← A[m..n − 1]  
		mergeSort(B)  
		mergeSort(C)  
		A ← merge(B, C)
```

L'algoritmo di merge è utilizzato per unire due vettori ordinati in modo non decrescente in un unico vettore ordinato. Ecco come funziona:

1.  Si crea un vettore X la cui lunghezza è la somma delle lunghezze dei vettori B e C.
2.  Si confrontano gli elementi minimi di B e C e si sceglie il minimo, copiandolo nella prima posizione libera del vettore X. Nel vettore da cui è stato scelto il minimo, si passa all'elemento successivo.
3.  Si ripetono queste operazioni fino a raggiungere la fine di uno dei due vettori.
4.  Si copiano gli elementi non ancora utilizzati dell'altro vettore in X.

```
algoritmo merge (array B[0..ℓB − 1], array C[0..ℓC − 1]) → array
	Sia X[0..ℓB + ℓC − 1] un array
	i1 ← 0 // prossima posizione da considerare in B  
	i2 ← 0 // prossima posizione da considerare in C  
	k ← 0 // prossima posizione da riempire in X
	while i1 < ℓB and i2 < ℓC do //non raggiunta n ́e la fine di B n ́e quella di C
		if B[i1] ≤ C[i2] then
			X[k] ← B[i1] // preleva il prossimo elemento da B
			i1 ← i1 + 1
		else
			X[k] ← C[i2] // preleva il prossimo elemento da C
			i2 ← i2 + 1
		k ← k + 1
	if i1 < ℓB then  
		for j ← i1 to ℓB − 1 do // copia in X gli elementi rimasti in B  
			X[k] ← B[j]  
			k ← k + 1  
	else  
		for j ← i2 to ℓC − 1 do // copia in X gli elementi rimasti in C  
			X[k] ← C[j]  
			k ← k + 1  
	return X
```

### Numero di confronti di *merge*

$$C(n)_{merge} = n - 1$$

### Numero di confronti di *mergeSort*

Siamo ora in grado di calcolare il numero di confronti effettuati da mergeSort, nel caso peggiore, sostituendo nell’equazione precedente il valore appena calcolato per $C_{merge}(n)$:
$$
C(n) = 
\begin{cases}
	0 \text{ se n <= 1}  \\
	C(⌊n/2⌋) + C(⌈n/2⌉) + n - 1 \text{ altrimenti}
\end{cases}
$$
Supponendo n pari, otteniamo:
$$
C(n) = 
\begin{cases}
	0 \text{ se n <= 1}  \\
	2C(n/2) + n - 1 \text{ altrimenti}
\end{cases}
$$
#TODO 

_!!! scrivere la risoluzione della formula ricorsiva !!!_
