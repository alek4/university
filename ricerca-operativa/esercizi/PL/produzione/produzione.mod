set Prodotti;
set Mesi := 1..12;
param cprod {Mesi, Prodotti};											# costi di produzione [€/unità]
param cstock {Mesi};										# costi stoccaggio [€/unità]
param cap_prod {Mesi, Prodotti};									# capacità produttiva [unità]
param domanda {Mesi, Prodotti};									# domanda [unità]
param cap_mag;												# capacità del magazzino [unità]
param y0 {Prodotti};															# stoccaggio iniziale [unità]

# variabili
var x {i in Mesi, j in Prodotti} >= 0, <= cap_prod[i, j];			# produzione mensile
var y {i in Mesi, j in Prodotti} >= 0;				# prodotti in stoccaggio

# vincoli
subject to max_cap_mag {i in Mesi}:
		sum {j in Prodotti} y[i,j] <= cap_mag;

subject to fcc{i in Mesi, j in Prodotti: i > 1}:
		y[i-1, j] + x[i, j] = domanda[i, j] + y[i, j];

subject to fcc1 {j in Prodotti}:
		y0[j] + x[1, j] = domanda[1, j] + y[1, j];

# obiettivo
minimize z: sum {i in Mesi, j in Prodotti} x[i,j] * cprod[i,j] + sum {i in Mesi} (sum {j in Prodotti} y[i,j]) * cstock[i];

data;

set Prodotti := X Y;

param y0 := 
X		0
Y		0;

param cprod:		X		Y :=
1          125          240
2         140          245
3            140          230
4				150          230
5           130          225
6				120          220
7           100          215
8           170          240
9        135          225
10          145          235
11         160          240
12         175          250;

param cstock :=
1						45
2         45
3            40
4           25
5           20
6           10
7           10
8           10
9        15
10          25
11         35
12         40;

param cap_prod:		X		Y :=
1										2400         1000
2										2300          900
3										2500         1000
4										2500         1000
5										2450         1000
6										2550         1000
7										2300          900
8										1200          400
9										2200         1000
10									2500         1000
11									2500         1000
12									1800          700;

param domanda:		X		Y :=
1         1800          500
2        1700          400
3           1800          500
4          1800          600
5          1900          700
6          2300          800
7          2500          900
8          2500         1000
9       2000          800
10         1800          800
11        1700          800
12        2000         1000;

param cap_mag := 2500;

end;
