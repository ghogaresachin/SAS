data third;
input x y z$;
datalines;
1 2.3 Male
2 3.4 Female
3 4.5 Male
4 6.6 Female
5 8.9 Male
run;
proc print data=third;
proc means data=third;


data baseball;
SET sashelp.baseball;
proc print data=baseball;
proc means data=baseball;
* This is my first program;
/* This is my first program*/

data air;
SET sashelp.air;
proc print data=air;
proc means data=air;
