#algoritmi-strutture-dati  #struttura-dati 

Gli alberi binari sono un tipo di dato strutturato che consiste in un insieme di nodi organizzati in modo gerarchico. Ogni nodo può avere al massimo due figli, chiamati "figlio sinistro" e "figlio destro". Gli alberi binari sono spesso utilizzati in diverse applicazioni, ad esempio per:

-   Rappresentare strutture di dati gerarchiche, ad esempio il sistema dei file di un computer.
-   Implementare algoritmi di ricerca e ordinamento.
-   Rappresentare espressioni algebriche.

Le operazioni più comuni che possono essere eseguite sugli alberi binari sono:

-   Inserimento: è possibile aggiungere nuovi nodi all'albero.
-   Rimozione: è possibile rimuovere nodi dall'albero.
-   Ricerca: è possibile cercare un nodo specifico nell'albero.
-   Visita: è possibile "visitare" tutti i nodi dell'albero in modo sequenziale, ad esempio in ordine "simmetrico" (visita prima il nodo, poi il figlio sinistro, poi il figlio destro), "anticipato" (visita prima il figlio sinistro, poi il nodo, poi il figlio destro) o "differito" (visita prima il figlio sinistro, poi il figlio destro, poi il nodo).

Gli alberi binari possono essere implementati in modo statico o dinamico. Gli alberi binari statici sono creati utilizzando array di dimensione fissa, mentre gli alberi binari dinamici utilizzano l'allocazione dinamica della memoria per creare nodi "al volo" quando necessario.

Esistono diverse varianti degli alberi binari, come ad esempio gli alberi binari di ricerca, che hanno la proprietà di mantenere gli elementi ordinati, o gli alberi rossi-neri, che sono utilizzati per implementare alberi di ricerca bilanciati.

### Visite ad alberi binari

Le varie tipologie di visita di un albero binario sono dei modi per "scorrere" tutti i nodi dell'albero in modo sequenziale, ovvero per visitare ogni nodo una sola volta. Ci sono tre modi principali per visitare gli alberi binari:

1.  Visitare l'albero in ampiezza (**breadth-first** traversal): in questo caso, si visitano prima tutti i nodi di uno stesso livello dell'albero, poi si passa al livello successivo. Ad esempio, se l'albero ha tre livelli, si potrebbe visitare prima tutti i nodi del livello 1, poi tutti quelli del livello 2 e infine tutti quelli del livello 3. La visita in ampiezza è spesso implementata utilizzando una coda per tenere traccia dei nodi da visitare.

2.  Visitare l'albero in profondità (**depth-first** traversal): in questo caso, si visita prima il nodo corrente, poi si scende il più a fondo possibile nell'albero, visitando prima il figlio sinistro e poi quello destro. Quando non ci sono più figli da visitare, si torna indietro (si "risale" l'albero) e si passa al nodo fratello (se esiste). Esistono tre varianti di visita in profondità:
	-   Visitare l'albero in ordine simmetrico (inorder traversal): si visita prima il figlio sinistro, poi il nodo corrente e infine il figlio destro.
	-   Visitare l'albero in ordine anticipato (preorder traversal): si visita prima il nodo corrente, poi il figlio sinistro e infine il figlio destro.
	-   Visitare l'albero in ordine posticipato (postorder traversal): si visita prima il figlio sinistro, poi il figlio destro e infine il nodo corrente.

### Altri tipi di alberi

Gli alberi (con radice) possono avere un numero arbitrario di figli (e di sottoalberi), e ognuno di questi nodi (eccetto la radice) ha un unico padre.
Un esempio potrebbe essere l'indice di un libro, con i vari capitoli e sottocapitoli.

Una definizione ricorsiva per gli alberi con radice potrebbe essere:

>Un albero (con radice) e':
>	- la struttura vuota
>oppure
>	- un nodo a cui sono associati $k \geq 0$ alberi 

grado di un nodo = \#figli
grado dell'albero = max grado dei figli

Un albero puo' essere rappresentato in molteplici modi:
- Una prima rappresentazione statica potrebbe esser etramite il **vettore dei padri**, ovvero un array con i valori contenuti nei nodi e un array con la posizione di ciascun nodo
- Un'altra rappresentazione statica e' il **vettore dei figli**: un array con i valori contenuti nei nodi e $d$ (grado dell'albero) array contenenti le posizioni dei figli di ogni nodo
- Una soluzione dinamica invece sono le rappresentazioni collegate:
	- tramite dei **puntatori ai figli**
	- oppure tramite una **lista dei fratelli**

### Alberi binari: \#nodi vs altezza

- numero _minimo_ di nodi per alberi di altezza $h$ e' $h + 1$
- numero *massimo* di nodi per alberi di altezza $h$ è $2^{h+1} - 1$
- numero di nodi $n$: $h+1 \le n \le 2^{h+1}-1$
- altezza albero $h$: $log_2(n+1)-1 \le h \le n-1$

### Alberi binari *quasi completi*

Un albero binario è _quasi completo_ quando è completo almeno fino al penultimo livello.

*proprietà*: una albero binario di altezza $h$ è quasi completo se e solo se ogni nodo di profondità $< h - 1$ possiede _entrambi_ i figli.

### Alberi binari _quasi completi_: \#nodi vs altezza

- completo fino ad altezza $h-1$: $2^h-1$ nodi di profondità $\le h-1$
- nodi di profondità h: almeno 1, al massimo $2^h$
- numero di nodi $n$: $2^h \le n \lt 2^{h+1}$
- altezza albero $h$: $h \le log_2(n) \lt h+1$, $h = \lfloor log_2(n) \rfloor$