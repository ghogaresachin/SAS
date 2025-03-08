SAS Data Analysis Repository 📊

A collection of SAS programs demonstrating data manipulation, statistical analysis, and reporting techniques. Ideal for learning foundational SAS concepts and advanced methodologies.

🛠 SAS | 📜 License: MIT

📖 Table of Contents

Overview

Key Features

Repository Structure

Getting Started

Highlighted Analyses

Contributing

License

Contact

Overview

This repository contains 16 SAS files covering:

Dataset creation and manipulation

Descriptive statistics (PROC MEANS, PROC UNIVARIATE)

Hypothesis testing (PROC FREQ, PROC TTEST)

Regression modeling (PROC REG)

Data visualization (SGPLOT, PROC PLOT)

Advanced techniques (ANOVA, randomization, boxplots)

Key Features

Category

Examples

Data Manipulation

MERGE, KEEP/DROP, DO loops, formatted input

Statistical Analysis

Frequency tables, regression, hypothesis testing

Visualization

Boxplots, scatter plots, histograms

Advanced Methods

Permuted block randomization, model diagnostics

Repository Structure

1. Basic Operations

Files 1-2: Dataset creation with INPUT/DATALINES, PROC PRINT, PROC MEANS

data second;
input x y;
datalines;
1 2.3
2 3.4
;
run;
proc print data=second;
run;

2. Statistical Analysis

Files 9-10: Frequency analysis and univariate tests

proc freq data=disease;
tables Severity*Herd_size / chisq;
run;

3. Advanced Techniques

File 12: Adaptive randomization

data clinical;
do i = 1 to 30;
  x = rand('bernoulli', 0.5);
  if x = 1 then y = 'T';
  else y = 'R';
  output;
end;
run;

Getting Started

Prerequisites

SAS 9.4+

Access to SASHELP libraries

Recommended Workflow

# Start with basic operations (Files 1-5)
# → Explore statistical methods (Files 6-10)
# → Master advanced techniques (Files 11-16)

Dataset Sources

Built-in datasets (sashelp.baseball, sashelp.air)

Custom clinical/biological data

Hald cement dataset (File 13)

Highlighted Analyses

File

Analysis

Code Snippet

6

Conditional logic

IF Age >= 30 THEN Group = 'Senior';

8

Loop implementations

DO i = 1 to 10 BY 2; x = i**2; OUTPUT; END;

11

Insulin study visualization

proc sgplot; vbox Week_0; run;

14

Regression diagnostics

proc reg; model y = x / influence; run;

Contributing

Fork the repository

Create a feature branch:

git checkout -b new-feature

Commit your changes:

git commit -m "Add new feature"

Push to the branch:

git push origin new-feature

Open a Pull Request

License

Distributed under the MIT License. See LICENSE for details.

Contact

📧 Your Name - your.email@example.com🔗 Project Link: github.com/yourusername/repo-name

Last Updated: October 2023

Save this content as README.md in your repository root, and GitHub will render it properly! 🚀

Let me know if you’d like me to tweak anything else! ✨