data first;
input Subject Gender $ Age;
datalines;
1000 M 42
1001 M 20
1002 F 53
1003 F 40
1004 M 29
1005 F 29
run;
proc print data= first;

data second;
input Subject Disease $ test $;
datalines;
1000 Y Y
1001 N Y
1002 Y Y
1004 N N
run;
proc print data=second;

data new;
merge first second;      * Merge command is used to merge to datasets, by column variable; 
by Subject;
*label 'Subject' = 'Subject1';
*title New;
proc print data=new;
* If the categorical values are missing in the data then it shown by blank space;
data new1;
set first second;
proc print data =new1;

data third;
input Subject Gender $ Age Date mmddyy8.;
format Date mmddyy8.;
datalines;
1000 M 42 03/10/96
1001 M 20 02/19/96
1002 F 53 02/01/96
1003 F 40 12/30/95
1004 M 29 01/10/97
run;
proc print data= third;

data fourth;
input Subject Disease $ test $ VarDate mmddyy8.;
format VarDate mmddyy8.;
datalines;
1000 Y Y 12/17/96 
1001 N Y 03/01/96
1002 N N 02/18/96
1004 Y Y 04/15/96
1005 N N 02/01/97
run;
proc print data=fourth;

data new;
merge third fourth;
by Subject;
title 'Merge datasets';
proc print data=new;

data first;
set Practice.SR;
proc print data=first;

data first;
input id score1 score2;
datalines;
21  50.2 17 47.5 54 32.2 
12. 54.3
23. 
45.6
run;
proc print data=first;
