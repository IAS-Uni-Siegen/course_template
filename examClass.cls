\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{examClass}[2024/07/11 EMD exam LaTeX class]

\LoadClass[a4paper,12pt,notitlepage,oneside]{article}


\newif\ifsolution
\newif\ifgerman

\DeclareOption{solution}{\solutiontrue}
\DeclareOption{german}{\germantrue}
\ProcessOptions\relax


\RequirePackage{geometry}
\geometry{left=1.5cm, right=1.5cm, top=1.5cm, bottom=1.5cm}


%---Allgemeine Packages---
\RequirePackage{tabularx}
\RequirePackage{caption}
\RequirePackage{siunitx}
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
\RequirePackage{circuitikz}
\RequirePackage{multirow}
\RequirePackage{newfloat}
\RequirePackage{totcount}
\RequirePackage{nicefrac}

%% Tikz
\pgfplotsset{compat=1.18}
\usetikzlibrary{shapes, angles, arrows, intersections, quotes, positioning, fit, calc, patterns, decorations.pathmorphing,decorations.pathreplacing,decorations.shapes,decorations.text, math}
\usepgfplotslibrary{groupplots, fillbetween}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

% Caption
\DeclareCaptionFont{blue}{\color{blue}}


%---Grafiken---
\graphicspath{ {./summer2024/fig/} }


% Setup page geometry
\setlength{\parindent}{0em}
\setlength{\parskip}{0pt}
\setlength{\headheight}{15mm}
\setlength{\headsep}{8mm}
\setlength{\textheight}{250mm}


\fancyhead[L]{
    \textbf{\large{\@title}}\\
    Prof. Dr.-Ing. Oliver Wallscheid
}

\fancyhead[R]{
    \includegraphics[width=\textwidth,height=10mm, keepaspectratio]{fig/IAS.pdf}
}

\fancyfoot[C]{\thepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% hint block block %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentEnvironment{hintblock}{+b}
{
    \setlength{\parskip}{0pt}
    \noindent \ignorespaces 
    \underline{Hint:} #1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% hint german block %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentEnvironment{germanhintblock}{+b}
{
    \ifgerman
        \color{gray}
        \setlength{\parskip}{0pt}
        \noindent \ignorespaces 
        \underline{Hinweis:} #1
    \fi
}

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
    
    \vspace{0.5em}
    
    \underline{Answer:}\\
    #1
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% German block %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentEnvironment{germanblock}{+b}
{
    \ifgerman
        \color{gray}
        \setlength{\parskip}{0pt}
        \noindent \ignorespaces 
        #1
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Solution table %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareFloatingEnvironment[autorefname=Sol.-Tab.]{solutiontable}
\captionsetup[solutiontable]{name=Solution Table, labelfont={color=blue},textfont={color=blue}}
\renewcommand{\thesolutiontable}{\arabic{solutiontable}}

% Change autorefname of table to Tab.
\addto\extrasenglish{%
    \renewcommand{\tableautorefname}{Tab.}%
}
    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Solution figure %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareFloatingEnvironment[autorefname=Sol.-Fig.]{solutionfigure}
\captionsetup[solutionfigure]{name=Solution Figure, labelfont={color=blue},textfont={color=blue}}
\renewcommand{\thesolutionfigure}{\arabic{solutionfigure}}


% Change autorefname of figure to Fig.
\addto\extrasenglish{%
    \renewcommand{\figureautorefname}{Fig.}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Counter and space %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% exercise %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%% task %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{taskCount}%[exerciseCount]
\setcounter{taskCount}{0}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% count the points of each task %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Total task points
\newcounter{totalTaskPoints}
\setcounter{totalTaskPoints}{0}
\regtotcounter{totalTaskPoints}

%% Task 1
\newcounter{taskPointsA}
\setcounter{taskPointsA}{0}
\regtotcounter{taskPointsA}

%% Task 2
\newcounter{taskPointsB}
\setcounter{taskPointsB}{0}
\regtotcounter{taskPointsB}

%% Task 3
\newcounter{taskPointsC}
\setcounter{taskPointsC}{0}
\regtotcounter{taskPointsC}

%% Task 4
\newcounter{taskPointsD}
\setcounter{taskPointsD}{0}
\regtotcounter{taskPointsD}

\newcommand{\task}[1]{
    \stepcounter{taskCount}
        \ifnum\value{taskCount}=1
        \setlength{\parskip}{-12pt}
        \else
        \setlength{\parskip}{12pt}
        \fi
    \ifnum\value{taskCount}= 1
        \color{black}
        \normalsize \section*{\textbf{Task~\thetaskCount:~#1 \hfill [\total{taskPointsA}~Points]}}
    \fi
    \ifnum\value{taskCount}= 2
        \color{black}
        \normalsize \section*{\textbf{Task~\thetaskCount:~#1 \hfill [\total{taskPointsB}~Points]}}
    \fi
    \ifnum\value{taskCount}= 3
        \color{black}
        \normalsize \section*{\textbf{Task~\thetaskCount:~#1 \hfill [\total{taskPointsC}~Points]}}
    \fi
    \ifnum\value{taskCount}= 4
        \color{black}
        \normalsize \section*{\textbf{Task~\thetaskCount:~#1 \hfill [\total{taskPointsD}~Points]}}
    \fi
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% subtask %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{subtaskCount}[taskCount]
\setcounter{subtaskCount}{0}
\newcounter{subTaskPoints}

\newcommand{\subtask}[2]{
    {\stepcounter{subtaskCount}
        \normalsize
        \color{black}
        \setlength{\parskip}{12pt}
        \thetaskCount.\thesubtaskCount \ #1
        \setcounter{subTaskPoints}{#2}
        \ifnum \value{subTaskPoints}=1
        \hfill [#2~Point]
        \else
        \hfill [#2~Points]
        \fi

        % sum up subtask points for task 1
        \ifnum \value{taskCount} = 1
            \addtocounter{taskPointsA}{#2}
        \fi
        % task 2
        \ifnum \value{taskCount} = 2
            \addtocounter{taskPointsB}{#2}
        \fi
        \ifnum \value{taskCount} = 3
            \addtocounter{taskPointsC}{#2}
        \fi
        \ifnum \value{taskCount} = 4
            \addtocounter{taskPointsD}{#2}
        \fi
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% task german %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{taskCountGerman}[exerciseCount]
\setcounter{taskCountGerman}{0}

\newcommand{\taskGerman}[1]{
    \ifgerman
        \stepcounter{taskCountGerman}
            \ifnum\value{taskCountGerman}=1
            \setlength{\parskip}{-12pt}
            \else
            \setlength{\parskip}{-12pt}
            \fi
        \normalsize \color{gray} \section*{\textbf{Aufgabe~\thetaskCountGerman:~#1}}
        \setlength{\parskip}{-12pt}
        \color{black}
    \fi
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% subtask german %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{subtaskCountGerman}[taskCount]
\setcounter{subtaskCountGerman}{0}

\newcommand{\subtaskGerman}[1]{
    \ifgerman
        {\stepcounter{subtaskCountGerman}
            \color{gray}
            \normalsize
            \setlength{\parskip}{0pt}
            \thetaskCountGerman.\thesubtaskCountGerman \ #1
            
        }
    \fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% total points %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\tp}[4]{
    \addtocounter{totalTaskPoints}{#1}  % task 1
    \addtocounter{totalTaskPoints}{#2}  % task 2
    \addtocounter{totalTaskPoints}{#3}  % task 3
    \addtocounter{totalTaskPoints}{#4}  % task 4

    \thetotalTaskPoints
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tabular %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define specific tabular rules
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{L}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Further counters and caption %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\thefigure}{\arabic{figure}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Color Definitions %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{uniblue}{HTML}{00385F}
\definecolor{unilightblue}{HTML}{009ED4}
\definecolor{unigrey}{HTML}{64727f}
\definecolor{links}{HTML}{2A1B81}
\newcommand{\hl}[1]{\textcolor{signalred}{#1}} %Highlights in text
\newcommand{\hlh}[1]{\textbf{#1}} %Highlights in sub-headings
\definecolor{signalred}{rgb}{0.9047, 0.1918, 0.1988}
\definecolor{signalblue}{rgb}{0.2941, 0.5447, 0.7494}
\definecolor{signalgreen}{rgb}{0.3718, 0.7176, 0.3612}
\definecolor{signalorange}{rgb}{1.0000, 0.5482, 0.1000}
\definecolor{signalyellow}{rgb}{0.8650, 0.8110, 0.4330}
\definecolor{signalbrown}{rgb}{0.6859, 0.4035, 0.2412}
\definecolor{signallavender}{rgb}{0.55, 0.51, 0.71}
\colorlet{shadecolor}{gray!60}