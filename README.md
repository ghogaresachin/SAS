# SAS Data Analysis Repository 📊

## Project Overview

A collection of SAS programs demonstrating data manipulation, statistical analysis, and reporting techniques. Ideal for learning foundational SAS concepts and advanced methodologies.

---

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Repository Structure](#repository-structure)
- [Getting Started](#getting-started)
- [Highlighted Analyses](#highlighted-analyses)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## Overview

This repository contains 16 SAS files covering:

- **Dataset creation and manipulation**
- **Descriptive statistics** (`PROC MEANS`, `PROC UNIVARIATE`)
- **Hypothesis testing** (`PROC FREQ`, `PROC TTEST`)
- **Regression modeling** (`PROC REG`)
- **Data visualization** (`PROC SGPLOT`, `PROC PLOT`)
- **Advanced techniques** (ANOVA, randomization, boxplots)

---

## Key Features

| **Category**              | **Examples**                                           |
|---------------------------|-------------------------------------------------------|
| Data Manipulation         | `MERGE`, `KEEP/DROP`, `DO` loops, formatted input      |
| Statistical Analysis      | Frequency tables, regression, hypothesis testing      |
| Visualization             | Boxplots, scatter plots, histograms                   |
| Advanced Methods          | Permuted block randomization, model diagnostics       |

---

## Repository Structure

### 1. Basic Operations

**Files 1-2:** Dataset creation with `INPUT/DATALINES`, `PROC PRINT`, `PROC MEANS`

```sas
data second;
input x y;
datalines;
1 2.3
2 3.4
;
run;

proc print data=second;
run;
```

### 2. Statistical Analysis

**Files 9-10:** Frequency analysis and univariate tests

```sas
proc freq data=disease;
tables Severity * Herd_size / chisq;
run;
```

### 3. Advanced Techniques

**File 12:** Adaptive randomization

```sas
data clinical;
do i = 1 to 30;
  x = rand('bernoulli', 0.5);
  if x = '1' then y = 'T';
  else y = 'R';
  output;
end;
run;
```

---

## Getting Started

### Prerequisites

- **SAS 9.4+**
- Access to SASHELP libraries

### Recommended Workflow

1. Start with basic operations (**Files 1-5**)
2. Explore statistical methods (**Files 6-10**)
3. Master advanced techniques (**Files 11-16**)

### Dataset Sources

- Built-in datasets (`sashelp.baseball`, `sashelp.air`)
- Custom clinical/biological data
- Hald cement dataset (**File 13**)

---

## Highlighted Analyses

| **File** | **Analysis**                         | **Code Snippet**                                |
|----------|--------------------------------------|------------------------------------------------|
| 6        | Conditional logic                   | `IF Age >= 30 THEN Group = 'Senior';`           |
| 8        | Loop implementations                | `DO i = 1 to 10 BY 2; x = i**2; OUTPUT; END;`   |
| 11       | Insulin study visualization         | `proc sgplot; vbox Week_0;`                     |
| 14       | Regression diagnostics              | `proc reg; model y = x / influence;`            |

---

## Contributing

1. Fork the repository
2. Create a feature branch:

```bash
git checkout -b new-feature
```

3. Commit your changes
4. Push to the branch
5. Open a Pull Request

---

## License

Distributed under the MIT License. See `LICENSE` for details.

---

## Contact

📧 **Your Name** - your.email@example.com  
🔗 **Project Link**: [github.com/yourusername/repo-name](#)

_Last Updated: October 2023_

---

Let me know if you want me to tweak anything else! 🚀

