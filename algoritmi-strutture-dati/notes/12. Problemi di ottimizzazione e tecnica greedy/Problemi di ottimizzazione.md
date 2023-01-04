#algoritmi-strutture-dati 

I problemi di ottimizzazione sono problemi in cui si cerca di trovare una soluzione ottimale, ovvero una soluzione che soddisfi alcune specifiche condizioni e che sia al contempo la migliore possibile in base a una certa misura di "bontà". Un esempio comune di problema di ottimizzazione è il problema del commesso viaggiatore, in cui si cerca di trovare il percorso più breve per visitare un insieme di città, passando per ciascuna di esse una sola volta.

>Tra tutte le soluzioni *AMMISSIBILI* 
>vogliamo determinarne una *OTTIMA* 
>rispetto a un dato criterio

La [[Tecnica greedy]], o "vorace", è un tipo di approccio algoritmico per risolvere i problemi di ottimizzazione. In pratica, consiste nel prendere decisioni "voraci" ad ogni passo, ovvero scegliere sempre la soluzione che al momento sembra la migliore senza considerare le conseguenze a lungo termine. Questo tipo di approccio spesso porta a trovare soluzioni molto buone, ma non necessariamente ottimali.

### Esempi di problemi di ottimizzazione

#### Colorazione di grafi
_Istanza_: grafo non orientato $G=(V,E)$
_Problema_: Trovare il minimo numero di colori da attribuire ai vertici di G in modo che vertici adiacenti abbiano colori diversi.

>colorazione: $c: V -> Colori$ $t.c.$ $(x, y) \in E => c(x) \ne c(y)$  
>obbietivo: minimizzare $\#Im(c)$
>
>Soluzione ammissibile: vertici adiacenti hanno colori differenti
>Soluzione ottima: soluzione ammissibile con minimo numero di colori

#### Zaino monodimensionale
_Istanza_: Zaino di altezza $h$, $k$ contenitori $c_1, c_2,...,c_k$ di altezze $h_1, h_2,..., h_k$
_Problema_: Scegliere quali contenitori collocare nello zaino, in modo da riempirlo il piu' possibile

>Soluzione ammissibile: sottoinsieme $S \subseteq {c_1, c_2,...,c_k}$  $t.c.$ $f(S) \le h$ con $f(S) = \sum_{c_i \in S}h_i$
>Soluzione ottima: sottoinsieme ammissibile $S^* \subseteq {c_1, c_2,...,c_k}$  $t.c.$ $f(S^*) \ge f(S)$ per ogni $S$ ammisibile


## Per altri esempi consultare le [[Lavagna22.pdf|slide]] del professore allegate
