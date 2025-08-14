
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


## Customization

- Default theme is `unisiegen-IAS`
- General color palette and pdfdata options are defined in `.sty` files in `theme/` which can be modified as necessary 
- In `theme` folder, you can create your own theme as `yourtheme.sty` and load it updating class option in `main.tex`:

    ```latex
    \documentclass[solution, yourtheme]{../course_template/exerciseClass}
    ```
- For the repository to work out-of-the-box with custom theme, it must have `defaultcolor` and `defaultlightcolor` defined in your custom theme file
- As additional examples, `unisiegen` and `unipaderborn` themes are provided
- For advanced customization, files in `style` folder can be modified


## Notes

### Expected Warnings and Workaround:

- Depending on how you include the `.cls` files in your project, it is possible that latex might generate following warning:

    ```bash
    LaTeX: You have requested document class '../course_template/exerciseClass', but the document class provides 'exerciseClass'.
    ```
- Although, this warning does not affect document generation and can be ignored here, it can be resolved by updating [TEXINPUTS](https://tex.stackexchange.com/questions/93712/definition-of-the-texinputs-variable) environment variable. If you are using [VSCode](https://code.visualstudio.com/) with [LaTeX-Workshop](https://github.com/James-Yu/LaTeX-Workshop) extension, procedure to update environment variable is available at [LaTeX-Workshop wiki](https://github.com/James-Yu/latex-workshop/wiki/Install).

### Color Vision Deficiency (CVD) Accessibile Color Palette

- All example themes contain a six-color palette designed to provide improved readability and accessibility for generated documents
- This color palette is taken from ["Communicating Effectively in Color" by J. W. Kimball in IEEE Power Electronics Magazine](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=10839151&isnumber=10839145).

