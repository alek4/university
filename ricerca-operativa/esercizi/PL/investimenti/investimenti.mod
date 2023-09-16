# DATI
set Mercati := 1..3;
set Fondi := 1..4;
param r {Mercati, Fondi};
set Azioni := 1..4;
param max_azioni {Mercati, Azioni};
param c_fondi {Azioni, Fondi, Mercati};
param capitale;

# VARIABILI
var x {Mercati, Fondi} >= 0;
var y {i in Mercati, j in Azioni} >= 0, <= max_azioni[i,j];

# VINCOLI
subject to Composizione {i in Mercati, j in Azioni}:
    sum {k in Fondi} x[i,k] * c_fondi[j,k,i] = y[i,j];

subject to Budget:
    sum {i in Mercati, j in Azioni} y[i,j] <= capitale;

# Obiettivo
maximize z: sum{i in Mercati, j in Fondi} x[i,j] * r[i,j];

# OBIETTIVO

data;

param capitale :=  1130;

param r:        1       2       3       4 :=
1                     .35    .1      .6      .4
2                     .1      .3      .8       .3
3                     .4      .3      .2       .1;

param max_azioni:       1       2       3       4 :=
1                                      100  100   79     98    
2                                      150  120   80     90
3                                      110    90   200   130;

param c_fondi :=
[*,*,1]:  1       2       3       4 :=
1           .5      .1      .25     .20
2           .3      .8      .2      0
3           .2      0       .35     .3
4           0       .1      .2      .5
[*,*,2]:  1       2       3       4 :=
1           .9      .2      .0      .1
2           .1      .3      .2      .7
3           0      .4        0      .1
4           0       .1      .8      .1
[*,*,3]:  1       2       3       4 :=
1           .7       0      .1      .2
2           .2      .1      .5      .2
3           .1      .1      .3      .6
4           0       .8      .1       0;


end;
