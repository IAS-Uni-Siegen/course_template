\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lectureClass}[IAS lecture LaTeX class]
\LoadClass[aspectratio=169, usepdftitle=false, onlytextwidth, handout]{beamer}
 

 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class options %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifmarketing
\DeclareOption{marketing}{\marketingtrue} % Marketing option (target audience: external partners)
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class options %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifmarketing
\DeclareOption{marketing}{\marketingtrue}

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
 % Marketing option (target audience: external partners)
\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Packages %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{../course_template/style/presentation}

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
\fi
\author{N.N.}

