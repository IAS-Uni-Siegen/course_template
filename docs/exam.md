---
title: examclass.cls
layout: default
---


# Documentation for examClass.cls

## Overview
The `examClass` is a custom LaTeX class designed for creating exams in a structured and versatile way. It supports both English and German content and can include solutions based on the provided options.It builds upon the `article class`, adding functionality tailored to exam formatting, including tasks, subtasks, solutions, and points tracking.

## Features

1. Customizable Exam Layout:

    - Predefined margins and spacing for clean formatting.
    - Automatically generated headers and footers.
    - Built-in support for multilingual exams (e.g., English and German).

2. Tasks and Subtasks:

    - Easy-to-use commands for creating tasks and subtasks.
    - Automatic numbering for tasks and subtasks.
    - Points assignment and summation for each task and the entire exam.

3. Solution Blocks:

    - Dedicated environments for solution blocks, which are shown only when the solution option is enabled.

4. Floating Figures and Tables:

    - Support for labeled and captioned solution-specific figures and tables.

5. Integration with hyperref:

    - Cross-referencing for tasks, subtasks, tables, and figures with automatic formatting.

6. SI Units:

    - Built-in configuration for typesetting SI units and equations cleanly.

## Class Options
- `solution `: Enables solution blocks for the exam.
- `german `: Configures the document for German language (e.g., task labels as "Aufgabe").

    ``` \documentclass[solution,german]{examClass} ```

## Header and Footer

The document header includes:
Exam title`(\@title)` and professor's name on the left.
A logo image `(set via fig/IAS.pdf)` on the right.
The footer includes the page number.

# Key Commands

##  Defining Exercises
     \ex{Exercise Title} 

##  Creating Tasks
    \task{Task Description}

##  Adding Subtasks
- Creates a subtask within the current task.
- Example:
            ``` \subtask{Calculate the current through resistor R1.} ```

##  Solution Blocks

    \begin{solutionblock}
    Solution content here.
    \end{solutionblock}

- Displayed only when the solution option is enabled.
- Example   
        ```   \begin{solutionblock}
            The current is \SI{2}{\ampere}.
            \end{solutionblock} ```

##  Multilingual Support
### German Tasks
    \taskGerman{Aufgabe Beschreibung}
    \subtaskGerman{Aufgabe Unterpunkt}

Create a german task and subtask when the german option is enabled 

##  Floating Environments
`examClass` allows figures and tables related to solutions to be included as floating environments. These elements are treated separately and will only be displayed when the solution option is enabled.
### Solution Figures
        \begin{solutionfigure}
        \centering
        \includegraphics{example.png}
        \caption{Example Figure}
        \end{solutionfigure}

### Solution Tables
        \begin{solutiontable}
        \centering
        \begin{tabular}{l l}
        Key & Value \\
        \end{tabular}
        \caption{Example Table}
        \end{solutiontable}

### SI Units
    \SI{3.5}{\kilo\ohm}

Configure SI units with proper spacing using the siunitx package.

##  Customization
1. Graphics Path: Update the ```\graphicspath``` to include a folder for your images.
2. Title and Metadata:
- Set the title using ```\title{Exam Title} ```.
- Add metadata such as course name and semester.


##  Example Usage
            \documentclass[solution]{examClass}
            \title{Power Electronics Midterm Exam}

            \begin{document}
            \ex{Basic Circuit Analysis}
            \task{Solve the circuit.}
            \subtask{Find the resistance.}{5}
            \subtask{Calculate the voltage.}{10}

            \begin{solutionblock}
            The solution involves Ohm's law.
            \end{solutionblock}

            \tp{15}{0}{0}{0}
            \end{document}

## Customization of Graphics Path and Metadata
You can customize the graphics path for including figures and images, as well as adjust metadata for the exam such as title, course name, and semester.

### Key Customization Example
        \documentclass[solution]{examClass}
        \title{Power Electronics Midterm Exam}
        \author{Prof. John Doe}
        \date{Fall 2024}

        \graphicspath{{fig}} % Path to figures

        \begin{document}
        \ex{Circuit Design Problems}

        \task{Design the circuit based on the given parameters.}
        \subtask{Draw the circuit diagram.}

        \end{document}


## Summary of `examClass.cls` Commands and Packages

### LaTeX Commands

| Command                 | Description                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------|
| `\ex{}`                 | Defines an exercise. Automatically increments exercise count and sets formatting.              |
| `\task{}`               | Defines a task within an exercise. Increments task count and shows task points.                |
| `\subtask{}`            | Defines a subtask within a task. Shows subtask number, description, and points.                |
| `\taskGerman{}`         | Defines a task in German if the `german` option is set.                                        |
| `\subtaskGerman{}`      | Defines a subtask in German if the `german` option is set.                                     |
| `\tp{}`                 | Sums up the points of all tasks and displays the total points for the exercise.               |
| `\taskCount`            | Counter for tasks, resets per exercise.                                                       |
| `\subtaskCount`         | Counter for subtasks, resets per task.                                                        |
| `\total{}`              | Displays the total points of the task (or subtask).                                           |
| `\titleformat*{\section}` | Modifies section format for task headings.                                                  |

### LaTeX Environments

| Environment             | Description                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------|
| `hintblock`             | Custom environment for hint text with underlined label "Hint:".                               |
| `germanhintblock`       | Custom environment for hint text in German, shown if the `german` option is enabled.         |
| `solutionblock`         | Custom environment for solution text, shown if the `solution` option is enabled.             |
| `germanblock`           | Custom environment for general text in German, shown if the `german` option is enabled.       |
| `solutiontable`         | Custom floating table environment for solutions, styled with a blue label.                    |
| `solutionfigure`        | Custom floating figure environment for solutions, styled with a blue label.                   |

### LaTeX Counters

| Counter                 | Description                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------|
| `exerciseCount`         | Counter for exercises.                                                                         |
| `taskCount`             | Counter for tasks, resets per exercise.                                                       |
| `subtaskCount`          | Counter for subtasks, resets per task.                                                        |
| `totalTaskPoints`       | Counter for total points of all tasks in an exercise.                                         |
| `taskPointsA`, `taskPointsB`, `taskPointsC`, `taskPointsD` | Counters for individual task points.                                                         |

### LaTeX Packages

| Package                 | Description                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------|
| `geometry`              | Adjusts page layout settings (margins, page size, etc.).                                       |
| `tabularx`              | Enhances the tabular environment to control table widths dynamically.                         |
| `caption`               | Customizes captions for tables and figures.                                                   |
| `siunitx`               | Provides support for formatting SI units and numbers.                                          |
| `url`                   | Handles URLs and related commands.                                                            |
| `inputenc`              | Allows input encoding, set to UTF-8 here.                                                     |
| `babel`                 | Language and hyphenation support. Set to English in this case.                                |
| `csquotes`              | Provides advanced quoting functionality.                                                      |
| `fontenc`               | Sets font encoding to T1 for proper character representation.                                 |
| `graphicx`              | Allows inclusion of images and other graphical content.                                       |
| `lmodern`               | Loads the Latin Modern font family.                                                           |
| `setspace`              | Adjusts line spacing. Set to one and a half line spacing in this case.                         |
| `wrapfig`               | Allows wrapping text around figures.                                                          |
| `hyperref`              | Adds hyperlinking capabilities, with hidden links (using `hidelinks` option).                |
| `amsmath`               | Provides advanced math formatting capabilities.                                                |
| `booktabs`              | Adds support for professional-quality tables.                                                 |
| `epsfig`                | Provides support for including EPS (Encapsulated PostScript) images.                          |
| `upgreek`               | Allows the use of upright Greek letters.                                                       |
| `subcaption`            | Provides subfigure and subtable environments.                                                 |
| `titlesec`              | Customizes section and heading formatting.                                                    |
| `bm`                    | Provides bold mathematical symbols.                                                           |
| `tikz`                  | Allows creation of high-quality graphics and diagrams.                                        |
| `pgfplots`              | Enables creation of 2D and 3D plots.                                                          |
| `standalone`            | Enables creation of standalone graphics or figures.                                           |
| `circuitikz`            | Enables drawing of electrical circuits.                                                       |
| `multirow`              | Allows multi-row cells in tables.                                                             |
| `newfloat`              | Supports new types of floating objects (like custom environments).                             |
| `totcount`              | Provides support for counting objects (tables, figures, etc.) throughout the document.         |
| `nicefrac`              | Provides a simple way to typeset fractions.                                                   |
| `fancyhdr`              | Customizes page headers and footers.                                                          |

### TikZ and PGFPlots Settings

| Setting/Library         | Description                                                                                   |
|-------------------------|-----------------------------------------------------------------------------------------------|
| `\pgfplotsset{compat=1.18}` | Sets the PGFPlots version to ensure compatibility with specific features.                      |
| `\usetikzlibrary{...}`   | Loads specific TikZ libraries for drawing shapes, arrows, and other elements.                  |
| `\usepgfplotslibrary{groupplots}` | Loads PGFPlots library for creating group plots.                                            |
