\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lectureClass}[IAS lecture LaTeX class]
\LoadClass[aspectratio=169, usepdftitle=false, onlytextwidth, handout]{beamer}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class options %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{CC-BY}{
	\newcommand{\CCfig}{\href{https://creativecommons.org/licenses/by/4.0/}{\includegraphics[height=1cm]{../course_template/fig/CC-BY.pdf}}}
	\newcommand{\CClink}{https://creativecommons.org/licenses/by/4.0/}
	\newcommand{\CCname}{Creative Commons BY 4.0}
} % Creative Commons license (default)
\DeclareOption{CC-BY-NC-SA}{
	\renewcommand{\CCfig}{\href{https://creativecommons.org/licenses/by-nc-sa/4.0/}{\includegraphics[height=1cm]{../course_template/fig/CC-BY-NC-SA.pdf}}}
	\renewcommand{\CClink}{https://creativecommons.org/licenses/by-nc-sa/4.0/}
	\renewcommand{\CCname}{Creative Commons BY-NC-SA 4.0}
} % Creative Commons license (alternatve)
\newcommand{\selectedtheme}{unisiegen-IAS}
\DeclareOption*{
	\global\let\selectedtheme\CurrentOption
}
\ExecuteOptions{CC-BY} % Default CC license
% Marketing option (target audience: external partners)
\newcommand{\CCtitle}{Lecture slides}

\ProcessOptions\relax


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Packages %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{../course_template/theme/\selectedtheme}
\usepackage{../course_template/style/presentation}

%% Custom table and figure title
\AtBeginDocument{
	\renewcommand{\tablename}{Tab.}%
	\renewcommand{\figurename}{Fig.}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% logo & author information for the entire slide set %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set logo and author information
\titlegraphic{
	\href{\CCcontacturl}{\includegraphics[height=1cm]{\CClogo}}
	\hspace{2cm}
	\CCfig
}
\author{N.N.} % Default fallback - override in actual main tex file

