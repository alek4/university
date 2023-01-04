#algoritmi-strutture-dati 

La tecnica greedy è un tipo di algoritmo di risoluzione che cerca di risolvere un problema di ottimizzazione $P$ con $C$ come insieme di candidati trovando una soluzione $S^*$ ottima che appartiene all'insieme di candidati.

Una sequenza di passi generale potrebbe essere:
- Partendo dall'insieme vuoto, in una sequenza di passi si costruisce una soluzione ammissibile $S \subseteq C$
- Ad ogni passo si espande una soluzione parziale gia' ottenuta
- L'algoritmo termina quando non e' piu' possibile espandere la soluzione parziale

Per _espansione_ si intende:
- Soluzione ammissibile: la soluzione parziale soddisfa i vincoli del problema
- Scelta dell'ottimo locale: tra i candidati disponibili si sceglie quello che, al momento, appare migliore
- Scelta irrevocabile: le scelte effettuate non vengono piu' messe in discussione

```python
Algoritmo greedy(insieme C) -> soluzione
	S <- ∅
	while c != ∅ do
		x <- seleziona(C)
		C <- C \ {x}
		if S ∪ {x} e` ammissibile then
			S <- S ∪ {x}
	return S
```

## Per esempi consultare le [[Lavagna22.pdf|slide]] del professore allegate
