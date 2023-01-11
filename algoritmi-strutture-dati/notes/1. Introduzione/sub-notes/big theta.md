Theta grande (pronunciato "big theta") è una notazione asintotica utilizzata per descrivere il limite esatto del tempo di esecuzione o dell'utilizzo della memoria di un algoritmo. La definizione matematica di Theta grande è la seguente:

f(n) = Θ(g(n)) se esistono due costanti positive $c1$ e $c2$ e un numero intero $n_0$ tale che, per ogni $n ≥ n_0$, vale la seguente condizione:
$$
c1 * g(n) ≤ f(n) ≤ c2 * g(n)
$$
In questa definizione, f(n) rappresenta il tempo di esecuzione o l'utilizzo della memoria dell'algoritmo per un input di dimensione n, e g(n) rappresenta la funzione di crescita asintotica che