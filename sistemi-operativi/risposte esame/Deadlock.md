#sistemi-operativi 

In un ambiente con multiprogrammazione più thread possono competere per ottenere un numero finito di risorse; se una risorsa non è correntemente disponibile, il thread richiedente passa allo stato di attesa. In alcuni casi, se le risorse richieste sono trattenute da altri thread, a oro volra nello stato d'attesa, il thread potrebbe non cambiare più il suo stato. Questa situaizone è chiamata **dead lock**.

Per avere un dead lock è necessario che queste queste condizioni si verifichino contemporaneamente.
1. **Mutua esclusione**, almeno una risorsa deve essere non condivisibile, vale a dire che è utilizzabile da un thread solo alla volta.
2. **Possesso e attesa**, un thread deve essere in possesso di almeno una risorsa e attendere di acquisire risorse già in possesso di altri thread.
3. **Nessun rilascio anticipato** (*no pre-emption*), le risorse non possono essere prelazionate, una risorsa può essere rilasciata dal thread che la possiede solo volontariamente, dopo aver terminato il proprio compito.
4. **Attesa circolare**, deve esistere un insieme di thread, tale che $T_0$ attende una risorsa posseduta da $T_1$, $T_1$ attende una risorsa posseduta da $T_2$, $T_3$ attende una risorsa posseduta da $T_1$.

Per descrivere facilmente situazioni di deadock possiamo avvaverci di una rappresentazione detta grafo di assegnazione delle risorse. Si tratta di un insieme di vertici V e un insieme di archi E, l'insieme di vertici V è composto da due sottoinsiemi che rappresentano i thread e i tipi di risorse del sistema.
Un arco diretto da un thread a un tipo di risorsa significa che quel determinato thread ha richiesto quel tipo di risorsa e attualmente è in attesa. Mentre un arco diretto da un'istanza di un tipod di risorsa (rappresentata da un puntino dentro il tipo di risorsa) a un thread significa che quel'istanza è assegnata a quel thread.

Per gestire le situazioni di stallo possiamo muoverci in 3 diversi modi:
- si può **ignorare** del tutto il problema e riavviare il sistema nel caso avvenga un deadlock.
- si può **provare** a prevenire una situazione di stallo accertandosi che almeno una delle condizioni necessarie non possano verificarsi.
- si può **evitare** il deadlock (_deadlock avoidance_), che non impedisce ai processi di effettuare le richieste, ma se queste potrebbero causare stalli le blocca.
- si può rilevare e recuperare un deadlock, ovvero non si applica nessuna tecnica per impedire l'occorrere di una situazione di stallo, ma si fornisce un modo per rilevarlo e poi ripristinare il sistema.

Prevenire il deadlock significa fare in modo che almeno una delle quattro condizioni per cui si verifica sia soddisfatta. Studiamo i casi separatamente.

### Mutua esclusione

Le risorse condivisibili, non richiedono l'accesso mutuamente esclusivo, perciò non possono essere coinvolte in uno stallo dunque bisogna verificare che il principio di mutua esclusione sia applicato solo su quelle risorse intrinsecamente non condivisibili.

### Possesso e attesa

La condizione di possesso e attesa può essere invalidata impondendo che i processi richiedano tutte le risorse all'avvio, oppure imponendo che un processo, prima di fare una richiesta, rilasci tutte le risorse che possiede e le richieda tutte in blocco. In entrambi i case si ha un sottoutilizzo delle risorse e possibile starvation; inoltre, nel secondo caso, si richiede ai programmatori di rilasciare le risorse in stato consistente poichè potrebber essere assegnate ad altri processi.

### Nessun rilascio anticipato

Questa condizione può essere invalidata in due modi: se un processo viene messo in attesa per una richiesta, rilascerà tutte le sue risorse anticipatamente e attenderà per la richiesta iniziale più le risorse che già possedeva. Oppure, si può solamente rilasciare anticipatamente le risorse di processi in attesa che sono richieste da un processo in esecuzione.
Ovviamente questo metodo funzionerà bene con risorse il cui stato può essere salvato e ripristinato.

### Attesa circolare

Infine questa condizione si può invalidare imponendo un ordine sulle risorse, ovvero assegnando ad ogni risorse un numero intero e imponendo ai processi un rigido protocollo. Per esempio se un processo richiede delle risorse di ordine $i$, esso potrà ottenerle se soltanto son disponibili e se non possiede già risorse di ordine $>= i$, se il processo ne possiede già allora sarà obbligato a rilasciare tutte le risorse che possiede e rifare la richiesta per le risorse in ordine.

Per evitare un deadlock possiamo evitare di porre vincoli su come fale le richieste, ma possiamo chiedere ulteriori informazioni al processo sul suo utilizzo delle risorse in modo da poter verificare se lo stato risultante dopo una richiesta è sicuro oppure no. 
Uno stato è sicuro se per n processi esiste almeno una sequenza sicura, ovvero una sequenza di n processi per cui le richieste di ogni processo $P_i$ della sequenza possono essere soddisfatte con le risorse attualmente disponibili più quelle detenute dai processi $P_j$ con $j < i$. Se non esiste tale sequenza, lo stato si dice non sicuro. Uno stato sicuro garantisce l'assenza di deadlock, mentre uno stato non sicuro non è detto che non ci saranno deadlock.

Per implementare questa cosa abbiamo due metodi:
una variante del grafo di allocazione delle risorse, infatti ci basterà aggiungere un nuovo tipo di arco, chiamato arco di prenotazione. Questo ci indicherà quali risorse saranno prima o poi necessarie ad un processo. Ora ci basterà rilevare un ciclo sugli archi di prenotazione in modo da scovare una possibile futura stuazione di stallo, dunque quel processo andrà evitato e lasciato in attesa.
In caso di istanze multiple si può utilizzare il più complesso algoritmo del banchiere, esso fa uso di strutture più complesse per mantenere le informazioni sui processi. Quando un processo fa una richiesta, si controlla se è valida e se è soddisfacibile, quindi si modifica le strutture dati per simulare l'assegnazione della risorsa, ed esegue l'algoritmo di verifica dello stato sicuro: si cercano tutti i processi il cui fabbisogno può essere soddisfatto con le attuali disponibilità più le risorse assegnate ai processi analizzati precedentemente. Se alcuni processi rimangono scoperti, lo stato non è sicuro, si ripristinano i vecchi valori delle strutture e il processo deve attendere.

Rilevare e risolvere un deadlock consente di aumentare l'utilizzo delle risorse perchè lasciamo che il deadlock si verifichi, e usare delgi algoritmi per rilevarlo e risolverlo.
In caso di istanze singole delle risorse, si può usare il grafo di attesa: una variante del grafo di allocazione 
BOOOH BASTA