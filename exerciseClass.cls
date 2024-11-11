\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exerciseClass}[IAS exercise LaTeX class]
\LoadClass[a4paper, 12pt, notitlepage, oneside]{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class options %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifsolution
\DeclareOption{solution}{\solutiontrue}
\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Packages %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}
\RequirePackage{tabularx}
\RequirePackage{caption}
\RequirePackage{siunitx}
\RequirePackage{titling}
\RequirePackage[obeyspaces, spaces]{url}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage[babel]{csquotes}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{lmodern}
\RequirePackage[onehalfspacing]{setspace}
\RequirePackage{wrapfig}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{amsmath}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{import}
\RequirePackage{epsfig}
\RequirePackage{upgreek}
\RequirePackage{subcaption}
\RequirePackage{titlesec}
\RequirePackage{siunitx}
\RequirePackage{bm}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{standalone}
\RequirePackage{circuitikz}[european, smartlabels, americaninductor]
\RequirePackage{multirow}
\RequirePackage{newfloat}
\RequirePackage{mathtools}
\RequirePackage{placeins}
\usetikzlibrary{calc,math}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Graphic path %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{ {./fig/} }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%$ Setup page geometry %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{left=1.5cm, right=1.5cm, top=1.5cm, bottom=1.5cm}
\setlength{\parindent}{0em}
\setlength{\parskip}{0pt}
\setlength{\headheight}{15mm}
\setlength{\headsep}{8mm}
\setlength{\textheight}{250mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Header and footer %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

\fancyhead[L]{
    \textbf{\large{\@title}}\\
    Prof. Dr.-Ing. Oliver Wallscheid
}

\fancyhead[R]{
    \includegraphics[width=\textwidth,height=10mm, keepaspectratio]{../course_template/IAS.pdf}
}

\fancyfoot[C]{\thepage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Solution block %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentEnvironment{solutionblock}{+b}
{
    \ifsolution
    \color{blue}
    %\par
    \setlength{\parskip}{0pt}
    \noindent \ignorespaces 
    \underline{Answer:}\\
    #1
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Solution table %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareFloatingEnvironment[autorefname=Sol.-Tab.]{solutiontable}
\captionsetup[solutiontable]{name=Solution Table, labelfont={color=blue},textfont={color=blue}}
\renewcommand{\thesolutiontable}{\arabic{exerciseCount}.\arabic{solutiontable}}

% Change autorefname of table to Tab.
\addto\extrasenglish{%
    \renewcommand{\tableautorefname}{Tab.}%
}
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Solution figure %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareFloatingEnvironment[autorefname=Sol.-Fig.]{solutionfigure}
\captionsetup[solutionfigure]{name=Solution Figure, labelfont={color=blue},textfont={color=blue}}
\renewcommand{\thesolutionfigure}{\arabic{exerciseCount}.\arabic{solutionfigure}}

% Change autorefname of figure to Fig.
\addto\extrasenglish{%
    \renewcommand{\figureautorefname}{Fig.}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% exercise %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{exerciseCount}
\setcounter{exerciseCount}{0}

\newcommand{\ex}[1]{
    \stepcounter{exerciseCount}
    \large
    \ifnum\value{exerciseCount} < 10
        \textbf{Exercise~0\theexerciseCount:} #1
    \else
        \textbf{Exercise~\theexerciseCount:} #1
    \fi
    \normalsize
    \setlength{\parskip}{1em}
    \setcounter{solutionfigure}{0}
    \setcounter{solutiontable}{0}
}

\titleformat*{\section}{\normalfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% task %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{taskCount}[exerciseCount]
\setcounter{taskCount}{0}

\newcommand{\task}[1]{
    \stepcounter{taskCount}
        \ifnum\value{taskCount}=1
        \setlength{\parskip}{-12pt}
        \else
        \setlength{\parskip}{12pt}
        \fi
    \normalsize \section*{\textbf{Task~\thetaskCount:~#1}}
    \addcontentsline{toc}{section}{\protect\numberline{}#1}
    \setlength{\parskip}{-12pt}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% subtask %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{subtaskCount}[taskCount]
\setcounter{subtaskCount}{0}

\newcommand{\subtask}[1]{
    {\stepcounter{subtaskCount}
        \normalsize
        \setlength{\parskip}{12pt}
        \thetaskCount.\thesubtaskCount \ #1
    }

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Numbering of equations %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\numberwithin{equation}{exerciseCount}
\numberwithin{figure}{exerciseCount}
\numberwithin{table}{exerciseCount}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SI units %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% one space between value and unit
\sisetup{number-unit-product=\ }

% no space between the units
\sisetup{inter-unit-product = }

% fraction for units
\sisetup{per-mode = fraction}

% allow fraction for values
\sisetup{parse-numbers = false}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Color Definitions %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{signalred}{rgb}{0.9047, 0.1918, 0.1988}
\definecolor{signalblue}{rgb}{0.2941, 0.5447, 0.7494}
\definecolor{signalgreen}{rgb}{0.3718, 0.7176, 0.3612}
\definecolor{signalorange}{rgb}{1.0000, 0.5482, 0.1000}
\definecolor{signalyellow}{rgb}{0.8650, 0.8110, 0.4330}
\definecolor{signalbrown}{rgb}{0.6859, 0.4035, 0.2412}
\colorlet{shadecolor}{gray!60}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tikz %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pgfplotsset{compat=1.18}
\usetikzlibrary{shapes, arrows, positioning, fit, calc, patterns, decorations.pathmorphing,decorations.pathreplacing,decorations.shapes,decorations.text}
\usepgfplotslibrary{groupplots}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% tikz and circuittikz%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \usetikzlibrary{arrows,arrows.meta, shapes, shapes.symbols, positioning,shadows,trees,matrix, backgrounds, fit, calc, math, intersections, overlay-beamer-styles}

% Layered tree diagram
\tikzset{
  basic/.style  = {draw, text width=3cm, drop shadow, rectangle},
  root/.style   = {basic, rounded corners=2pt, thin, align=center,
                   fill=uniblue, text=white},
  level 2/.style = {basic, rounded corners=4pt, thin,align=center, fill=unilightblue,
                   text width=8em},
  level 3/.style = {basic, thin, align=left, fill=gray!25, text width=3cm}
}

% Block diagram
\tikzset{%
	block/.style    = {draw, thick, rectangle, minimum height = 3em,
	  minimum width = 4em},
    bubble/.style = {draw, ellipse, thick, minimum height = 3em,
    minimum width = 5em, fill = uniblue, text = white},
	dot/.style = {circle, draw, fill=black, minimum size=3pt, inner sep=0pt, outer sep=0pt},
	input/.style    = {coordinate}, % Input
	output/.style   = {coordinate}, % Output
  >={Latex[scale=1.25]} % Make the arrow heads larger
  }

\usepgfplotslibrary{groupplots, fillbetween} 

\ctikzset{bipoles/cuteswitch/thickness=0.15} % Thickness of cute switch
\ctikzset{diodes/scale=0.65} % Scale of diodes
\ctikzset{tripoles/nigbt/bodydiode scale=.5} % Scale of body diode
\ctikzset{tripoles/nigfete/bodydiode scale=.5} % Scale of body diode


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tabular %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{L}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}