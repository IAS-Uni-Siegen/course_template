
%Updated code
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
\usepackage{../course_template/document_template/paper}
\RequirePackage{titling}
%\RequirePackage[european, smartlabels, americaninductor]{circuitikz}
%\usetikzlibrary{calc,math}
\RequirePackage{mathtools}
\RequirePackage{placeins}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Graphic path %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{ {./fig/} }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Solution block %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentEnvironment{solutionblock}{+b}
{
    \ifsolution
    \color{blue}
    \setlength{\parskip}{0pt}%~\\
    \FloatBarrier
    \noindent\underline{Answer:}%~\\ %if you want the actual answer to start from the next line simply add ~\\ also
    \FloatBarrier
    #1
    \FloatBarrier
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
        \textbf{Exercise~0\theexerciseCount:} \textbf{#1}
    \else
        \textbf{Exercise~\theexerciseCount:} \textbf{#1}
    \fi
    \normalsize
    \setlength{\parskip}{1em}
    
    % Reset task and subtask counters
    \setcounter{taskCount}{0}
    \setcounter{subtaskCount}{0}
}

\titleformat*{\section}{\normalfont}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% task %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{taskCount}[exerciseCount]                  

\renewcommand{\thesection}{\theexerciseCount.\thetaskCount} 
\newcommand{\task}[1]{ 
    \stepcounter{taskCount}
    
    \ifnum\value{taskCount}=1
        \setlength{\parskip}{-12pt}
    \else
        \setlength{\parskip}{-12pt}
    \fi
    \ifnum\value{taskCount}>1
    \vspace{1em} % Adjust the spacing value as needed
    \fi
    \normalsize
    \section*{\textbf{Task~\theexerciseCount.\thetaskCount:~#1}} % Display "Subtask" without numbering
    \refstepcounter{section} 
    
    \label{task:\theexerciseCount.\thetaskCount} % Unique label for each task
}
\addto\extrasenglish{%
\renewcommand{\sectionautorefname}{task}

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% subtask %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{subtaskCount}[taskCount]
%\setcounter{subtaskCount}{0}

\newcommand{\subtask}[1]{
    {\stepcounter{subtaskCount}
        
        \vspace{-1em} %reduce spacing
        \normalsize
        \subsection*{} % Display "Subtask" without numbering
        \refstepcounter{subsection}
        \label{subtask:\theexerciseCount.\thetaskCount.\thesubtaskCount}
         
        \theexerciseCount.\thetaskCount.\thesubtaskCount \ #1
    }
}


\addto\extrasenglish{%
\renewcommand{\subsectionautorefname}{subtask}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Numbering of equations %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\numberwithin{equation}{taskCount}
\numberwithin{figure}{taskCount}
\numberwithin{table}{taskCount}
\numberwithin{solutionfigure}{taskCount}

\renewcommand{\thefigure}{\theexerciseCount.\thetaskCount.\arabic{figure}} % Redefine figure numbering format
\renewcommand{\thesolutionfigure}{\theexerciseCount.\thetaskCount.\arabic{solutionfigure}}
\renewcommand{\theequation}{\theexerciseCount.\thetaskCount.\arabic{equation}}
\renewcommand{\thetable}{\theexerciseCount.\thetaskCount.\arabic{table}}
