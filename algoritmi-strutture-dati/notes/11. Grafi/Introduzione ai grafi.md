#algoritmi-strutture-dati  #struttura-dati 

I grafi sono una struttura di dati utilizzata per rappresentare le relazioni tra elementi di un insieme. Ogni elemento del grafo viene chiamato nodo o vertice, mentre le relazioni tra i nodi vengono rappresentate da archi o lati.

I grafi possono essere di diversi tipi, a seconda delle proprietà degli archi e dei nodi:

-   **Grafi non orientati**: gli archi non hanno una direzione specifica.
-   **Grafi orientati**: gli archi hanno una direzione specifica, cioè esiste una relazione di precedenza tra i nodi connessi.
-   **Grafi pesati**: gli archi hanno un peso, che rappresenta il costo di percorrenza o la distanza tra i nodi connessi.
-   **Grafi completi**: ogni nodo è connesso con tutti gli altri nodi del grafo.

### Rappresentazione di grafi

I grafi possono essere rappresentati in diversi modi.

La **lista degli archi** è una lista di coppie di nodi (o triplette, nel caso di grafi pesati), che indica gli estremi degli archi del grafo. Ad esempio, per rappresentare un grafo con 5 nodi e gli archi (1,2), (2,3), (3,4), (4,5), (5,1), la lista degli archi potrebbe essere: \[(1,2), (2,3), (3,4), (4,5), (5,1)\].

Una **lista di adiacenza** è invece una lista di nodi del grafo, dove ogni nodo contiene una lista di nodi ad esso adiacenti, cioè a cui è connesso tramite un arco.

La **lista di incidenza** è una lista di nodi del grafo, dove ogni nodo contiene una lista di archi a cui è incidente, cioè che hanno il nodo come estremo. Ad esempio, per rappresentare il grafo di cui sopra con la lista di incidenza, avremmo: \[(2,\[(1,2)\]), (3,\[(2,3)\]), (4,\[(3,4)\]), (5,\[(4,5)\]), (1,\[(5,1)\])\]

Una **matrice di adiacenza** è una tabella quadrata di dimensioni NxN, dove N è il numero di nodi del grafo. Ogni riga e ogni colonna della matrice rappresenta un nodo del grafo, e il valore presente nella cella (i,j) della matrice indica se c'è o meno un arco che connette il nodo i al nodo j. Se c'è un arco, il valore può essere 1 o il peso dell'arco; se non c'è, il valore è 0.

La **matrice di incidenza** è invece una matrice di dimensioni NxM, dove N è il numero di nodi e M è il numero di archi del grafo. Ogni riga della matrice rappresenta un nodo, mentre ogni colonna rappresenta un arco. Il valore presente nella cella (i,j) della matrice indica se il nodo i è un estremo dell'arco j: se lo è, il valore è 1; altrimenti, è 0.

### Attraversamento di grafi

L'attraversamento di un grafo consiste nel visitare tutti i nodi del grafo in modo ordinato, seguendo le connessioni tra i nodi. Ci sono diversi modi di effettuare l'attraversamento di un grafo, a seconda delle esigenze specifiche del problema da risolvere.

Un modo comune di attraversare un grafo è quello di partire da un nodo specifico e di visitare tutti i nodi raggiungibili da esso. Questo tipo di attraversamento viene chiamato traversata in ampiezza (o [[Breadth-first search]], BFS). Nella traversata in ampiezza, i nodi vengono visitati in ordine di distanza dal nodo di partenza, cioè prima vengono visitati i nodi adiacenti al nodo di partenza, poi quelli adiacenti ai nodi già visitati, e così via.

Un altro modo di attraversare un grafo è quello di partire da un nodo specifico e di visitare tutti i nodi del grafo, cercando di arrivare il più in profondità possibile ad ogni iterazione. Questo tipo di attraversamento viene chiamato traversata in profondità (o [[Depth-first search]], DFS). Nella traversata in profondità, i nodi vengono visitati in modo ricorsivo, cioè prima viene visitato un nodo, poi tutti i nodi adiacenti a esso, e così via, finché non si arriva a un nodo senza archi uscenti o a un nodo già visitato.