---
title:
author:
date:
lang: it-IT
geometry: margin=2.5cm
toc: true
toc-depth: 2
numbersections: true
secnumdepth: 3
header-includes: |
    \usepackage{fancyhdr}
    \pagestyle{fancy}

    \usepackage{titling}
    \setlength{\droptitle}{-1.5cm}

    \usepackage{graphicx}
    \usepackage{tikz}
    \usetikzlibrary{positioning}
    \usetikzlibrary{intersections}

    \usepackage{tcolorbox}
    \usepackage{caption}
    \usepackage{cancel}

    \usepackage{pgfplots}
    \pgfplotsset{compat=1.17}
    \usepgfplotslibrary{statistics}
    \usepgfplotslibrary{groupplots}
    \usepgfplotslibrary{fillbetween}

    \usepackage{mdframed}
    \usepackage{xcolor}
    
    \usepackage[utf8]{inputenc}
    \usepackage[T1]{fontenc}
    \usepackage{multirow}
    \usepackage{booktabs}

    \usepackage[bottom]{footmisc}
    \setlength{\footnotesep}{3mm}
---

```{=latex}
\newcommand{\floor}[1]{\lfloor #1 \rfloor}
\newcommand{\ceil}[1]{\lceil #1 \rceil}
\newcommand{\roundp}[1]{\left( #1 \right)}
\newcommand{\squarep}[1]{\left[ #1 \right]}
\newcommand{\bracketp}[1]{\left\{ #1 \right\}}
\newcommand{\sube}[1]{\subseteq #1}

\newcommand{\shortunderscore}{\kern0.1em\raisebox{-0.2ex}{\rule[0pt]{0.5em}{0.7pt}}\kern0.1em}

\graphicspath{ {./stat_appunti_img} } % directory immagini
\counterwithin{figure}{section} % numerazione figure reinizializzata a ogni sezione

\let\originAlParaGraph\paragraph % a capo con titoli h4
\renewcommand{\paragraph}[1]{\originAlParaGraph{#1} \hfill}

\definecolor{mygray}{HTML}{F7F7F7}
\newenvironment{myquote}{\begin{mdframed}[backgroundcolor=mygray, leftmargin=0.5cm, rightmargin=0.5cm, skipabove=\baselineskip, linewidth=0pt, innertopmargin=0.45cm, innerbottommargin=0.45cm, innerleftmargin=0.5cm, innerrightmargin=0.5cm]}{\end{mdframed}}
\renewenvironment{quote}{\begin{myquote}}{\end{myquote}}
```



\newpage
\part{Teoria della misura}
Si introducono gli elementi fondamentali di teoria della misura, quali $\sigma$-algebra, misura, spazio misurabile e spazio di misura.

# $\sigma$-algebra
Sia $X$ un generico insieme e sia $\mathcal{P}(X)$ l'insieme delle parti di $X$.

Algebra
: Un'algebra $\mathcal{A}$ su $X$ è un sottoinsieme non vuoto di $\mathcal{P}(X)$ tale che:

1. $X \in \mathcal{A}$: l'insieme totale appartiene all'algebra
2. $\forall A \in \mathcal{A} \;\Rightarrow\; A^c \in \mathcal{A}$: chiusura rispetto al complemento
3. $\forall A, B \in \mathcal{A} \;\Rightarrow\; A \cup B \in \mathcal{A}$: chiusura rispetto all'unione

\hfill
$\sigma$-algebra
: Un'algebra $\mathcal{A}$ su $X$ è una $\sigma$-algebra se soddisfa la seguente condizione:

$$
\forall \{A_i\}_{i \in \mathbb{N}} \subseteq \mathcal{A} \quad\Rightarrow\quad \bigcup_{i=1}^{\infty} A_i \in \mathcal{A}
$$

Una $\sigma$-algebra è dunque un sottoinsieme di $\mathcal{P}(X)$ che contiene $X$ ed è chiuso rispetto all'unione numerabile e al complementare. Ne deriva che $\mathcal{A}$ contiene $\varnothing$ e che è chiusa anche rispetto all'unione finita e all'intersezione numerabile (e finita): ciò è dimostrabile utilizzando le proprietà di De Morgan.

\hfill 
Definizione
: Gli elementi di una $\sigma$-algebra $\mathcal{A}$ in $X$ si dicono insiemi misurabili e la coppia $(X, \mathcal{A})$ si dice spazio misurabile.

La $\sigma$-algebra $\mathcal{A}$ individua i sottoinsiemi di $X$ che possono essere misurati, ossia quelli a cui sarà possibile associare una misura. Lo spazio misurabile è dunque la struttura formata dall'insieme $X$ e dalla famiglia $\mathcal{A}$ di sottoinsiemi ammessi.

\hfill
L'intersezione di tutte le $\sigma$-algebra in $X$ contenenti un sottoinsieme $\mathcal{K}$ di $\mathcal{P}(X)$ è una $\sigma$-algebra e si dice generata da $\mathcal{K}$.

Definizione
: La $\sigma$-algebra generata da tutti gli insiemi aperti in $X$ si dice $\sigma$-algebra di Borel e si indica con $\mathcal{B}(X)$. Gli elementi di $\mathcal{B}(X)$ si dicono insiemi di Borel o boreliani.

In particolare, se si considera $\mathbb{R}$, allora $\mathcal{B}(\mathbb{R})$ è la $\sigma$-algebra generata da tutti gli intervalli aperti $(a, b)$ con $a < b$ e $a, b \in \mathbb{R}$ (o equivalentemente $[a,b)$, $(a, +\infty)$ o $(-\infty, a]$). Ovvero, $\mathcal{B}(\mathbb{R})$ è la più piccola $\sigma$-algebra in $\mathbb{R}$ contenente tutti gli intervalli aperti.

- In probabilità tutti gli insiemi di interesse sono boreliani, che vengono utilizzati inoltre per definire le funzioni misurabili, come per esempio le variabili aleatorie.contenente tutti gli intervalli aperti di $\mathbb{R}$. 

\newpage
# Misura
Prima di definire la misura, è necessario prima chiarire cosa si intende quando si parla di funzioni additive, $\sigma$-additive e $\sigma$-subadditive.

\hfill
Definizione
: Sia $\mathcal{A}$ un'algebra sull'insieme $X$ e sia $\mu: \mathcal{A} \to [0, \infty]$ una funzione tale per cui $\mu(\varnothing) = 0$. Si dice che $\mu$ è:

1. additiva, se per ogni famiglia finita $A_1, \dots, A_n \in \mathcal{A}$ di insiemi disgiunti si ha che
$$
\mu\left(\bigcup_{i=1}^n A_i\right) = \sum_{i=1}^n \mu(A_i)
$$
2. $\sigma$-additiva, se per ogni successione di insiemi disgiunti $\{A_i\}_{i \in \mathbb{N}} \subseteq \mathcal{A}$ tale che $\cup_{i=1}^{\infty} A_i \in \mathcal{A}$ (ossia $\mathcal{A}$ è una $\sigma$-algebra) si ha che
$$
\mu\left(\bigcup_{i=1}^{\infty} A_i\right) = \sum_{i=1}^{\infty} \mu(A_i)
$$
3. $\sigma$-subadditiva, se per ogni successione di insiemi disgiunti $\{A_i\}_{i \in \mathbb{N}} \subseteq \mathcal{A}$ tale che $\cup_{i=1}^{\infty} A_i \in \mathcal{A}$ si ha che
$$
\mu\left(\bigcup_{i=1}^{\infty} A_i\right) \leq \sum_{i=1}^{\infty} \mu(A_i)
$$

Si può dimostrare che una funzione $\sigma$-additiva $\mu$ su $\mathcal{A}$ è anche additiva e $\sigma$-subadditiva.

\hfill
Misura
: Sia $\mathcal{A}$ una $\sigma$-algebra sull'insieme $X$, si dice *misura* una funzione $\sigma$-additiva $\mu: \mathcal{A} \to [0, \infty]$ tale che $\mu(\varnothing) = 0$. La terna $(X, \mathcal{A}, \mu)$ si dice spazio di misura.

Ne deriva che una misura sia anche additiva e $\sigma$-subadditiva.

\hfill
Si nota che una misura è una funzione monotona, ovvero:

Proposizione
: Sia $(X, \mathcal{A}, \mu)$ uno spazio di misura, allora $\forall A, B \in \mathcal{A}$ tali che $A \subseteq B$ si ha che $\mu(A) \leq \mu(B)$.

\hfill
Una misura $\mu$ può essere:

- finita, se $\mu(X) < \infty$
- $\sigma$-finita, se esiste una successione di insiemi misurabili disgiunti $\{A_i\}_{i \in \mathbb{N}} \subset \mathcal{A}$ tale che $\cup_{i=1}^{\infty} A_i = X$ e $\mu(A_i) < \infty \;\; \forall i \in \mathbb{N}$

Una misura $\mu$ si dice completa se $\forall A \in \mathcal{A}$ tale che $\mu(A) = 0$ e $\forall B \subset A$ si ha che $B \in \mathcal{A}$ e $\mu(B) = 0$.

Infine, una misura $\mu$ si dice che è concentrata sull'insieme $A \in \mathcal{A}$ se $\mu(A^c) = 0$. Questo insieme è detto *supporto* di $\mu$.

\hfill
Sia $(X, \mathcal{A}, \mu)$ uno spazio di misura. Si può considerare per ogni sottoinsieme $A \in \mathcal{A}$ la restrizione della misura $\mu$ al sottoinsieme $A$, ovvero la funzione $\mu_A (B) = \mu(A \cap B) \;\; \forall B \in \mathcal{A}$. Si può dimostrare che $\mu_A$ è una misura su $(A, \mathcal{A}_A)$, dove $\mathcal{A}_A = \{B \in \mathcal{A} : B \subseteq A\}$ è la $\sigma$-algebra generata da $A$.


\hfill
Sia $(X, \mathcal{A})$ uno spazio misurabile tale che $\{x\} \in \mathcal{A} \;\; \forall x \in X$. Una misura finita o $\sigma$-finita $\mu$ su $(X, \mathcal{A})$ è:

- continua se $\mu(\{x\}) = 0 \;\; \forall x \in X$
- discreta se esiste un sottoinsieme numerabile $D \sube X$ tale che $\mu(D^c) = 0$, ovvero $\mu$ è concentrata su $D$.


\newpage
# Spazio di probabilità
Con le nozioni di misura e spazio misurabile, si possono introdurre i concetti fondamentali della teoria della probabilità.

Misura di probabilità
: Dato un insieme $\Omega$ e una $\sigma$-algebra $\mathcal{F}$ su $\Omega$, si dice misura di probabilità una misura $\mathbb{P}$ tale che $\mathbb{P}(\Omega) = 1$. Per definizione questa misura rispetta gli assiomi di Kolmogorov.

    \vspace{-1mm}
    La terna $(\Omega, \mathcal{F}, \mathbb{P})$ si dice spazio di probabilità.

Le proprietà della $\sigma$-algebra $\mathcal{F}$ garantiscono che l'unione e l'intersezione, finite o numerabili, e il complementare di eventi siano ancora degli eventi.









