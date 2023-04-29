*Q3;
data scoredata;
input A $ Scorevalues @@;
datalines;
P 77 P 76 P 74 P 72 P 78
D 80 D 84 D 88 D 87 D 90
run;
proc print data=scoredata;

data subsetscoredata;
set scoredata;
if scorevalues>78;
run;
proc print data=subsetscoredata;

*Q4;
data demography;
input Gender $ Age Weight Height;
datalines;
M 50 68 155
F 23 60 165 
M 65 72 180 
F 35 55 154 
M 15 35 158
run;
title Demography;
proc freq data=demography;
table Gender;
proc means data=demography;
Var Age Weight height;

*------------------------------------;
data biology;
input Id sex $ Age Year Height Weight;
datalines;
7389 M 24 4 69.2 132.5
3945 F 19 2 58.5 112.8 
4721 F 20 2 65.3 98.6
1835 F 24 4 62.8 102.5
9541 M 21 3 72.5 152.3
2957 M 22 3 67.3 145.8
2158 F 21 2 59.8 104.5
4296 F 25 3 62.5 132.5
4824 M 23 4 74.5 184.4
5736 M 22 3 69.1 149.5
8765 F 19 1 67.3 130.5
5734 F 18 1 64.3 110.2 
run;
proc print data=biology;
run;
*Q1) Obtain the means of Age,Height and Weight.;
proc means data=biology;
var Age Height Weight; 
run;

*Q2) Obtain the Discptive statistics of Age Height and Weight by Gender wise.;
proc means data=biology;
var Age Height Weight;
class Sex;
run;

*Q3) Obtain the Discptive statistics of Age Height and Weight by Gender and year wise.;
proc means data=biology;
var Age Height Weight;
class year sex;

*Q4) store Descriptive statistics in a specific variable.;
proc means data=biology;
class year sex;
Output out=Stats_biology mean=av_height av_weight std=sd_height sd_weight skewness=sk_height sk_weight median=md_height md_weight;
proc print data=Stats_biology;
run;

*Q5) Use univariate command to check the distribution of data.;
proc univariate data=biology;
var Height;
run;

*Q6) Use proc mean command and get the output upto two decimel;
proc means data=biology maxdec=2;
run;
