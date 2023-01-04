#algoritmi-strutture-dati  #struttura-dati 

### Alcune definizioni prima di partire

**Albero**: [[Introduzione ai grafi|grafo]] _non orientato, connesso_ e _privo di cicli_
<u>Proprieta'</u>: $G=(V, E)$ non orientato e connesso e' un [[Alberi|albero]] se e solo se $\#E = \#V - 1$

**Foresta**: insieme di alberi

<hr>

L'**albero ricoprente** (in inglese, Spanning Tree) è un concetto che viene utilizzato in grafici connessi e pesati. Si tratta di un sotto-grafo di un grafo originale che include tutti i nodi presenti nel grafo originale, ma solo una parte delle sue aree.
Detto in modo rigoroso: dato $G = (V, E)$ grafo non orientato connesso, un albero ricoprente di $G$ e' un albero $G' = (V', E')$ con $V' = V$ e $E' \subseteq E$

#### Problema dell'albero ricoprente minimo
_Problema_: Dato $G = (V, E)$ non orientato connesso con una funzione peso $\omega: E$ -> $R$. Trovare un *albero ricoprente* $T=(V, E_T)$ di peso minimo.

>Dato $G'=(V,E')$,  $E' \subseteq E:$ $\omega(G')=\sum_{e \in E'}\omega(e)$
>$T = (V, E_T)$ e' una soluzione del problema se:
>	- T e' un albero con $E_T \subseteq E$
>	- $\forall T'$ albero con $T' = (V, E_{T'})$,  $E_{T'} \subseteq E: \omega(T) \le \omega(T')$

Esistono diversi algoritmi per trovare l'albero ricoprente minimo di un grafo, come l'[[Algoritmo di Kruskal]] e l'algoritmo di Prim. Questi algoritmi si basano sulla strategia [[Tecnica greedy|greedy]], e consentono di costruire un albero ricoprente minimo selezionando gli archi uno alla volta, scegliendo sempre quello di peso minimo.

### Prim VS Kruskal

I due algoritmi utilizzano strategie greedy ben differenti:
- *Kruskal*:
	- soluzione parziale: foresta di alberi con insieme di vertici $V$
	- inizialmente: no archi, tutti i vertici
- *Prim*:
	- soluzione parziale: albero $T = (V_T, E_T)$ con $V_T \subseteq V$ e $E_T \subseteq E \cap (V_T \times V_T)$ 
	- inizialmente: albero formato da un unico vertice
