\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lectureClass}[IAS lecture LaTeX class]
\LoadClass[aspectratio=169, usepdftitle=false, handout]{beamer}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Very basic document style settings %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usefonttheme{professionalfonts}
\setbeamertemplate{itemize items}[triangle]
\setbeamertemplate{section in toc}[ball]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% logo & author information for the entire slide set %%
\titlegraphic{\href{https://www.eti.uni-siegen.de/ias/}{\includegraphics[height=1cm]{fig/IAS.pdf}}\hspace{2cm} \href{https://creativecommons.org/licenses/by/4.0/}{\includegraphics[height=1cm]{../course_template//CC-BY.pdf}}}
\author{Oliver Wallscheid}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%