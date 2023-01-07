#algoritmi-strutture-dati 

Calcolare cammini minimi e' un problema classico molto importante con applicazioni su reti di telecomunicazioni e di trasporto, e appare spesso come sottoproblema di altri problemi.

Dato un [[Introduzione ai grafi|grafo]] orientato $G=(V,E)$, assumiamo che ogni arco $(x,y)$ abbia associato un peso, descritto da una funzione $\omega: E$ -> $R$. Se due vertici sono *connessi* allora esiste un cammino che li collega cosi' definito: $\Pi = <v_0, v_1,..., v_k>$  (cammino da $v_0$ a $v_k$). Di conseguenza, il *peso di un cammino* e' definito come la somma dei pesi dei suoi archi:
$$
\omega(\Pi) = \sum_{i=1}^{k}\omega(v_{i-1}, v_i)
$$
Un *cammino minimo* e' definito come segue:

>$\Pi_*$ e' un _cammino minimo_ da $x$ a $y$ se:
>	1. $\Pi_*$ e' un _cammino_ da $x$ a $y$
>	2. per ogni cammino $\Pi$ da $x$ a $y$: $\omega(\Pi) \ge \omega(\Pi_*)$

### Proprieta'

1. Se $\Pi_*$ e' un cammino minimo da $x$ a $y$ e $\Pi_*$ passa per $v_i$
	- la parte di $\Pi_*$ da $x$ a $v$ e' un cammino minimo da $x$ a $v$
	- la parte di $\Pi_*$ da $v$ a $y$ e' un cammino minimo da $v$ a $y$

![[Cammini minimi.excalidraw]]

_Note_: [[Bellman optimality principle|Principio di ottimalita']]

2. Se tutti i pesi sono positivi allora ogni cammino minimo e' _semplice_.
>$\Pi$: $x$ -> $...$ -> $z$ -> $...$ -> $z$ -> $...$  -> $y$
>$\omega(\Pi)=\omega(\Pi')+\omega(\Pi'')+\omega(\Pi''')$
>$\overline{\Pi}$: $x$ -> $...$ -> $z$ -> $...$  -> $y$
>$\omega(\overline{\Pi})=\omega(\Pi')+\omega(\Pi''') \lt \omega(\Pi)$

3. Se ci sono pesi negativi, ma _non_ ci sono cicli di peso negativo allora se $\exists$cammino da $x$ a $y$ allora $\exists$cammino minimo da $x$ a $y$ che e' _semplice_. 

### Rappresentazioni di grafi pesati

1. Lista di adiacenza con pesi: semplicemente al posto di memorizzare solo il nodo a cui e' adiacente, assieme salvo anche il peso dell'arco che li collega
2. Matrice dei pesi: e' una matrice di adiacenza, dove al posto di mettere un 1 per indicare che i nodi sono collegati, metto il peso dell'arco, mentre se i nodi non sono collegati metto un infinito

### Problemi di "Cammini minimi"

Esistono diversi problemi su i cammini minimi, alcuni possono essere piu' difficili di altri. Eccone alcuni:
- Trovare il cammino minimo tra due vertici (_non_ esistono algoritmi diretti)
- Trovare i cammini minimi tra un vertice $s$ e tutti gli altri ([[Bellman & Ford]] e [[Dijkstra]])
- [[Floyd & Warshall|Trovare i cammini minimi tra ogni coppia di vertici]]

