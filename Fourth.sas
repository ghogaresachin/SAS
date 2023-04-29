data baseball;
SET sashelp.baseball;
proc print data=baseball;
proc univariate data=baseball normal;
var nRuns;
proc univariate data=baseball plot;
var nRuns;
run; 
proc univariate data=baseball plots normal;
var nRuns;
proc univariate data=baseball cibasic mu0=100;
var nHits;
output out=stats pctlpts=33.3 66.7;
proc print data=baseball;

