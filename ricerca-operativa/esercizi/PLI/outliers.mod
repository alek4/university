param n;
set N := 1..n;
param x {N};
param y {N};
param K;				# numero consentito di outliers (da 0 a 6)

var m;
var q;
var w {N} binary;		# 1 = trascurato / outlier

subject to MaxNOutliers:
	sum {i in N} w[i] <= K;

minimize f: sum {i in N} (1-w[i])*(m*x[i]+q - y[i])^2;