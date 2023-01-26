#sistemi-operativi 

La concorrenza sussiste quando ho più processi che richiedono l'accesso a risorse condivise usabili solo in mutua esclusione. Per mutua esclusione si intende banalmente che non possono essere compiute contemporanteamente sulla stessa risorsa operazioni incompatibili da parte di più processi.
Il suo scopo è dunque preservare la consistenza dell'informazione; la sincronizzazione è l'insieme di politiche e meccanismi che si occuperanno di garantire tale principio per l'uso si risorse condivise, che queste siano fisiche o informative.

Le corse critiche sono situazioni in cui più processi accedono agli stessi dati in maniera concorrente e il risultato dell'esecuzione dipende dall'ordine in cui ha avuto luogo l'acceso. Questa non è legata a problemi di lettura e scrittura contemporanea ma possono crearsi errori nell'aggiornamento del contatore del buffer.

La sezione critica è una porzione di codice che può generare corse critiche se eseguita in modo concorrente. Lo scopo della sua indivisuazoine è quello di creare un protocollo che possa essere utilizzato per bypassare i problemi di inconsistenza; la soluzoine deve dunque soddisfare tre condizioni:
- mutua esclusione, se un processo sta eseguendo la sua sezione critica nessun altro può farlo
- progresso, stabilisce che solo chi non sta eseguendo la propria sezione critica può concorre con gli altri per accedervi
- attesa limitata, bisogna cioè fare in modo che nessun processo attenda troppo a lungo di evolversi
Dunque le sezioni critiche di codice devono avere accesso esclusivo alle variabili condivise, e devono sfruttarle in modo rapido perchè altri processi che usano la stessa risorsa non debbano attedere indefinitivamente. 

Un tipo di approccio a livello di istruzioni per la sincronizzazione di due processi che interagiscono per accedere in modo concorrente a una risorsa.
Questo algoritmo garantisce la mutua esclusione imponendo una stretta alternanza dei processi. Se ad esempio ho un produttore che vuole deporre più informazioni durante il suo turno, non potrà farlo erchè dovrà aspettare che il consumatore esaurisca il suo. In più non viene più garantito il progresso.

Un secondo algoritmo associa un flag per ogni processo in modo che sia impostato a true quando sono nella sezione critica, false altrimenti.
Anche questo algoritmo garantisce la mutua esclusione ma senza imporre una stretta alternanza dei processi, dato che chi fa richiesta di accesso a una risorsa controlla dai valori dei flag se gli è consentito o meno. Continua però a non garantire il progresso e per di più potrebbe portare un processo ad attendere indefinitivamente.

Il terzo algoritmo utilizza sia flag che variabile di turno, i primi per la prenotazione della risorsa e l'altro per stabilire chi ha l'accesso. Questo algoritmo garantisce sia la mutua esclusione che il progresso.

La variabile di lock è una variabile condivisa che definisce lo stato di uso di una risorsa, cioè quando è in uso da parte di un processo; il suo valore può essere 0 se la risorsa è libera, o 1 se la risorsa è occupata. Cambia così il punto di vista rispetto alla variabile di turno: non sono più i processi ad alternarsi ma è la risorsa stessa a dire se è disponibile o no.
I lock sono un metodo che scala benissimo perchè non importa quanti sono i processi che vogliono una risorsa, lui sara sempre o libero o occupato.
Avviene così l'acquisizione di una risorsa:
- disabilito le interruzioni
- leggo la variabile di lock
- se la risorsa è libera, la marco in uso ponendo lock = 1 e riabilito l einterruzioni
- se la risorsa è in uso, riabilito le interruzioni e pongo il processo in attesa che la risorsa si liberi
- per rilasciare la risorsa pongo lock = 0

Il motivo per cui vanno bloccate le interruzioni è che le operazioni di lettura ed eventuale scrittura di un lock sono realizzate con una sequenza di istruzoni machcina, quindi interrompibili. Se quindi non mi tutelo sospendendo gli interrupt finirei per avere una corsa critica nello stesso sistema che uso per prevenirle.

Al posto di lasciare la gestione delle variabili lock in mano agli sviluppatori, possiamo introdurre i semafori binari, una struttura dati gestita da l sistema operativo che rappresenta lo stato di uso della risorsa condivisa: ha valore 1 se la risorsa è libera, 0 se è in uso.
Le funzioni succitate per la manipolazione del semaforo sono atomiche proprio in quanto chiamate di sistema e vanno utilizzate allìentrata e all'uscita della sezione critica di un processo. Esse sono:
- acquire, richiede l'uso della risorsa 
- release, rilascia la risorsa 

DIO MEO









