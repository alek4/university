#algoritmi-strutture-dati  #algoritmo 

L'algoritmo di ricerca binaria è un algoritmo di ricerca che funziona su sequenze ordinate e che permette di trovare un elemento in modo molto più efficiente rispetto alla ricerca sequenziale.

Il principio alla base della ricerca binaria è quello di dividere in due la sequenza ad ogni passo e di considerare solo la metà in cui potrebbe trovarsi l'elemento cercato. Ad esempio, se l'elemento cercato è maggiore dell'elemento centrale della sequenza, allora sarà necessario cercarlo nella metà destra della sequenza, altrimenti nella metà sinistra.

Ecco come potrebbe essere implementato in pseudocodice:

```python
def ricerca_binaria(sequenza, elemento):
  inizio = 0
  fine = len(sequenza) - 1
  
  while inizio <= fine:
    # calcolo l'indice centrale
    centro = (inizio + fine) // 2
    # se l'elemento centrale è quello che sto cercando, restituisco l'indice
    if sequenza[centro] == elemento:
      return centro
    # altrimenti, se l'elemento cercato è minore, devo cercarlo nella metà sinistra
    elif elemento < sequenza[centro]:
      fine = centro - 1
    # altrimenti, devo cercarlo nella metà destra
    else:
      inizio = centro + 1
  # se arrivo qui vuol dire che l'elemento non è stato trovato
  return -1
```

L'algoritmo di ricerca binaria ha una complessità temporale di **O(log n)**, ovvero il logaritmo in base 2 del numero di elementi della sequenza, quindi è molto più efficiente della [[Ricerca sequenziale]] per sequenze di dimensioni medie o grandi. Tuttavia, richiede che la sequenza sia ordinata, quindi è necessario ordinarla prima di poterla utilizzare.
