% thesis.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025/07/14 Custom ETH-style Thesis Class]

%----------------------------------------------------------
% Base class
%----------------------------------------------------------
\LoadClass[a4paper,10pt,twoside,openright,extrafontsizes]{memoir}

%----------------------------------------------------------
% Encoding & language
%----------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[french,ngerman,english]{babel}
% Ensure Utopia font and small caps support
\RequirePackage{fourier-otf}

%----------------------------------------------------------
% Fonts
%----------------------------------------------------------
\usepackage{helvet}
\usepackage{fontspec}
\setmainfont{Optima}
\renewcommand{\rmdefault}{utopia}
\renewcommand{\sfdefault}{phv}
\renewcommand*\familydefault{\rmdefault}
\newfontfamily\chapnumfontsf{Futura}
\newfontfamily\chapterNumberFont{Futura}
\newfontfamily\chaptitleoptima{Optima}

%----------------------------------------------------------
% Colors
%----------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{grey}{HTML}{4D4D4D}
\definecolor{plot_grey}{HTML}{4D4D4D}
\definecolor{plot_blue}{HTML}{0066CC}
\definecolor{plot_red}{HTML}{FF3300}
\definecolor{plot_orange}{HTML}{FF6600}
\definecolor{plot_yellowbrown}{HTML}{FFCC00}
\definecolor{dark_blue}{HTML}{1b4f72}

%----------------------------------------------------------
% Packages (grouped)
%----------------------------------------------------------
\RequirePackage{microtype,geometry,float,adjustbox}
\RequirePackage{graphicx,subcaption,tikz}
\RequirePackage{dashrule,booktabs,longtable,pdflscape}
\RequirePackage{afterpage,enumitem,fancyvrb}
\RequirePackage{amsmath,leftidx,siunitx}
\RequirePackage{csvsimple,diagbox,import}
\RequirePackage{subfiles}
\RequirePackage{bookmark,hyperref}
\RequirePackage{etoolbox}

%----------------------------------------------------------
% Summay spacing using memoir’s own commands
%----------------------------------------------------------
\newenvironment{summaryspacing}{%
  \begingroup
    \SingleSpacing  % switch to single spacing
}{%
  \endgroup
}

%----------------------------------------------------------
% Hyperref setup
%----------------------------------------------------------
\hypersetup{pdfauthor={Your Name},pdftitle={Your Thesis Title}}

%----------------------------------------------------------
% Chapter style
%----------------------------------------------------------
\makechapterstyle{fancyblock}{%
  \setlength{\beforechapskip}{1em}
  \setlength{\midchapskip}{0.5em}
  \setlength{\afterchapskip}{0.3em}

  \renewcommand{\chapnamefont}{}
  \renewcommand{\chapnumfont}{%
    \chapnumfontsf\color{dark_blue!60}\fontsize{60}{60}\selectfont%
  }
  \renewcommand{\chaptitlefont}{%
    \chaptitleoptima\LARGE\scshape\MakeUppercase%
  }
  \renewcommand{\printchaptername}{}
  \renewcommand{\printchapternum}{%
    \hfill\makebox[0pt][r]{\chapnumfont\thechapter}%
    \vspace*{-4em}%
  }
  \renewcommand{\afterchapternum}{\par}
  \renewcommand{\printchaptertitle}[1]{%
    \begin{flushleft}%
      \chaptitlefont ##1\\[0.5ex]
      \rule{\textwidth}{0.4pt}%
    \end{flushleft}%
  }
}
\chapterstyle{fancyblock}

%----------------------------------------------------------
% Section titles
%----------------------------------------------------------
\setsecheadstyle{\large\chaptitleoptima}
\setsubsecheadstyle{\normalsize\chaptitleoptima}
\setparaheadstyle{\bfseries\normalsize\chaptitleoptima}
\setbeforesecskip{3ex}
\setaftersecskip{0.01ex} 

%----------------------------------------------------------
% Captions
%----------------------------------------------------------
\RequirePackage[font=small,labelfont={sc,bf},labelsep=quad]{caption}
\setlength{\captionmargin}{5pt}
\setlength{\intextsep}{30pt plus 1.0pt minus 2.0pt}

%----------------------------------------------------------
% Spacing & layout
%----------------------------------------------------------
\linespread{1.6}
\feetatbottom
\setlength{\footmarkwidth}{1em}
\setlength{\footmarksep}{0em}
\setlength{\parskip}{4pt}
\setlength{\parindent}{0cm}
\setcounter{LTchunksize}{50}

%----------------------------------------------------------
% Math operators
%----------------------------------------------------------
\DeclareMathOperator{\YFP}{YFP}
\DeclareMathOperator{\OD}{OD}
\DeclareMathOperator{\s}{s}
\DeclareMathOperator{\logit}{logit}

%----------------------------------------------------------
% Autoref labels
%----------------------------------------------------------
\addto\extrasenglish{%
  \def\chapterautorefname{\textsc{Chapter}}%
  \def\sectionautorefname{\textsc{Section}}%
  \def\subsectionautorefname{\textsc{Section}}%
  \def\subsubsectionautorefname{\textsc{Section}}%
  \def\figureautorefname{\textsc{Fig.}}%
  \def\figurename{\textsc{Fig.}}%
  \def\tableautorefname{\textsc{Table}}%
  \def\tablerefname{\textsc{Table}}%
  \def\appendixautorefname{\textsc{Appendix}}%
}

%----------------------------------------------------------
% Page styles
%----------------------------------------------------------
\copypagestyle{pst_e}{ruled}
\makeevenhead{pst_e}{\footnotesize\hspace{-3.5em}\scshape\leftmark}{}{}
\makeoddhead{pst_e}{}{}{\footnotesize\scshape\rightmark}
\setlength{\headsep}{30pt}
\setlength{\headheight}{16pt}
\makeevenfoot{pst_e}{\footnotesize\thepage}{}{}
\makeoddfoot{pst_e}{}{}{\footnotesize\thepage}
\aliaspagestyle{plain}{empty}

\makepsmarks{pst_e}{%
  \createmark{chapter}{both}{shownumber}{}{.\ }%
  \createmark{section}{right}{shownumber}{}{.\ }%
  \createplainmark{toc}{both}{\contentsname}%
  \createplainmark{lof}{both}{\listfigurename}%
  \createplainmark{lot}{both}{\listtablename}%
  \createplainmark{bib}{both}{\bibname}%
  \createplainmark{index}{both}{\indexname}%
  \createplainmark{glossary}{both}{\glossaryname}%
}

\copypagestyle{pst_app}{pst_e}
\makepsmarks{pst_app}{%
  \createmark{chapter}{both}{shownumber}{Appendix }{.\ }%
  \createmark{section}{right}{shownumber}{}{.\ }%
}

\copypagestyle{pst_front}{empty}
\makeevenfoot{pst_front}{\footnotesize\thepage}{}{}
\makeoddfoot{pst_front}{}{}{\footnotesize\thepage}

% Auto-switch matter styles
\makeatletter
\pretocmd{\frontmatter}{\pagestyle{pst_front}}{}{}
\pretocmd{\mainmatter}{\pagestyle{pst_e}}{}{}
\pretocmd{\appendix}{\pagestyle{pst_app}}{}{}
\makeatother
%----------------------------------------------------------
% Bibliography (Biber + biblatex)
%----------------------------------------------------------
\RequirePackage[
  backend=biber,
  sorting=none,
  style=numeric-comp,
  maxnames=20,
  giveninits=true
]{biblatex}

\addbibresource{bibliographies/TSPlasmid.bib}
\addbibresource{bibliographies/thesis.bib}

% optional font for bib
\AtBeginBibliography{\scriptsize}

% -------------------------------------------------
%  Environment  compactbib  (needs biblatex loaded)
% -------------------------------------------------
\AtBeginDocument{%
  \defbibenvironment{compactbib}                % <- correct macro
    {%
      \list
        {\printtext[labelnumberwidth]{%
           \printfield{labelprefix}\printfield{labelnumber}}}%
        {%
         % hanging‑indent layout
         \setlength{\labelwidth}{\labelnumberwidth}%
         \setlength{\labelsep}{\biblabelsep}%
         \setlength{\leftmargin}{\dimexpr\labelwidth+\labelsep\relax}%
         % tighter vertical spacing
         \setlength{\itemsep}{0.1\baselineskip}%
         \setlength{\parsep}{0pt}%
         \setlength{\parskip}{0pt}%
         % start of each entry
         \usebibmacro{begentry}}%
    }%
    {\endlist}      % what to do at the end
    {\item\usebibmacro{finentry}} % each \item
}

% -------------------------------------------------
%  Chapter‑level bibliography command
% -------------------------------------------------
\newcommand{\chapterbibliography}{%
  \clearpage
  \section*{Bibliography}%
  \printbibliography[heading=none,env=compactbib]%
}
