% thesis.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025/07/14 Custom ETH-style Thesis Class]

\LoadClass[a4paper,10pt,twoside,openright,extrafontsizes]{memoir}

% Encoding and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[french,ngerman,english]{babel}

% Load fonts
\usepackage{helvet} % fallback sans-serif
\usepackage{fontspec}
\setmainfont{Optima}

\renewcommand{\rmdefault}{utopia} % fallback serif for math if needed
\renewcommand{\sfdefault}{phv}    % Helvetica (fallback sans-serif)
\renewcommand*\familydefault{\rmdefault}
\newfontfamily\chapnumfontsf{Futura}

\newfontfamily\chapterNumberFont{Futura} % or another playful sans-serif
\newfontfamily\chaptitleoptima{Optima}


% Define colors
\RequirePackage{xcolor}
\definecolor{grey}{HTML}{4D4D4D}
\definecolor{plot_grey}{HTML}{4D4D4D}
\definecolor{plot_blue}{HTML}{0066CC}
\definecolor{plot_red}{HTML}{FF3300}
\definecolor{plot_orange}{HTML}{FF6600}
\definecolor{plot_yellowbrown}{HTML}{FFCC00}
\definecolor{dark_blue}{HTML}{ 1b4f72 }


%chapter style
\makechapterstyle{fancyblock}{
  \renewcommand{\chapnamefont}{}
  \renewcommand{\chapnumfont}{\chapnumfontsf\color{dark_blue!60}\fontsize{60}{60}\selectfont}
  \renewcommand{\chaptitlefont}{\chaptitleoptima\LARGE\scshape\MakeUppercase}
  \renewcommand{\printchaptername}{}
  \renewcommand{\printchapternum}{%
    \hfill\makebox[0pt][r]{\chapnumfont\thechapter}%
    \vspace*{-4em}
  }
  \renewcommand{\afterchapternum}{\par\vspace{3em}}
  \renewcommand{\printchaptertitle}[1]{%
    \begin{flushleft}%
      \chaptitlefont ##1\\[0.5ex]
      \rule{\textwidth}{0.4pt}%
    \end{flushleft}%
    \vspace{1em}
  }
}
% Activate this chapter style
\chapterstyle{fancyblock}

% Section title fonts (paragraph titles = \paragraph)
\setsecheadstyle{\bfseries\Large\chaptitleoptima}
\setsubsecheadstyle{\bfseries\large\chaptitleoptima}
\setsubsubsecheadstyle{\bfseries\normalsize\chaptitleoptima}
\setparaheadstyle{\bfseries\normalsize\chaptitleoptima}
\setsubparaheadstyle{\bfseries\normalsize\chaptitleoptima}



% Hyperref setup
\RequirePackage[
    pdfauthor={Your Name},
    pdftitle={Your Thesis Title}
]{hyperref}

% Typography and layout
\RequirePackage{microtype}
\RequirePackage{geometry}
\RequirePackage{fancyvrb}
\RequirePackage{pdfpages}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{dashrule}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{pdflscape}
\RequirePackage{afterpage}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{leftidx}
\RequirePackage{siunitx}
\RequirePackage{natbib}
\RequirePackage[sectionbib]{chapterbib}
\RequirePackage{bookmark}
\RequirePackage{import}
\RequirePackage{diagbox}
\RequirePackage{tikz}
\RequirePackage{csvsimple}   % <— preferred
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage{adjustbox}



% Caption styling
\RequirePackage[font=small,labelfont={sc,bf},labelsep=quad]{caption}
\setlength{\captionmargin}{5pt}
\setlength{\intextsep}{30pt plus 1.0pt minus 2.0pt}

% Header/footers and spacing
\linespread{1.6}
\feetatbottom
\setlength{\footmarkwidth}{1em}
\setlength{\footmarksep}{0em}
\setlength{\parskip}{4pt}
\setlength{\parindent}{0cm}

% Table chunk size
\setcounter{LTchunksize}{50}

% Math operators
\DeclareMathOperator{\YFP}{YFP}
\DeclareMathOperator{\OD}{OD}
\DeclareMathOperator{\s}{s}
\DeclareMathOperator{\logit}{logit}

% Autoref customization for English
\addto\extrasenglish{%
  \def\chapterautorefname{\textsc{Chapter}}
  \def\sectionautorefname{\textsc{Section}}
  \def\subsectionautorefname{\textsc{Section}}
  \def\subsubsectionautorefname{\textsc{Section}}
  \def\figureautorefname{\textsc{Fig.}}
  \def\figurename{\textsc{Fig.}}
  \def\tableautorefname{\textsc{Table}}
  \def\tablerefname{\textsc{Table}}
  \def\appendixautorefname{\textsc{Appendix}}
}

% Page style definitions
\copypagestyle{pst_e}{ruled}
\makeevenhead{pst_e}{\footnotesize\hspace{-3.5em}\scshape\leftmark}{}{}
\makeoddhead{pst_e}{}{}{\footnotesize\scshape\rightmark}
\makeevenfoot{pst_e}{\footnotesize\thepage}{}{}
\makeoddfoot{pst_e}{}{}{\footnotesize\thepage}
\makepsmarks{pst_e}{
  \createmark{chapter}{both}{shownumber}{}{.\ }
  \createmark{section}{right}{shownumber}{}{.\ }
  \createplainmark{toc}{both}{\contentsname}
  \createplainmark{lof}{both}{\listfigurename}
  \createplainmark{lot}{both}{\listtablename}
  \createplainmark{bib}{both}{\bibname}
  \createplainmark{index}{both}{\indexname}
  \createplainmark{glossary}{both}{\glossaryname}
}

% Appendix style
\copypagestyle{pst_app}{pst_e}
\makepsmarks{pst_app}{
  \createmark{chapter}{both}{shownumber}{Appendix }{.\ }
  \createmark{section}{right}{shownumber}{}{.\ }
}

% Chapter author command
\makeatletter
\newcommand{\chapterauthor}[1]{%
  {\parindent0pt\vspace*{-25pt}
  \linespread{1.1}\large\scshape#1
  \par\nobreak\vspace*{35pt}}
  \@afterheading
}
\makeatother

% Titled frame (optional)
\newcommand{\TitleFrame}[2]{%
  \fboxrule=\FrameRule \fboxsep=\FrameSep
  \vbox{\nobreak \vskip -0.7\FrameSep
    \rlap{\strut#1}\nobreak\nointerlineskip
    \vskip 0.7\FrameSep
    \noindent\fbox{#2}}}
\newenvironment{titledframe}[2][\FrameFirst@Lab\ (cont.)]{%
  \def\FrameFirst@Lab{\textbf{#2}}%
  \def\FrameCont@Lab{\textbf{#1}}%
  \def\FrameCommand##1{\TitleFrame{\FrameFirst@Lab}{##1}}
  \def\FirstFrameCommand##1{\TitleFrame{\FrameFirst@Lab}{##1}}
  \def\MidFrameCommand##1{\TitleFrame{\FrameCont@Lab}{##1}}
  \def\LastFrameCommand##1{\TitleFrame{\FrameCont@Lab}{##1}}
  \MakeFramed{\hsize\textwidth
              \advance\hsize -2\FrameRule
              \advance\hsize -2\FrameSep
              \FrameRestore}}%
  {\endMakeFramed}
