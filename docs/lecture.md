---
title: lectureclass.cls
layout: default
---

# LectureClass LaTeX Class Documentation

The `lectureClass` is a custom LaTeX class designed for creating visually appealing and well-structured lecture slides using the `beamer` class. This document provides an overview of its features, customization options, and usage instructions.

---

## 1. Class Overview

### Base Class
- **Base Class**: The `lectureClass` inherits from the `beamer` class.
- **Default Options**:
  - `aspectratio=169`
  - `usepdftitle=false`
  - `handout`

---

## 2. Class Options

### Marketing Mode
The class includes a marketing option for targeting external audiences.

- **Option**: `marketing`
- **Purpose**: Includes or excludes logos and content based on the audience.
- **Implementation**:
  ```latex
  \DeclareOption{marketing}{\marketingtrue}
  \ProcessOptions\relax
  ```

---

## 3. Document Style Settings

### Themes and Colors
- **Beamer Theme**: `Madrid`
- **Color Theme**: `dove`
- **Font Theme**: `professionalfonts`

### Table of Contents Automation
- A table of contents is automatically displayed at the beginning of each section and subsection (after the first subsection).
  ```latex
  \AtBeginSection[]
  {
    \begin{frame}{Table of contents}
      \tableofcontents[sectionstyle=show/hide,subsectionstyle=show/show/hide]
    \end{frame}
  }

  \AtBeginSubsection[]
  {
    \ifnum\value{subsection} > 1
      \begin{frame}{Table of contents}
        \tableofcontents[sectionstyle=show/hide,subsectionstyle=show/shaded/hide]
      \end{frame}
    \fi
  }
  ```

### Customization of Itemization
- **Itemize**: `triangle` icons
- **Enumerate**: Custom vertical spacing before and after
  ```latex
  \setbeamertemplate{itemize items}[triangle]
  \setbeamercolor{item}{fg = uniblue}
  \setbeamertemplate{itemize/enumerate body begin}{\vspace{0.5em}}
  \setbeamertemplate{itemize/enumerate body end}{\vspace{0.5em}}
  ```

---

## 4. Logo and Author Information

### Dynamic Logos
Logos are adjusted based on the `marketing` option.
- **With Marketing**:
  ```latex
  \titlegraphic{\href{https://www.eti.uni-siegen.de/ias/}{\includegraphics[height=1cm]{IAS.pdf}}}
  ```
- **Without Marketing**:
  ```latex
  \titlegraphic{\href{https://www.eti.uni-siegen.de/ias/}{\includegraphics[height=1cm]{IAS.pdf}}\hspace{2cm}\href{https://creativecommons.org/licenses/by/4.0/}{\includegraphics[height=1cm]{CC-BY.pdf}}}
  ```

---

## 5. Package Dependencies
The class requires the following LaTeX packages:
- `algorithm2e`
- `amsmath`, `amsfonts`
- `array`, `booktabs`, `caption`
- `circuitikz`
- `glossaries-extra`
- `hyperref`, `hyperxmp`
- `inputenc`
- `pgfplots`
- `tikz`, `tikzpeople`

### Conditional Packages
- With `marketing`: Glossaries are loaded without `automake`.
  ```latex
  \RequirePackage[toc = false]{glossaries-extra}
  ```
- Without `marketing`: Glossaries are loaded with `automake`.
  ```latex
  \RequirePackage[automake, toc = false]{glossaries-extra}
  ```

---

## 6. Visual Customizations

### Colors
The class defines several custom colors:
- **Primary Colors**:
  ```latex
  \definecolor{uniblue}{HTML}{00385F}
  \definecolor{unilightblue}{HTML}{009ED4}
  \definecolor{unigrey}{HTML}{64727f}
  \definecolor{links}{HTML}{2A1B81}
  ```

- **Signal Colors**:
  ```latex
  \definecolor{signalred}{rgb}{0.9047, 0.1918, 0.1988}
  \definecolor{signalblue}{rgb}{0.2941, 0.5447, 0.7494}
  ```

### Footer Design
Custom footer layout:
```latex
\setbeamertemplate{footline}
  \leavevmode%
  \hbox{
  \vskip0pt%
}
```

---

## 7. SI Unit Setup
The class configures `siunitx`:
- **Fraction Style**:
  ```latex
  \sisetup{
    per-mode=fraction,
    fraction-function=\tfrac,
    input-digits = 0123456789\pi,
    exponent-product=\ensuremath{\cdot},
    inter-unit-product = {}
  }
  ```

---

## 8. Hyperref Settings
The class predefines metadata and hyperlink settings:
```latex
\hypersetup{
  colorlinks,
  linkcolor=,
  urlcolor=links,
  pdfcopyright={Creative Commons BY 4.0},
  pdflicenseurl={https://creativecommons.org/licenses/by/4.0/},
  pdfauthor={Oliver Wallscheid},
  pdfcontacturl={https://www.eti.uni-siegen.de/ias/},
  pdftitle={Lecture slides}
}
```

---

## 9. Blocks and Theorems

### Custom Blocks
The class defines blocks with centered content and adjustable width:
```latex
\newenvironment<>{varblock}[2][.9\textwidth]{ ... }
```
### Example with Custom Blocks:
Show how to use specific environments like `varblock` or `algo`.

```latex
\begin{frame}
  \frametitle{Custom Block Example}
  \begin{varblock}{Example Block Title}
    This is a custom block defined using `tcolorbox`.
  \end{varblock}
\end{frame}

\begin{frame}
  \frametitle{Algorithm Example}
  \begin{algo}
    Input: $x$, Output: $y$  \\
    Step 1: Do something. \\
    Step 2: Do something else.
  \end{algo}
\end{frame}
```

### Theorems
The class integrates `tcolorbox` for definitions and theorems:
```latex
\newtcbtheorem[number within=part, reset counter on overlays=true]{defi}{Definition}{ ... }{defi}
```

---

## 10. TikZ and Circuitikz
The class enables advanced visualizations using TikZ and Circuitikz:
- **Included Libraries**: `arrows`, `shapes`, `calc`, `pgfplots`
- **Custom Settings**:
  ```latex
  \ctikzset{bipoles/cuteswitch/thickness=0.15}
  ```

---

## 11. Additional Commands

### Highlighting
```latex
\newcommand{\hl}[1]{\textcolor{signalred}{#1}}
\newcommand{\hlh}[1]{\textbf{#1}}
```

### Footnotes Without Numbering
```latex
\newcommand\blfootnote[1]{ ... }
```

---

## 12. Custom Table Columns
The class includes centered column types for tables:
```latex
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
```

---



## ** Practical Examples**
### Minimal Working Example (MWE):
Provide users with a simple starting point to understand how to use the class.

```latex
\documentclass[marketing]{lectureClass}
\title{Sample Lecture}
\author{John Doe}
\date{\today}

\begin{document}
\begin{frame}
  \titlepage
\end{frame}

\section{Introduction}
\begin{frame}
  \frametitle{Welcome}
  Hello, World!
\end{frame}
\end{document}
```


## ** Explanation of Class-Specific Commands**
Include brief descriptions of custom macros and commands defined in the class file.

| Command         | Description                                            |
|-----------------|--------------------------------------------------------|
| `\blfootnote{}` | Inserts an unnumbered footnote.                        |
| `\hl{text}`     | Highlights `text` in red.                              |
| `\cmark`        | Inserts a checkmark symbol.                            |
| `\xmark`        | Inserts a crossmark symbol.                            |
| `\task{}`       | Creates a numbered task with conditional spacing.      |
| `\subtask{}`    | Creates a numbered subtask (e.g., 1.1, 1.2).           |




## ** Option-Specific Differences**
Explain the purpose of the `marketing` option and how it changes the output.

| Option       | Description                                  |
|--------------|----------------------------------------------|
| `marketing`  | Adds marketing slides or modifies slide design. |
| *(default)*  | Standard academic lecture-style slides.      |

### Comparison of `marketing` Option:
- **Without `marketing`**:
  - Standard Beamer layout.
  - Academic-focused color scheme.
- **With `marketing`**:
  - Sleek design with larger headings.
  - Adjusted color scheme for presentations.


For more details, refer to the source code of the `lectureClass` file.

