param nV;
set V := 1..nV;
param nP;
set P := 1..nP;
# posizione imbocchi dei vicoli
param x {V};
param y {V};

# variabili
# posizione piattaforme rialzate
var xp {P};
var yp {P};
var w {V,P} binary;		# assegnamento dei vicoli alle piattaforme
# dinstanza di ogni vicolo della sua piattaforma
var dist_vp {v in V, p in P} = sqrt((x[v]-xp[p])^2+(y[v]-yp[p])^2);
var dist_pp {p in P: p>1} = sqrt((xp[p]-xp[p-1])^2+(yp[p]-yp[p-1])^2);

# vincoli
subject to Assign {v in V}:
	sum {p in P} w[v,p] = 1;

# obiettivo
minimize z: sum {p in P: p>1} dist_pp[p] + sum {v in V, p in P} w[v,p] * dist_vp[v,p];

data;
param nV := 10;
param nP:=3;

param:	x	y :=
1		0	1
2		0	3
3		3	7
4		5	9
5		9	9
6		11	8
7		11	7
8		11	4
9		8	1
10		6	1;

#var:	xp	yp :=
#1		3	5
#2		6	5
#3		9	5;


end;