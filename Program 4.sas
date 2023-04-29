/* Que_3 from First Internal */
DATA Scoredata;
input Grp $ Score @@;
datalines;
P 77 P 76 P 74 P 72 P 78
D 80 D 84 D 88 D 87 D 90
;
run;
proc print;
run;

data Practice.Scoredata;
set Scoredata;
if Score > 78;
run;
proc print data=practice.scoredata;
run;

/* Que_4 from First Internal*/
data Demographic;
input Gender $ Age Weight Height;
datalines;
M 50 68 155 
F 23 60 165 
M 65 72 180 
F 35 55 154 
M 15 35 158
;
run;
proc print;
run;
proc univariate data=demographic;
by Gender;
proc freq data=Demographic;
by Gender;
run;
proc means data=Demographic;
var Age Weight Height;
run;

data MYDATA.Demographic;
set Demographic;
run;

data biology;
input id sex $ age year weight HEIGHT;
datalines;
7389 M 24 4 69.2 132.5
3945 F 19 2 58.5 112.0
4721 F 20 2 65.3 98.6
1835 F 24 4 62.8 102.5
9541 M 21 3 72.5 152.3
2957 M 22 3 67.3 145.8
2158 F 21 2 59.8 104.5
4296 F 25 3 62.5 132.5
4824 M 23 4 74.5 184.4
5736 M 22 3 69.1 149.5
8765 F 19 1 67.3 1