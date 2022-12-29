#algoritmi-strutture-dati #algoritmo 

L'insertion sort è un altro algoritmo di ordinamento che funziona confrontando gli elementi di una lista e spostandoli nella posizione corretta nella lista ordinata. Funziona in questo modo:

1.  Si parte dal secondo elemento della lista e si immagina che il primo elemento sia già ordinato.
2.  Si confronta il secondo elemento con il primo. Se il secondo elemento è più piccolo, lo si scambia con il primo.
3.  Si passa alla terza posizione e si confronta il terzo elemento con gli altri due elementi già ordinati. Se il terzo elemento è più piccolo di uno degli altri elementi, lo si sposta nella posizione corretta tra questi due elementi.
4.  Si continua così fino a quando si arriva all'ultimo elemento della lista.

```python
function insertion_sort(list):
  for i = 1 to length(list) - 1:
    key = list[i]
    # Move the elements of the sorted list that are greater than the key, one
    # position ahead of their current position
    j = i - 1
    while j >= 0 and key < list[j]:
      list[j + 1] = list[j]
      j = j - 1
    list[j + 1] = key
```

L'insertion sort ha una complessità di $\Theta(n^2)$, ma può essere più veloce del selection sort in alcuni casi specifici, ad esempio quando i dati sono già parzialmente ordinati o quando la lista è piccola.

## Numero di confronti

$k$ = numero di confronti
$$C(n) = \sum_{i=1}^{n-1}k = \frac{n(n - 1)}{2} = \Theta(n^2)$$