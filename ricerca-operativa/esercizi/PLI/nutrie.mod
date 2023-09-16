set Paesi;
param nn {Paesi};
param nC;
set C := 1..nC;

var x {Paesi, C} binary;
var target {C} >=0;
var maxtarget;
 
subject to Num_paesi_per_cacciatore {c in C}:
	sum {p in Paesi} x[p,c] <= 3;

subject to Target {c in C}:
	target[c] = sum {p in Paesi} nn[p]*x[p,c]/sum {c1 in C} x[p, c1];
	
subject to MinCacc {p in Paesi}:
	sum {c in C} x[p, c] >= 1;

minimize z: maxtarget;
subject to Minmax {c in C}: maxtarget >= target[c];

data;
set Paesi := A B C D E F G H I;

param nn :=
A	20
B	30
C	24
D	36
E	80
F	72
G	54
H	37
I	25
L	47;

end;