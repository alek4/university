#Esercizio sentinelle
# DATI
param n;																# numero di vertici del grafo
set N := 1..n;															# vertici del grafo
set E within N cross N;									# lati del grafo

var x {N} binary;

minimize z: sum {i in N} x[i];

subject to Controllo {i in N}:
		x[i] + sum {j in N: (i,j) in E or (j,i) in E} x[j] >= 1;


data;
param n := 30;
set E :=
1 2, 11 23
1 3, 11 29
1 4, 12 13
2 30, 12 18
3 13, 12 19
3 16, 12 27
4 5, 13 14
4 6, 14 15
4 24, 14 18
5 6, 15 16
5 8, 15 17
5 13, 18 19
6 7, 18 28
7 9, 19 20
7 10, 19 28
8 9, 20 21
8 12, 20 22
8 13, 20 29
8 27, 24 25
9 10, 24 26
9 27, 27 29
10 11;

end;
