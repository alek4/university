#algoritmi-strutture-dati  #algoritmo 

Gli algoritmi di QuickUnion fanno parte della famiglia delle [[Union-Find]], ovvero degli algoritmi utilizzati per gestire l'unione di insiemi di elementi e la ricerca del rappresentante di un elemento in un insieme. Gli algoritmi di QuickUnion sono caratterizzati dalla loro velocità di esecuzione nell'operazione di unione degli insiemi, ma sono più lenti nell'operazione di ricerca del rappresentante di un elemento. Essi sono rapprensentati da alberi di varie altezze, i cui nodi sono gli elementi e la radice e' il nodo che da' il nome all'insieme.

![[QuickUnion.excalidraw|1000x800]]

Gli algoritmi di QuickUnion sono semplici da implementare e sono adatti a problemi in cui le operazioni di unione degli insiemi sono frequenti rispetto alle operazioni di ricerca del rappresentante di un elemento. Tuttavia, non sono molto efficienti in termini di tempo di esecuzione quando le operazioni di ricerca del rappresentante di un elemento sono frequenti.

### "QuickUnion" con *UNION* bilanciata / *UNION* by rank

Attacchiamo la radice dell'albero piu' basso sotto quella dell'albero piu' alto.
Esempio UNION(A, B): se il rank(A) $\ge$ rank(B) allora posso attaccare direttamente B ad A, se invece rank(A) $\lt$ rank(B) allora attacchero' sempre l'albero di altezza minore a quello di altezza maggiore, ma scambiero' anche le radici.
Per modificare l'algoritmo di UNION dovremo anche memorizzare nella radice l'altezza dell'albero.

```python
if rank(A) > rank(B) then
	rendi la radice di B figlia di quella di A
else if rank(A) < rank(B) then
	rendi la radice di A figlia di quella di B
	scambia i contenuti dei nodi A e B
else
	rendi la radice di B figlia di quella di A
	rank(A) <- rank(A) + 1
```

Per le restanti due operazioni di _MAKESET_ e _FIND_, rimarranno uguali; solo _MAKESET_ dovra' aggiungere alla radice che il rank e' 0.

_Lemma_: Ogni albero "QuickUnion" costruito effetturando operazioni di _UNION_ bilanciate, contiene almeno $2^{rank(x)}$, $x$ radice.

_Dimostrazione_: 

> k = \#operazioni UNION utilizzare per ottenere l'albero con radice $x$.
> Induzione su k:
> - k = 0 -> 0 UNION
> - k $>$ 0 -> ultima UNION: UNION(A, B)
>
> ipotesi induttiva:
> - nodi(A) $\ge$ $2^{rank(A)}$  
> - nodi(B) $\ge$ $2^{rank(B)}$  

#TODO finire dimostrazione

_Corollario_: n nodi -> altezza $\le$ $log_{2}n$
=> _FIND_ usa tempo $O(log(n))$
