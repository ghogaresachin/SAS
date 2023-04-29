data cement;
input X1 X2 X3 X4 y;
datalines;
7  26 6  60 78.5
1  29 15 52 74.3
11 56 8  20 104.3
11 31 8  47 87.6
7  52 6  38 95.9
11 55 9  22 109.2
3  71 17 6  102.7
1  31 22 44 72.5
2  54 18 22 93.1
21 47 4  26 115.9
1  40 23 34 83.8
11 66 9  12 113.3
10 68 8  12 109.4
run;
proc print data=cement;
proc reg simple corr data=cement;
model y = X1 X2 X3 X4;
title 'Regression Analysis of Hald Data';
proc reg simple corr data=cement;
model y = X1 X2 X3 X4/clb xpx i;
title 'Rgression Analysis of Hald Data';

/* Variance Inflation Factor */
proc reg ;
model y= X1 X2 X3 X4/vif;
 
/* Partial */
proc reg;
model y= X1 X2 X3 X4/ ss1 ss2;
proc reg corr;
model y= X1-X4/selection=f sle=0.05;
model y= X1-X4/selection=b sls=.1;
model y= X1-X4/selection=stepwise sle=0.05 sls=0.15;
model y= X1-x4/selection=rsquare start-1 stop-3 best-2 adjrsq mse aic cp;

