#algoritmi-strutture-dati  #algoritmo 

L'algoritmo di ricerca sequenziale è un semplice algoritmo di ricerca che consiste nel confrontare gli elementi di una sequenza uno per uno, finché non si trova quello cercato o si arriva alla fine della sequenza senza averlo trovato.

Ecco come potrebbe essere implementato in pseudocodice:

```python
def ricerca_sequenziale(sequenza, elemento):
  # scorro la sequenza elemento per elemento
  for i in range(len(sequenza)):
    # se l'elemento corrente è quello che sto cercando, restituisco l'indice
    if sequenza[i] == elemento:
      return i
  # se arrivo qui vuol dire che l'elemento non è stato trovato
  return -1
```

L'algoritmo di ricerca sequenziale ha una complessità temporale di **O(n)**, ovvero il numero di elementi della sequenza, quindi è efficiente solo per sequenze di dimensioni relativamente piccole. Inoltre, funziona solo su sequenze ordinate, quindi in caso di sequenze disordinate è necessario prima ordinarle.