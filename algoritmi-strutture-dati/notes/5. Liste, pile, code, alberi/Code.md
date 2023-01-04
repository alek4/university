#algoritmi-strutture-dati  #struttura-dati

Le code (chiamate anche "code FIFO", dall'inglese First In First Out, ovvero "primo entrato, primo uscito") sono un tipo di dato strutturato che permette di memorizzare una sequenza di elementi in modo da poterli recuperare in un ordine specifico. In particolare, le code seguono il principio **FIFO**, ovvero gli elementi vengono inseriti (**enqueue**) e rimossi (**dequeue**) da due estremità diverse, chiamate rispettivamente "testa" e "coda" della pila.

Le code sono molto utili in diverse situazioni, ad esempio per:

-   Gestire l'accesso a risorse condivise, ad esempio in un sistema operativo per gestire le richieste di I/O.
-   Implementare l'invio di messaggi in un sistema di comunicazione.
-   Implementare l'attesa di un evento in un programma di simulazione.

Le operazioni più comuni che possono essere eseguite su una coda sono:

-   **Enqueue**: inserisce un nuovo elemento alla fine della coda.
-   **Dequeue**: rimuove l'elemento in testa alla coda e lo restituisce.
-   **Peek**: restituisce l'elemento in testa alla coda senza rimuoverlo.
-   **IsEmpty**: verifica se la coda è vuota.

Le code possono essere implementate utilizzando diverse strutture dati, ad esempio array o [[Liste]] concatenate. Ogni implementazione ha i suoi vantaggi e svantaggi in termini di efficienza e semplicità di implementazione.