data Insulin;
input Week0 Week1 Week2 Week3;
datalines;
31.2 18.4 55.2 69.2
72.0 37.2 70.4 52.0
31.2 24.0 40.0 42.8 
28.2 20.0 42.8 40.6 
26.4 20.6 26.8 31.6
40.2 32.2 80.4 66.8
27.2 23.0 60.4 62.0
33.4 22.2 65.6 59.2
17.6 07.8 15.8 22.4
run;
proc print data=Insulin;
proc sgplot data=insulin;
hbox Week0;
hbox Week1;
hbox Week2;
hbox Week3;
*proc boxplot data=insulin;

* Simple Linear Regression;
data first;
input x y;
datalines;
5  7
10 8.2
8  8.3 
11 10
3  7.2
1  4.3 
6  8.8
4  5.8
2  5.7
9  10.1
run;
proc print data=first;
proc reg data=first;
model y=x;
proc reg data=first;
model y=x/ p r influence;
proc plot data=first;
plot y*x;




