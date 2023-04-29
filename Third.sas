data third;
input x y z$;
datalines;
1 2.3 Male
2 3.4 Female
3 4.5 Male
4 6.6 Female
5 8.9 Male
run;
proc print data=third (OBS=1);
proc means data=third;

/* To create SAS data set using existing SAS data set*/
data baseball;
SET sashelp.baseball;
proc print data=baseball;
TITLE 'Baseball dataset';   /* TITLE command is used to mention appropriate Title for a dataset*/
VAR nHits; /* Indexing of a specific column*/
SUM nHits; /* to get sum of column nAtBat*/
proc means data=baseball;
run;
/* Here we are using PROC SORT command  to created a sorted dataset in
ascending order to 'team' variable in baseball_2*/
PROC SORT data=baseball out=baseball_2;
by team;
PROC print data=baseball_2;

VAR nHits;
SUM nHits;
by team;
run;
/* Proc contents command provided information for dataset*/
PROC contents data=baseball;
run;
/* Use of PROC frequency*/
/* To check no. of frequency*/
proc freq data=baseball;
tables team*Position;
run;