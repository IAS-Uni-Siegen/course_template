\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lectureClass}[IAS lecture LaTeX class]
\LoadClass[aspectratio=169, usepdftitle=false, handout]{beamer}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class options %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifmarketing
\DeclareOption{marketing}{\marketingtrue} % Marketing option (target audience: external partners)

\DeclareOption{CC-BY}{
  \newcommand{\CCfig}{\href{https://creativecommons.org/licenses/by/4.0/}{\includegraphics[height=1cm]{CC-BY.pdf}}}
  \newcommand{\CClink}{https://creativecommons.org/licenses/by/4.0/}
  \newcommand{\CCname}{Creative Commons BY 4.0}
} % Creative Commons license (default)
\DeclareOption{CC-BY-NC-SA}{
  \renewcommand{\CCfig}{\href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{\includegraphics[height=1cm]{CC-BY-NC-SA.pdf}}}
  \renewcommand{\CClink}{https://creativecommons.org/licenses/by-nc-sa/4.0/}
  \renewcommand{\CCname}{Creative Commons BY-NC-SA 4.0}
} % Creative Commons license (alternatve)
\ExecuteOptions{CC-BY} % Default CC license

\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Very basic document style settings %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usetheme{Madrid}
\usecolortheme{dove}
\usefonttheme{professionalfonts}
\beamertemplatenavigationsymbolsempty % deactivate beamer class navigator bar


% toc style
\setbeamertemplate{section in toc}[ball]
\setbeamertemplate{subsection in toc}[square]
\setbeamercolor{section number projected}{fg = white, bg = uniblue}
\setbeamercolor{subsection number projected}{fg = white, bg = uniblue}

% toc automation
\AtBeginSection[]
{
  \begin{frame}{Table of contents}
     \tableofcontents[sectionstyle=show/hide,subsectionstyle=show/show/hide]
  \end{frame}
}

\AtBeginSubsection[]
{
  \ifnum\value{subsection} > 1 % show toc only again after second subsection onwards  
    \begin{frame}{Table of contents}
      \tableofcontents[sectionstyle=show/hide,subsectionstyle=show/shaded/hide]
   \end{frame}
  \fi
}


%itemize / enumerate style
\setbeamertemplate{itemize items}[triangle]
\setbeamercolor{item}{fg = uniblue}
\setbeamercolor{subitem}{fg = uniblue}
\setbeamertemplate{itemize/enumerate body begin}{\vspace{0.25em}} % vertical space before itemize/enumerate
\setbeamertemplate{itemize/enumerate body end}{\vspace{0.25em}} % vertical space after itemize/enumerate

% Align itemize smybols with slide title on the left
\settowidth{\leftmargini}{\usebeamertemplate{itemize item}}
\addtolength{\leftmargini}{\labelsep}
\settowidth{\leftmarginii}{\usebeamertemplate{itemize item}}
\addtolength{\leftmarginii}{\labelsep}

% Set title slide color to uniblue
\setbeamercolor{titlelike}{parent = structure, fg = uniblue}
\setbeamercolor{title}{parent = structure, fg = uniblue}
\setbeamercolor{author}{parent = structure, fg = uniblue}
\setbeamercolor{date}{parent = structure, fg = uniblue}

% set font color of footer information to uniblue
\setbeamercolor{title in head/foot}{fg = uniblue}
\setbeamercolor{author in head/foot}{fg = uniblue}
\setbeamercolor{page number in head/foot}{fg = uniblue}

% Align text and slide title on the left
\setbeamersize{text margin left=0.3cm}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% logo & author information for the entire slide set %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Set logo and author information
\ifmarketing
    \titlegraphic{\href{https://www.eti.uni-siegen.de/ias/}{\includegraphics[height=1cm]{IAS.pdf}}}
\else
    \titlegraphic{\href{https://www.eti.uni-siegen.de/ias/}{\includegraphics[height=1cm]{IAS.pdf}}
    \hspace{2cm} 
    \CCfig
    }
\fi
\author{N.N.}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Packages %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[boxed, noend, noline]{algorithm2e}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath}
\RequirePackage{booktabs}
\RequirePackage{amsfonts}
\RequirePackage{subcaption}
\RequirePackage{ragged2e}
\RequirePackage{array}
\RequirePackage{hhline}
\RequirePackage{xcolor}
\RequirePackage{bm}
\RequirePackage{calc}
\RequirePackage{multirow}
\RequirePackage{animate}
\RequirePackage{xparse}
\RequirePackage{nicefrac}
\RequirePackage{tikzpeople}
\RequirePackage{multimedia}
\ifmarketing
  \RequirePackage[toc = false]{glossaries-extra}
\else 
  \RequirePackage[automake, toc = false]{glossaries-extra} % automake option causes error if \makeglossaries is not used in main file 
\fi
\RequirePackage{siunitx}
\RequirePackage{hyperxmp} % For pdf metadata
\RequirePackage{hyperref}
\RequirePackage[font=small,justification=centering]{caption}
\RequirePackage{tikz, pgfplots}
\RequirePackage[european, smartlabels, americaninductor]{circuitikz}
\RequirePackage{eurosym}
\RequirePackage[listings,theorems, skins, most, many]{tcolorbox}
\RequirePackage[parent]{currfile}
\RequirePackage[hang,flushmargin]{footmisc}
\RequirePackage{csquotes} % For \enquote command
\RequirePackage{fontawesome} % For icons




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SI setup %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\sisetup{
  per-mode=fraction,
  fraction-function=\tfrac,
  input-digits = 0123456789\pi,
  exponent-product=\ensuremath{\cdot},
  inter-unit-product = {},
  range-phrase=\,--\,
}
\DeclareSIUnit{\EUR}{\text{\euro}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hyperref setup %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\hypersetup{colorlinks,
            linkcolor=,
            urlcolor=links,
            pdfcopyright={\CCname},
            pdflicenseurl={\CClink},
            pdfauthor={Oliver Wallscheid},
            pdfcontacturl={https://www.eti.uni-siegen.de/ias/},
            pdftitle={Lecture slides}
            }

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% New footnote command without numbering %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Delete absolute page number depiction since \inserttotalframenumber is not updated to zero when using \part      command  %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\setbeamertemplate{footline}{
  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex, left, leftskip=0.375cm]{author in head/foot}%
    \usebeamerfont{author in head/foot}\insertshortauthor\expandafter\ifblank\expandafter{\beamer@shortinstitute}{}{~~(\insertshortinstitute)}
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
    \usebeamerfont{title in head/foot}\insertshorttitle
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,right, rightskip=0.25cm]{date in head/foot}%
    \usebeamerfont{date in head/foot}\insertshortdate{}\hspace*{5em}
    \insertframenumber{}%/\inserttotalframenumber
    \hspace*{2ex} 
  \end{beamercolorbox}}%
  \vskip0pt%

}
\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% check- and x-mark %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{pifont}% http://ctan.org/pkg/pifont
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Centered p-box & m-box in table env. using array package %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% tikz and circuittikz%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usetikzlibrary{arrows,arrows.meta, shapes, shapes.symbols, positioning,shadows,trees,matrix, backgrounds, fit, calc, math, intersections, overlay-beamer-styles}

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
\pgfplotsset{compat=1.18}
\usepgfplotslibrary{groupplots, fillbetween} 
\tikzstyle{ctrlblock} = [draw, rectangle, minimum height = 2em, minimum width = 3em, thick]

\ctikzset{bipoles/cuteswitch/thickness=0.15} % Thickness of cute switch
\ctikzset{multipoles/rotary/thickness=0.15} % Thickness of rotary switch
\ctikzset{diodes/scale=0.65} % Scale of diodes
\ctikzset{tripoles/nigbt/bodydiode scale=.5} % Scale of body diode
\ctikzset{tripoles/nigfete/bodydiode scale=.5} % Scale of body diode
\ctikzset{bipoles/currtap/dot size=0.3} % Scale of curr tab dot
\ctikzset{tripoles/adder/width=0.4} % Scale of adder
\ctikzset{tripoles/mixer/width=0.4} % Scale of adder



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Blocks / tcolorboxes %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% General blocks
\setbeamercolor{block body}{fg=black,bg=gray!15} 
\setbeamercolor{block title}{fg=white,bg=uniblue}
\addtobeamertemplate{block begin}{}{\justifying} % justification of block content

% Centered block with adjustable width
\newenvironment<>{varblock}[2][.9\textwidth]{
\begin{center}
  \begin{minipage}{#1}
    \begin{actionenv}#3%
      \def\insertblocktitle{#2}%
      \par%
      \usebeamertemplate{block begin}}
    {\par%
      \usebeamertemplate{block end}%
    \end{actionenv}
  \end{minipage}
\end{center}
}

% Math. definitions
\newtcbtheorem[number within=section, reset counter on overlays=true]{defi}{Definition}{enhanced, grow to left by=0.15cm, grow to right by=0.15cm, left=0.05cm, right=0.05cm,bottom=0.05cm, top=0.05cm,arc=1mm, colback = gray!15, colbacktitle = uniblue, boxrule = 0pt, frame hidden, drop fuzzy shadow=black!90,  width=1.02\textwidth}{defi}

% Math. theorems		
\newtcbtheorem[number within=section, reset counter on overlays=true]{theo}{Theorem}{enhanced, grow to left by=0.15cm, grow to right by=0.15cm, left=0.05cm, right=0.05cm,bottom=0.05cm, top=0.05cm,arc=1mm, colback = gray!15, colbacktitle = uniblue, boxrule = 0pt, frame hidden, drop fuzzy shadow=black!90}{theo}

% Algorithms	
\newtcbtheorem[number within=section, reset counter on overlays=true]{algo}{Algorithm}{enhanced, grow to left by=0.15cm, grow to right by=0.15cm, left=0.05cm, right=0.05cm,bottom=0.05cm, top=0.05cm,arc=1mm, colback = gray!15, colbacktitle = uniblue, boxrule = 0pt, frame hidden, drop fuzzy shadow=black!90,  width=1.02\textwidth}{algo}

% Footnote box with footnotesize text and minimal margins
\newtcolorbox{footnotebox}[1][]{enhanced, grow to left by=0.15cm, grow to right by=0.15cm, left=0.05cm, right=0.05cm,bottom=0.05cm, top=0.05cm,arc=1mm, colback = gray!15, colbacktitle = uniblue, boxrule = 0pt, frame hidden, drop fuzzy shadow=black!90, width=1.02\textwidth, fontupper=\footnotesize, #1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% References %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\figref}[1]{\figurename~\ref{#1}}
\newcommand{\satzref}[1]{Theo.~\ref{#1}}
\newcommand{\defref}[1]{Def.~\ref{#1}}
\newcommand{\theoref}[1]{Theo.~\ref{#1}}
\newcommand{\tabref}[1]{\tablename~\ref{#1}}
\newcommand{\capref}[1]{\capname~\ref{#1}}
\newcommand{\apref}[1]{\apname~\ref{#1}}
\newcommand{\algname}{Algo.}
\newcommand{\algoref}[1]{\algname~\ref{#1}}
\setbeamertemplate{caption}{\raggedright\centering\insertcaption\par}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Numbering of captions  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setbeamertemplate{caption}[numbered] %Gives basic numbering to captions
\numberwithin{figure}{section} %Allows for \part.\figure style numbering
\renewcommand\figurename{Fig.}
\renewcommand{\thetable}{\arabic{table}}
\numberwithin{equation}{section} %Allows for \part.\equation style numbering
\numberwithin{table}{section} %Allows for \part.\table style numbering
\renewcommand\tablename{Tab.}
\renewcommand{\algorithmcfname}{Algo.} %Algorithm-Name
\numberwithin{algocf}{section} %Allows for \part.\algo style numbering

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Captions for algorithm2e package (modify towards regular figure cap)  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\SetAlCapNameFnt{\small}
\SetAlCapSty{}
\SetAlCapFnt{\small}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Math short commands  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\E}[1]{\mathbb{E}\left[#1\right]} %Expected value
\newcommand{\Var}[1]{\mathrm{Var}\left[#1\right]} %Variance value
\newcommand{\El}[2]{\mathbb{E}_{#2}\left[#1\right]} %Expected value with lower index
\newcommand{\Pb}[1]{\mathbb{P}\left[#1\right]} %Propability
\newcommand{\T}{^{\mkern-1.5mu\mathsf{T}}} %Transpose
\newcommand{\iu}{\mathrm{j}\mkern1mu} %imaginary unit
\DeclareMathOperator*{\argmax}{arg\,max} % arg max
\DeclareMathOperator*{\argmin}{arg\,min} % arg min

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Glossaries %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newglossary{nomen}{nom}{nomc}{Nomnclature}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Misc. %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\footnoterule\relax % Removes the horizontal line above footnotes
\graphicspath{{course_template/}{../course_template/}{fig/}{../fig/}} % Potential paths to figures


\ProcessOptions\relax
