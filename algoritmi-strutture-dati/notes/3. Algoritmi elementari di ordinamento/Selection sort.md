#algoritmi-strutture-dati #algoritmo

```python
function selectionSort(array A[0..n − 1]):
	for k = 0 to n − 2 do:
		# ricerca del minimo in A[k..n − 1]  
		m = k # m indica la posizione del minimo  
		for j ← k + 1 to n − 1 do:
			if A[j] < A[m] then m = j  
		swap A[m] with A[k] # sistema il minimo nella sua posizione definita k
```

Al passo principale k, k = 0, . . . , n − 1, viene selezionato l’elemento che deve essere collocato nella posizione k. L’elemento viene collocato in tale posizione, dalla quale l’elemento non sara' piu' spostato. Piu' in dettaglio:  
1. Prima del passo principale k, i primi k elementi dell’array sono al loro posto definitivo, cioe' sono ordinati tra loro e minori o uguali degli elementi successivi, i.e., 
    A\[0\] ≤ A\[1\] ≤ · · · ≤  A\[k − 1\] e A\[k − 1\] ≤ A\[j\] per j ≥ k;  
2. si seleziona l’elemento che andra' collocato in posizione k, cioe' il minimo della parte non  ordinata (quindi il minimo tra A\[k\], . . . , A\[n − 1\]),  
3. lo si colloca in posizione k, scambiandolo con l’elemento ivi presente,  
4. in questo modo, dopo il passo principale k, i primi k elementi risultano collocati nella loro  
posizione definitiva.  
Si puo' facilmente osservare che dopo il passo n − 2 la parte non ordinata contiene solo un elemento e, in base al punto 1, questo e' maggiore o uguale dei precendenti e, dunque, si trova nella sua posizione definitiva. Pertanto non e' necessario eseguire il passo n − 1.

## Numero di confronti

Consideriamo l’iterazione k del ciclo principale. All’interno di essa viene ricercato il minimo della porzione di vettore da posizione k a posizione n−1, effettuando n−k−1 confronti (numero iterazioni ciclo interno). Sommando su tutte le iterazioni k del ciclo principale otteniamo il numero totale di  confronti:
$$C(n) = \sum_{k=0}^{n-2}(n - k - 1)$$
Osserviamo che nella sommatoria precedente stiamo sommando tutti i numeri da n − 1 (per k = 0)  decrescendo fino a 1 (per k = n − 2). Con il cambio di variabile i = n − k − 1, possiamo riscrivere la sommatoria come:
$$C(n) = \sum_{k=0}^{n-2}(n - k - 1) = \sum_{k=1}^{n-1} i = \frac{n(n - 1)}{2} = \Theta(n^2)$$