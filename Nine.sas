data Athelate;
input Id Age Race $ SBP DBP HR;
ABP=1/3*SBP+2/3*DBP;
datalines;
4101 18 W 130 80 60
4102 18 W 140 90 70
4103 19 B 120 70 64
4104 17 B 150 90 76
4105 18 B 124 86 72
4106 19 W 145 94 70
4107 23 B 125 78 68
4108 21 W 140 85 74
4109 18 W 150 82 65
4110 20 W 145 95 75
run;
proc print data=Athelate noobs;
data Practice.Athelate;
SET Athelate;
proc means data=Athelate;
var Age SBP DBP HR;
output out=desp_athelate mean=av_Age av_SBP std=sd_Age sd_SBP;
proc print data=desp_athelate;

* Obtain test statistis for Age variable;
* Hypothesis H0:mu0=0;
proc univariate data=athelate cibasic(type=upper alpha=0.10) mu0=120;  /* If we want the whole confidence interval then we can neglect the 'type' command*/
var Age;
proc univariate data=athelate cibasic;
proc univariate data=Practice.Athelate plots normaltest;
var Age;
histogram;

/* Here we are using sgplot command to get boxplot of given variable */
/* vbox command is used to get vertical boxplot */
proc sgplot data=practice.athelate;
vbox SBP;
yaxis grid;
title "Boxplot of SBP Variable From Athelate data";

/* hbox command is used to get horizontal boxplot */
proc sgplot data=Practice.Athelate;
hbox SBP;
title "Horizontal Boxplot of SBP Variable From Athelate data";

proc plot data=Practice.Athelate;
plot SBP*DBP;
title "Scatter plot of SBP and DBP Variable";

*------------------------------------------------------------;
data disease;
input Severity $ Herd_size $ Count @@;
datalines;
a1 b1 11 a1 b2 88 a1 b3 136
a2 b1 18 a2 b2 4  a2 b3 19
a3 b1 9  a3 b2 5  a3 b3 9
run;
proc print data=disease;
proc freq;
weight count;
tables Severity*Herd_size;
tables Severity*Herd_size / chisq nocol nopercent norow measures;





