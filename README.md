
# Course Template

[![CC BY 4.0][cc-by-shield]][cc-by]
[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/)

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://licensebuttons.net/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

###

This repository provides LaTeX classes for creating structured academic documents, including lectures, exercises, and exams. The template is designed to standardize and simplify document creation for courses, with built-in formatting and styling.

## LaTeX Classes Overview
### Lecture Class (`lectureClass.cls`)
Provides a clean and professional layout for lecture notes, with support for:
- Author information
- Titles
- Footnotes
- A consistent structure for academic content

### Exercise Class (`exerciseClass.cls`)
Designed for exercise sheets, this class enables easy structuring of:
- Problems
- Solutions
- Formatting features such as sectioning and problem numbering

### Exam Class (`examClass.cls`)
This class assists in the formatting of exams by providing:
- Automatic question numbering
- Consistent spacing
- Header formatting for exam information

## Usage

- Clone the repository:

    ```bash
    git clone https://github.com/IAS-Uni-Siegen/course_template.git
    ```

- Use the LaTeX `.cls` files in your documents:

    ```latex
    \documentclass{lectureClass}  % or exerciseClass, examClass
    ```

- Compile your `.tex` files as usual with `pdflatex`, `xelatex`, or your preferred LaTeX compiler.



## Adding Course Template as a Submodule

To integrate this repository into your existing project as a submodule, follow these steps:

-  Navigate to your project directory in the terminal.
-  Add the course template repository as a submodule:

    ```bash
    git submodule add https://github.com/IAS-Uni-Siegen/course_template.git
    ``` 
- Initialize and update the submodule to ensure it is ready for use:
    ```bash
    git submodule init
    git submodule update
    ```



This allows you to use the LaTeX classes provided in the course template repository directly within your project.
