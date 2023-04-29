/* Use of condtional execution */
/* Syntax: If 'expression' then 'statement';  */
/* eg. 1) If score<80 then weight=0.67;
  eg. 2) If score<80 then weight=0.67;
         else weight=0.75; */
                    
                    
                    
                    
data first;
input Age @@;
datalines;
1 3 7 9 12 17 21 23 26 29 30 42 45 51
run;
proc print data=first;  

data second;
SET first;
if 0<= Age <=10 then Age_2=0;      * Else;
else Age_2=1;
if 0<= Age <10 then Age_3=0;       * Else if; 
else if 10<= Age <20 then Age_3=1;
else if 20<= Age <30 then Age_3=2;
else if Age>=30 then Age_3=3;
proc print data=second;


data CLASS;
SET sashelp.CLASS;
*if Age>14 and weight<115;
*if Age=.;                          *To check the missing values from the data;
*keep Age Height;
proc print data=CLASS;
var Age Height;
proc print data CLASS;


data shoes;
SET sashelp.shoes;
commision=(sales-returns)*0.10;
format commision (coma6.);
keep Region subsidiary sales returns commision;    * To select particular variables of a data;
/* or*/  * Where Region subsidiary sales returns commision;
if Region="Canada" and product="Slipper";          * Selection of a particular variable;   
proc print data=shoes;

/*Another Method*/
data shoes;
SET sashelp.SHOES;
if region="Canada" and product="Slipper"
then commision=(sales-returns)*0.10;
else Delete;
keep Region Subsidiary sales returns commision;
proc print data=shoes;
