%%
%%
%% TISmeetrapport.cls
%%
%% Meetrapport class for TIS - TN 
%% 
%%
%% (c)2015,2016 D.D. Land <d.d.land@hhs.nl>
%% based on TISmeetrapport.cls from J. op den Brouw <J.E.J.opdenBrouw@hhs.nl>
%%
%% Version 0.1
%%
%% 20150502 -- initial realease
%%
%% This document class makes use of the exam class.
%%

%% Class options:
%%  xcolor, babel, geometry


\def\fileversion{0.1}
\def\filedate{2016/02/08}
\edef\TISmeetrapportfileversion{\fileversion}
\edef\TISmeetrapportfiledate{\filedate}

\NeedsTeXFormat{LaTeX2e}[1995/06/01]

\ProvidesClass{TISmeetrapport}[\filedate\space Version \fileversion\space TIS Meetrapport
	Class by D.D. Land]
%% zet de taal op NL
\PassOptionsToPackage{dutch}{babel}
\PassOptionsToPackage{small,bf}{caption}

\DeclareOption{10pt}{\def\TISmeetrapport@size{10pt}}
\DeclareOption{11pt}{\def\TISmeetrapport@size{11pt}}
\DeclareOption{12pt}{\def\TISmeetrapport@size{12pt}}
\def\TISmeetrapport@size{12pt}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[\TISmeetrapport@size]{article}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{babel}
\RequirePackage{caption}
\RequirePackage{ifthen}

\usetikzlibrary{calc}


%% commands for the title page
\newcommand{\practicum}[1]{\def\TISmeetrapport@practicum{#1}}
\newcommand{\nummerproef}[1]{\def\TISmeetrapport@nummerproef{#1}}
\newcommand{\naamproef}[1]{\def\TISmeetrapport@naamproef{#1}}
\newcommand{\studentauteur}[1]{\def\TISmeetrapport@studentauteur{#1}}
\newcommand{\studentuitvoer}[1]{\def\TISmeetrapport@studentuitvoer{#1}}
\newcommand{\studentklas}[1]{\def\TISmeetrapport@studentklas{#1}}
\newcommand{\datumuitvoer}[1]{\def\TISmeetrapport@datumuitvoer{#1}}
\newcommand{\datuminleveren}[1]{\def\TISmeetrapport@datuminleveren{#1}}
\newcommand{\docent}[1]{\def\TISmeetrapport@docent{#1}}
\newcommand{\datuminleverenherkansing}[1]{\def\TISmeetrapport@datuminleverenherkansing{#1}}
\fancyhead[L]{\TISmeetrapport@practicum}
\fancyhead[R]{\TISmeetrapport@studentauteur \hspace{1cm} \thepage}
\pagestyle{fancy}

%\markboth{\MakeUppercase{\TISmeetrapport@practicum}}{\TISmeetrapport@studentauteur}

%% default options for the input fields
%% cover page
\newcommand{\makecoverpage}{%
\setlength{\parindent}{0pt}
\newgeometry{bindingoffset=0.0in, left=3cm, right=0.1in, top=0.4in, 
	bottom = 0.2in, footskip=0.0in}
\thispagestyle{empty}
\hbox{% %% the cover page is contained in one hbox
\begin{minipage}[t][0.95\textheight]{0.94\linewidth}
\vspace{2cm}
{\centering{\fontfamily{phv}\fontsize{20.74pt}{19pt}\selectfont{\bfseries Meetrapport \TISmeetrapport@practicum \par}}}
\vspace{1cm}
\hbox{% %% proef en student informatie
	\begin{minipage}[c]{0.99\linewidth}
	{\fontfamily{ptm}\fontsize{14pt}{14pt}\selectfont{\normalfont
	\begin{tabular}{p{6.5cm} l p{8.0cm}}
	Proefnaam & : & \MakeUppercase{\TISmeetrapport@naamproef} \\
	Proefnummer & : & \TISmeetrapport@nummerproef \\
	& \\[1cm]
	Geschreven door & : & \TISmeetrapport@studentauteur \\
	Uitgevoerd met & : & \TISmeetrapport@studentuitvoer \\
	Klas & : & \MakeUppercase{\TISmeetrapport@studentklas} \\
	& \\[1cm]
	Datum uitvoering proef & : & \TISmeetrapport@datumuitvoer \\
	Datum inleveren rapport & : & \TISmeetrapport@datuminleveren \\
        \ifthenelse{\isundefined{\TISmeetrapport@datuminleverenherkansing}}{
        }{
        Datum inleveren herkansing & : & \TISmeetrapport@datuminleverenherkansing \\}
	Naam Docent & : & \TISmeetrapport@docent \\ 
	\end{tabular}}}
	\end{minipage}
} % end hbox - proef en student informatie
\vspace{2cm}
{\centering{\fontfamily{phv}\fontsize{20.74pt}{19pt}\selectfont{\bfseries RUIMTE BESTEMD VOOR DOCENT\par}}}
\vspace{1cm}
\hbox{% %% beoordeling
	\begin{minipage}[c]{0.99\linewidth}
	{\fontfamily{phv}\fontsize{14pt}{14pt}\selectfont{\normalfont
	\begin{tabular}{cl}
	\multicolumn{2}{l}{Beoordeling} \\
	& \\[1cm]
	$\square$ & GOEDGEKEURD \\
	$\square$ & BESPREKEN \\
	$\square$ & VERBETEREN \\
	$\square$ & AANVULLEN \\
	$\square$ & OVERMAKEN \\
	& \\[1cm]
	& Eindbeoordeling: \\
	& \\[1cm]
	& Paraaf Docent: \\
	\end{tabular}}}
	\end{minipage}
}% end hbox - beoordeling
\end{minipage}
\begin{tikzpicture}[remember picture, overlay]
	\node[anchor=south west, inner sep=0pt] at ($(current page.south west)+(0.2cm,2cm)$){
 	\includegraphics[angle=90, height=12cm]{HHS_groen}
	};
\end{tikzpicture}
} % end hbox
\newpage %start document on next page
\setcounter{page}{1}
\restoregeometry
} % end newcommand - makecoverpage

\endinput
