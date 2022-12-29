#algoritmi-strutture-dati  

Un algoritmo che si basa sulla tecnica [[Divide-et-impera]] suddivide il generico input di dimensione $n$ in un certo numero ($m$) di sottoistanze del medesimo problema, ciascuna di dimensione $n/a$ per qualche $a > 1$; quindi richiama ricorsivamente se stesso su tali istanze ridotte e poi ricompone i risultati parziali per ottenere la soluzione cercata.
Dunque la soluzione per ottenere il tempo di calcolo di questo tipo di algoritmi è una formula di ricorrenza della forma:
$$
T(n) = mT(\frac{n}{a}) + g(n)
$$
dove $g(n)$ è il tempo necessario per ricomporre i risultati parziali di un'unica soluzione.

Teorema: siano $m, a, b$ e $c$ numeri reali positivi e supponiamo $a>1$. Per ogni $n$ potenza di $a$, sia $T(n)$  definita dalla seguente equazione:
$$
\begin{cases}
	b \text{ se n = 1}  \\
	mT(\frac{n}{a}) + bn^c \text{ se n > 1}
\end{cases}
$$
Allora $T(n)$ soddisfa le seguenti relazioni:
$$
T(n) =
\begin{cases}
	\Omega(n^c) \text{ se m < $a^c$}\\
	\Omega(n^clogn) \text{ se m = $a^c$}\\
	\Omega(n^{log_{a}m}) \text{ se m > $a^c$}
\end{cases}
$$
