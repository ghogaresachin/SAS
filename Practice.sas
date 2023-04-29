data babedata;
set practice.babedata;
proc print data=babedata;

/* Q: Assign two treatments A and B to 10 subjects using treatment adaptive randomization and 
give its sample fraction.*/
data random;
do i=1 to 10;
x=rand('bernoulli',0.5);
if x='1' then y='T';
if x='0' then y='R';
output;
end;
proc print data=random noobs;

/* Q: There are 30 patient involved in study. Assign two drugs (Active drug and Placebo) to all 
these patients using complete randomization.*/
data clinical;
do i=1 to 30;
x=rand('bernoulli',0.5);
if x='1' then y='T';
if x='0' then y='R';
output;
end;
proc print data=clinical;

/* Q: Assign treatments “Placebo” and “Active Drug" to 30 subjects using permuted block 
randomization with block size 10.*/
proc iml;
s1=do(1,30,1);
block=3;
start=0;
smpl=j(30,1,.);
do j=1 to block;
y1=do(1,10,1)`;
n=10;
p=repeat(1/n,nrow(y1),1);
s=sample(y1,n,"wor",p)`;
do i=1 to n;
if s[i]<5.5 then smpl[start+i]=1;
if s[i]>5.5 then smpl[start+i]=2;
end;
print s1 smpl;
start=start+n;
end;


proc iml;
x=j(12,1,"Sachin");
print x;

data household;
input Graduation $ Employment$ count;
cards;
Graduates selfempy 1400 
Graduates other 800
nongraduates selfempy 1800
nongraduates other 1000
proc freq order=data;
weight count;
tables Graduation*Employment/chisq;
run;


data laptop;
set practice.laptops;
proc print data=laptop;


data rats;
input level source @;
do i=1 to 10;
input wt @;
output;
end;
cards;
1 1 73 102 118 104 81 107 100 87 117 111
1 2 98 74 56 111 95 88 82 77 86 92
1 3 94 79 96 98 102 102 108 91 120 105
2 1 90 76 90 64 86 51 72 90 95 78
2 2 107 95 97 80 98 74 74 67 89 58
2 3 49 82 73 86 81 97 106 70 61 82
;
run;
proc glm ;
class level source;
model wt = level source level*source;
contrast ‘animal vs. vegetable’
source 1 -2 1;
contrast ‘beef vs. pork’
source 1 0 -1;
contrast ‘an. vs. veg. x level’
level*source 1 -2 1 -1 2 -1;
contrast ‘bf. vs. pk. x level’
level*source 1 0 -1 -1 0 1;
run;

data auto;
input driver 1. @;
do car=1 to 5;
input mpg @;
output;
end;
datalines;
1 25.3 28.9 24.8 28.4 27.1
1 25.2 30.0 25.1 27.9 26.6
2 33.6 36.7 31.7 35.6 33.7
2 32.9 36.5 31.9 35.0 33.9
3 27.7 30.7 26.9 29.7 29.2
3 28.5 30.4 26.3 30.2 28.9
4 29.2 32.4 27.7 31.8 30.3
4 29.3 32.4 28.9 30.7 29.9
;
run;
proc glm data=auto;
class driver car;
model mpg =driver car driver*car;
random driver car driver*car/test;
title ‘Study of Variation in Gasoline Consumption’;
run;

data reg;
input H LOAD XRAY BEDDAYS POP LENGTH HOURS;
datalines;
1 15.57   2463  472.92   18.0  4.45  566.52
2 44.02   2048  1339.75  9.5   6.92  696.82
3 20.42   3940  620.25   12.8  4.28  1033.15
4 18.74   6505  568.33   36.7  3.90  1603.62
5 49.20   5723  1497.60  35.7  5.50  1611.37
6 44.92   11520 1365.83  24.0  4.60  1613.27
7 55.48   5779  1687.00  43.3  5.62  1854.17
8 59.28   5969  1639.92  46.7  5.15  2160.55
9 94.39   8461  2872.33  78.7  6.18  2305.58
10 128.02 20106 3655.08  180.5 6.15  3503.93
11 96.00  13313 2912.00  60.9  5.88  3571.89
12 131.42 10771 3921.00  103.7 4.88  3741.40
13 127.21 15543 3865.67  126.8 5.50  4026.52
14 252.90 36194 7684.10  157.7 7.00  10343.81
15 409.20 34703 12446.33 169.4 10.78 11732.17
16 463.70 39204 14098.40 331.4 7.05  15414.94
17 510.22 86533 15524.00 371.6 6.35  18854.4
run;
proc print data=reg;
/* Consider relating y (HOURS) to x1 (XRAY), x2 (BEDDAYS), and x3
(LENGTH) by using the model
y = β0 + β1x1 + β2x2 + β3x3 + 
Plot y versus each of x1, x2, and x3. Do the plots indicate that the above
model might appropriately relate y to x1, x2, and x3? Explain your answer.
You may compute other statistics to support your answer.*/
proc reg data=reg plots;
model HOURS=XRAY BEDDAYS LENGTH/ partial;

/* The main objective of this regression analysis is to help the Navy evaluate
the performance of its hospitals in terms of how many labor hours are
used relative to how many labor hours are needed. The Navy selected
hospitals 1 through 17 from hospitals that it thought were efficiently run
and wishes to use a regression model based on efficiently run hospitals to
evaluate the efficiency of questionable hospitals. For hospital 14, note that
x1 = 36,194, x2 = 7684.10, and x3= 7.00. Using the SAS output, discuss
the case diagnostics for hospital 14. Discuss statistical evidence to show
that this case might not fit the above model very well.*/
proc reg data=reg;
model HOURS=36194 7684.10 7.00/ partial;

data company;
set practice.Companies;
proc print data=company;


data sale;
set stpsamp.stpsale;
proc print data=sale;
proc reg;
model amount=pop quantity;

data candy_data;
set practice.candy_data1;
proc print data=candy_data;
proc corr data = candy_data;
proc Logistic data=candy_data;	
class chocolate;
model bar (event='1') = chocolate fruity caramel peanutyalmondy crispedricewafer hard sugarpercent pricepercent winpercent;
estimate 'bar 1' chocolate 1 fruity 0 winpercent 66.971725 /exp;

data weight;
set sashelp.BWEIGHT;
proc print data= weight;
proc contents data=sashelp.BWEIGHT;

/* H0: There is  a difference in at least two of the groups */

proc anova data=Bweight1;
class MomEdLevel;
model visit=MomEdLevel;
/* we have fix the level of significance at 0.05 
  in this example the p-value is less than the level of significance
  so we reject the null hypothesis*/
 
/* So the next question is which groups are actually different */
/* Tukey Test*/


data salary1;
set practice.salary;
proc print data = salary1;

proc contents data=sashelp.BWEIGHT;
run;

proc anova data=sashelp.BWEIGHT;
class MomEdLevel;
Model Visit = MomEdLevel;
run;


proc anova data=sashelp.BWEIGHT;
class MomEdLevel;
Model Visit = MomEdLevel;
means  MomEdLevel/tukey;
run;