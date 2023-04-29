data athlate;
input ID  Age Race $ SBP DBP Heart_Rate;
Avg_BP=1/3*SBP+2/3*DBP;
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
;
run;
proc print noobs;
run;

data practice.athlate1;
set athlate;
proc print data=practice.athelate1;
proc means data=practice.athlate1;
var Age SBP DBP;
class Race;
output out=Des_athlate mean= avg_Age avg_SBP avg_DBP std=sd_Age sd_SBP sd_DBP;
run;
proc print data=Des_Athlate;
run;
proc univariate data=practice.athlate cibasic (alpha=0.10) mu0=130;
var SBP;
run;

proc univariate data=practice.athlate cibasic;
var DBP;
run;
proc univariate data=practice.athlate plots normal;
var SBP;
run;

proc univariate data=practice.athlate ;
var SBP;
histogram ;
run;
proc univariate data=practice.athlate plots;
var SBP;
run;
* Here proc sgplot is used to get boxplot of given variable ;
* vbox command is used to get vertical boxplot/;
proc sgplot data=mydata.athlate ;
vbox sbp;
title 'Boxplot of SBP varibale from Athlate data';
run;
*hbox command is used to get vertical boxplot/;
proc sgplot data=mydata.athlate ;
	hbox sbp;