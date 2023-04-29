data cement;
input x1-x4 y;
datalines;
7 26 6 60 78.5
1 29 15 52 74.3
11 56 8 20 104.3
11 31 8 47 87.6
7 52 6 33 95.9
11 55 9 22 109.2
3 71 17 6 102.7
1 31 22 44 72.5
2 54 18 22 93.1
21 47 4 26 115.9
1 40 23 34 83.8
11 66 9 12 113.3
10 68 8 12 109.4
;
run;
proc print data=cement;
proc reg data=cement;
model y = x1 x2 x3 x4;
title ‘Regression Analysis of Hald Data’;
run;
proc reg data=cement simple corr;
model y = x1 x2 x3 x4/clb xpx i;
title ‘Regression Analysis of Hald Data’;
run;
proc reg;
*model y = x1 x2 x3 x4/ vif ;
model y = x1 x2 x3 x4/ ;
run;
proc reg data=cement;
model y = x1 x2 x3 x4/ ss1 ss2;
run;
proc reg data=cement corr;
*model y = x1 x2 x3 x4/ selection=f sle=0.05;
*model y = x1-x4/selection=b sls=.1;
*model y = x1-x4/selection=stepwise sle=.15 sls=.15;
*model y=x1-x4/selection=rsquare mse cp;
model y = x1-x4/selection=rsquare start=1 stop=3 best=2 adjrsq mse aic cp;
title ‘Regression : Variable Subset Selection Techniques’;
run;
proc reg data=cement;
model y = x1 x2 /clb vif;
model y = x1 x2 /clb vif;
run;