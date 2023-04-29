/* Use of formated input*/
data first;
*input @2 A @8 B;    * By using this command we can store the values in different columns;
input A 1-2  B 3-9;
*input @2 B 5.2;         * The values is going store in variable 1 started from the 2nd position and after that it will going to take vlues upto 5 and the 2 values after 5 is going to be in the float;    
datalines;
790723985
398470937
956927952
395030729
run; 
proc print data=first;


data second;
input ID$ 1-2 Subject$ 3-7 Marks 8-9;
datalines;
01ST10142
02ST10226
03ST10341
04ST10428
05ST10551
06ST10618
run;
proc print data=second;
/* Another Method*/
data second;
input @1 ID$ 2. Subject$ 3-7 @8 Marks 10.2;
datalines;
01ST1014210
02ST1022620
03ST1034135
04ST1042875
05ST1055180
06ST1061814
run;
proc print data=second;

data third;
input A @@;
datalines;
1 4 6 8 10 12 5 6 2
run;
proc print data=third;

data fourth;
input ID $ Marks $ @@;
datalines;
A 16 B 12 C 16 D 12 
E 08 F 09
run;
proc print data=fourth;

data fifth;
input Name $ Math_score Science_score @@;
Total=Math_score+Science_score;
datalines;
A 65 58 B 28 65 C 32 55 D 72 81
run;
proc print data=fifth;

data sixth;
input Group $ Score;
datalines;
P 77
P 76
P 74
P 72
P 78
D 80
D 84
D 88
D 87
D 90
run;
proc print data=sixth;

* Use of do loops;
data seventh;
do i=1 to 20;
x=i**2;
output;
end;
proc print data=seventh;

data eighth;
do i=1 to 10;
x=i+1;
output;
end;
proc print data=eighth;

data eighth;
do i=1 to 10;
x=i**2;
output;
end;
proc print data=eighth;

data eighth;
do i=1 to 10 by 2;
x=i**2;
output;
end;
proc print data=eighth;

data eighth (drop=i);
do i=1 to 10 by 2;
x=i**2;
output;
end;
proc print data=eighth;

data eighth (drop=i);
do i=10 to 1 by -2;
x=i**2;
output;
end;
proc print data=eighth;




