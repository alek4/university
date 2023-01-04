#algoritmi-strutture-dati  #struttura-dati 

Le code con priorità (in inglese "priority queue") sono un tipo di struttura dati che consente di inserire e rimuovere gli elementi in base alla loro priorità. In altre parole, gli elementi con una priorità più alta vengono sempre estratti prima rispetto agli elementi con una priorità più bassa.

Una coda con priorità può essere implementata in molti modi differenti, ad esempio come una coda di elementi ordinati in base alla priorità, come un [[Heap|heap]] o come una lista di elementi ordinati in modo da rendere facile l'estrazione dell'elemento con la priorità più alta.

Le operazioni comunemente supportate da una coda con priorità sono:

-   `findMin()`: Restituisce l’elemento minimo della coda (senza rimuoverlo).
-   `deleteMin()`: Restituisce l’elemento minimo della coda e lo rimuove.
-   `insert(elemento e, chiave k)`: Inserisce nella coda un elemento e con associata una chiave (priorita') $k$.
-   `delete(elemento e)`: Cancella l’elemento $e$.
-   `changeKey(elemento e, chiave d)`: Modifica la priorita' dell’elemento e, assegnando come nuovo valore $d$

Le code con priorità vengono utilizzate in molti algoritmi e strutture dati, ad esempio nell'algoritmo di Dijkstra per il calcolo del percorso più breve in un grafo o nell'algoritmo di Huffman per la codifica dei dati.

Implementando le code mediante _MinHeap_, tutte le operazioni possono essere risolte in $\Theta(log(n))$ passi, tranne per `findMin` che e' costante $O(1)$.
