---
title: exercise.cls
layout: default
---

# exerciseClass LaTeX Class Documentation

## Overview
The `exerciseClass.cls` file is a custom LaTeX class designed for creating exercises with solutions in a clear and structured format. It allows you to create exercises, tasks, and subtasks with easy-to-manage numbering and references. Solutions can also be marked and formatted differently.

### Key Features:
- Exercise creation with automatic numbering
- Tasks and subtasks with flexible formatting
- Support for solutions, solution tables, and solution figures
- Customizable page layout
- Easy integration of graphics and math
- Built-in support for SI units
- Support for a professional header and footer with title and logo

## Getting Started

To use the `exerciseClass` LaTeX class, you need to include it at the beginning of your document. Here’s an example of how to start your LaTeX file:

    
    \documentclass{exerciseClass}
    \title{Exercise Title}
    \begin{document}
    \maketitle

    % Your content goes here

    \end{document}

## Class Options

### solution: 
Use this option to include solutions in your document. The solutions will be formatted in blue and appear under a heading labeled "Answer."

        \documentclass[solution]{exerciseClass}

## Sections

### Exercises
To create an exercise, use the ``` \ex{}``` command:

        \ex{First exercise description}

This command will automatically number the exercise (e.g., "Exercise 01", "Exercise 02", etc.).

### Subtasks
Tasks can also contain subtasks. Use the ``` \subtask{}``` command for this:

        \subtask{First subtask description}

Subtasks are numbered in the format Task.Subtask (e.g., "1.1", "1.2").

##  Solutions

### Solution Blocks
To include solutions for tasks or subtasks, use the ``` \subtask{}```  environment. This environment only appears in the document if the solution class option is enabled. Solutions are formatted in blue.

Example with solutions:
                
                \documentclass[solution]{exerciseClass}

                \begin{document}

                \ex{This is the exercise text.}

                \task{Write the definition of Ohm's Law.}

                \begin{solutionblock}
                Ohm's Law states that the current flowing through a conductor is directly proportional to the voltage across it, provided the temperature remains constant. 
                \end{solutionblock}

                \end{document}

Output:
        
        Exercise 01: This is the exercise text.

        Task 1: Write the definition of Ohm's Law.
        Answer:
        Ohm's Law states that the current flowing through a conductor is directly proportional to the voltage across it, provided the temperature remains constant.

### Solution Tables
For solutions requiring tables, use the solutiontable environment. Tables are numbered sequentially for each exercise (e.g., "Solution Table 1.1", "Solution Table 1.2").

Example:

        \begin{solutiontable}
        \centering
        \begin{tabular}{|c|c|c|}
        \hline
        Voltage (V) & Current (A) & Resistance ($\Omega$) \\ \hline
        5           & 1           & 5                     \\ \hline
        10          & 2           & 5                     \\ \hline
        \end{tabular}
        \caption{Ohm's Law values.}
        \end{solutiontable}

### Solution Figures
To add solution-specific figures, use the ``` solutionfigure```  environment. Figures are also numbered sequentially (e.g., "Solution Figure 1.1").

Example:

        \begin{solutionfigure}
        \centering
        \includegraphics[width=0.5\textwidth]{ohms_law_plot.png}
        \caption{Voltage vs. Current graph.}
        \end{solutionfigure}

### Automatic Numbering for Equations, Figures, and Tables

Equations, figures, and tables,tasks and subtaks are automatically numbered based on the exercise. For example, the first equation in "Exercise 01" is numbered as "(1.1)".

Example:

        \begin{equation}
        V = I \cdot R
        \end{equation}

Output:

        (1.1) V = I ⋅ R

### Graphics Support

The ``` \graphicspath ```is preconfigured to look for images in the ```fig```directory. To include an image:

Example:

        \includegraphics[width=0.5\textwidth]{example_image.png}


### Full Example Document
Here is a full example showcasing the class:

                \documentclass[solution]{exerciseClass}
                \title{Sample Exercise Document}

                \begin{document}
                \maketitle

                \ex{This is an exercise about Ohm's Law.}

                \task{State the formula for Ohm's Law.}
                \subtask{Write the equation for voltage.}
                \begin{solutionblock}
                The formula is \( V = I \cdot R \).
                \end{solutionblock}

                \subtask{Describe each variable in the equation.}
                \begin{solutionblock}
                \( V \): Voltage (in Volts) \\
                \( I \): Current (in Amperes) \\
                \( R \): Resistance (in Ohms)
                \end{solutionblock}

                \task{Provide a table of values for Ohm's Law.}
                \begin{solutiontable}
                \centering
                \begin{tabular}{|c|c|c|}
                \hline
                Voltage (V) & Current (A) & Resistance ($\Omega$) \\ \hline
                5           & 1           & 5                     \\ \hline
                10          & 2           & 5                     \\ \hline
                \end{tabular}
                \caption{Ohm's Law values.}
                \end{solutiontable}

                \end{document}


## ** Explanation of Class-Specific Commands and Packages**
Include brief descriptions of custom macros and commands defined in the class file.

| **Command/Package**                         | **Description**                                                                                             |
|--------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| `\NeedsTeXFormat{LaTeX2e}`                 | Specifies the LaTeX format version needed for the class file (LaTeX2e).                                      |
| `\ProvidesClass{exerciseClass}`            | Defines the name of the LaTeX class (`exerciseClass`).                                                       |
| `\LoadClass[a4paper, 12pt, notitlepage]`   | Loads the `article` class with specific options like A4 paper size and font size 12pt, and no title page.    |
| `\RequirePackage{<package>}`                | Includes various LaTeX packages, such as `geometry`, `amsmath`, `graphicx`, `siunitx`, etc. for functionality.|
| `\DeclareOption{solution}{\solutiontrue}`  | Declares an option to include solutions in the document when specified.                                       |
| `\ProcessOptions\relax`                    | Processes the options passed to the class file.                                                              |
| `\newcounter{exerciseCount}`               | Defines a new counter for exercises.                                                                         |
| `\newcommand{\ex}[1]{...}`                 | Defines the `\ex` command for creating exercises, auto-numbering them, and resetting certain counters.        |
| `\newcounter{taskCount}[exerciseCount]`    | Defines a new counter for tasks, linked to the exercise counter.                                             |
| `\newcommand{\task}[1]{...}`               | Defines the `\task` command for creating tasks, numbering them, and formatting them.                         |
| `\newcounter{subtaskCount}[taskCount]`     | Defines a new counter for subtasks, linked to the task counter.                                              |
| `\newcommand{\subtask}[1]{...}`            | Defines the `\subtask` command for creating subtasks, numbering them, and formatting them.                   |
| `\numberwithin{equation}{exerciseCount}`   | Ensures equations are numbered within the context of the exercise number.                                    |
| `\captionsetup[solutiontable]`             | Customizes captions for solution tables, including the label color and font.                                 |
| `\DeclareFloatingEnvironment`              | Creates a new floating environment (`solutiontable`, `solutionfigure`) with specific labeling.               |
| `\graphicspath{ {./fig/} }`                | Sets the directory for including images (fig/ folder).                                                        |
| `\geometry{left=1.5cm, right=1.5cm, ...}`   | Defines page layout options like margins and text height.                                                    |
| `\pagestyle{fancy}`                        | Uses the fancy header and footer style for page layout.                                                      |
| `\fancyhead[L]{...}`                       | Customizes the left side of the page header with the title and professor's name.                             |
| `\fancyfoot[C]{\thepage}`                  | Customizes the footer with page numbering.                                                                   |
| `\NewDocumentEnvironment{solutionblock}`   | Defines a custom environment for solution blocks, conditional on the `solution` option.                     |
| `\newcolumntype{C}[1]{...}`                | Defines new column types for tables, allowing centered (`C`), right-aligned (`R`), and left-aligned (`L`) columns. |
| `\ctikzset{...}`                           | Configures settings for Circuitikz diagrams (e.g., scale and thickness of components).                       |
| `\usetikzlibrary{...}`                     | Loads TikZ libraries for various diagramming and plotting features, such as shapes, positioning, and calculations.|
