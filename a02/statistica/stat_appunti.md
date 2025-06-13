---
title: Statistica e analisi dei dati
author: Kevin Muka
date: a.a 2024-2025
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
    \setlength{\droptitle}{-0cm}

    \usepackage{graphicx}
    \usepackage{tikz, pgfplots}
    \pgfplotsset{compat=newest}

    \usetikzlibrary{positioning}
    \usetikzlibrary{intersections}
    \usetikzlibrary{patterns}
    \usetikzlibrary{patterns.meta}

    \usepgfplotslibrary{statistics}
    \usepgfplotslibrary{groupplots}
    \usepgfplotslibrary{fillbetween}

    \usepackage{tcolorbox}
    \usepackage{caption}
    \usepackage{cancel}

    \usepackage{mdframed}
    \usepackage{xcolor}
    
    \usepackage[utf8]{inputenc}
    \usepackage[T1]{fontenc}
    \usepackage{multirow}
    \usepackage{booktabs}

    \usepackage[bottom]{footmisc}
    \setlength{\footnotesep}{3mm}

    \pgfplotsset{
        pmfaxis/.style={
            width=6.5cm, height=4.8cm,
            axis lines=left, axis line style={-stealth},
            xmin=-0.25, xmax=1.25, ymin=0, ymax=1.15,
            xtick={0,1}, xticklabels={$0$,$1$},
            tick style={black,thin}, clip=false
        },
        cdfaxis/.style={
            width=6.5cm, height=4.8cm,
            axis lines=left, axis line style={-stealth},
            xmin=-0.25, xmax=1.25, ymin=0, ymax=1.15,
            xtick={0,1}, xticklabels={$0$,$1$},
            tick style={black,thin}, clip=false
        }
    }

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
\newenvironment{myquote_smaller}{\begin{mdframed}[backgroundcolor=mygray, leftmargin=0.5cm, rightmargin=0.5cm, skipabove=\baselineskip, linewidth=0pt, innertopmargin=0.35cm, innerbottommargin=0.35cm, innerleftmargin=0.5cm, innerrightmargin=0.5cm]}{\end{mdframed}}

```{=latex}
\newpage
```


# Introduzione alla statistica

## Definizione

Statistica
: La statistica è l'arte di apprendere dai dati. Si occupa della raccolta, della descrizione e dell'analisi dei dati, possibilmente permettendo di trarne delle conclusioni.

A volte un’analisi statistica comincia con un insieme di dati prestabilito, in questo caso la statistica si usa per descrivere, riassumere e analizzare i dati. In altre situazioni i dati non sono ancora disponibili e si può usare la statistica per progettare un esperimento che li generi. Se ne occupa la statistica descrittiva.

Statistica descrittiva
: La statistica descrittiva è la parte della statistica che descrive e riassume i dati.

Una volta che i dati sono stati raccolti e descritti, si vogliono trarre delle conclusioni. Se ne occupa la statistica inferenziale.

Statistica inferenziale
: La statistica inferenziale è la parte della statistica che trae conclusioni sui dati.

La statistica inferenziale si basa sul modello probabilistico che consiste nel fare un insieme di assunzioni sulle probabilità di ottenere un certo valore. La statistica inferenziale, quindi, richiede la conoscenza della teoria della probabilità. L’inferenza statistica si basa sull’assunzione che importanti aspetti del fenomeno in analisi si possano rappresentare in termini di probabilità e giunge a conclusioni usando i dati per fare inferenza su queste probabilità.

## Popolazioni e campioni

Nella statistica è cruciale ottenere delle informazioni su tutto un insieme di elementi, che viene definito popolazione. Spesso la popolazione però è troppo numerosa per poter analizzare ciascuno dei suoi membri: in questo caso si sceglie e si esamina un suo sottoinsieme, che viene definito campione.

Popolazione
: Si definisce popolazione l'insieme di tutti gli elementi di interesse.

Campione
: Si definisce campione un sottoinsieme della popolazione, utile quando questa è troppo numerosa.

Affinché il campione ci dia informazioni su tutta la popolazione, esso deve essere rappresentativo di tutta la popolazione. Con rappresentativo si intende che il campione deve essere scelto in modo che tutte le parti della popolazione abbiano uguale probabilità di fare parte del campione. *Il campione deve quindi riflettere la variabilità reale della popolazione.*

Campione casuale
: Un campione di $k$ membri di una popolazione si dice **campione casuale**, o talvolta campione casuale semplice, se i membri sono scelti in modo che tutte le possibili scelte dei $k$ membri siano ugualmente probabili.

Una volta che si sceglie un campione casuale, è possibile usare l'inferenza statistica per giungere a conclusioni sull'intera popolazione studiando gli elementi del campione.

### Campionamento casuale stratificato

Un metodo più sofisticato del campionamento casuale semplice è il campionamento casuale stratificato. Inizialmente si stratifica la popolazione in sottopopolazioni, ognuna delle quali contiene unità simili secondo determinati criteri. In seguito, da ogni strato si estrae casualmente un numero di unità proporzionale alla sua consistenza nella popolazione totale. In questo modo, le proporzioni di ciascuno strato presenti nel campione rispecchiano esattamente quelle dell’intera popolazione.

La stratificazione è particolarmente efficace per conoscere il membro *medio* della popolazione totale quando ci sono differenze tra le sottopopolazioni rispetto alla questione studiata.



```{=latex}
\part{Statistica descrittiva}
```

# Descrivere insiemi di dati

## Dati quantitativi e qualitativi

Una distinzione che si può fare sui dati osservabili riguarda il modo in cui questi sono misurati:

- dati quantitativi: l'esito della misurazione è una quantità numerica. 
- dati qualitativi: l'esito della misurazione è un'etichetta appartenente a un insieme fissato di etichette. Vengono anche detti categorici o nominali.

##### Classificazione dati qualitativi

I dati qualitativi si distinguono in binari, nominali e ordinali:

- Dati binari o booleani: l’osservazione può assumere soltanto due valori tra loro non confrontabili. Si utilizza "booleani" per evidenziare la presenza o assenza di una proprietà, mentre "binari" per indicare due etichette possibili.
- Dati nominali: non ammettono un confronto d’ordine tra i valori, ma è possibile solo stabilire una relazione di equivalenza.
- Dati ordinali: esiste una relazione d’ordine tra i valori osservabili, e quindi se due valori sono diversi è possibile stabilire quale sia il più piccolo e quale il più grande.

##### Classificazione dei dati quantitativi

I dati quantitativi si distinguono in discreti e continui a seconda dell’insieme di valori che possono assumere:

- Dati discreti: rappresentano variabili che possono assumere un insieme numerabile di valori distinti e separati. Ad ogni valore corrisponde un significato specifico.
- Dati continui: possono teoricamente assumere qualsiasi valore all’interno di un intervallo, anche se nella pratica, per via della memorizzazione digitale, vengono approssimati a una precisione finita.

## Frequenze

##### Frequenza assoluta

La frequenza assoluta di un'osservazione $x$ in un insieme di dati $A = \{x_1, \cdots, x_n \}$ è definita come il numero di volte in cui $x$ compare in $A$.  
Formalmente, se si indica con $f_x$ la frequenza assoluta di $x$, si ha che $f_x = \# \{ j \in \{1,\cdots, n\} \,|\, x_j = x \}$

##### Frequenza relativa

La frequenza relativa consente di esprimere la presenza di ogni valore in termini di proporzione rispetto all'intero campione. Sia $A = \{x_1, \cdots, x_n\}$ un insieme di $n$ dati e sia $f_i$ la frequenza assoluta di un'osservazione $x_i$ in $A$, si definisce la frequenza relativa di $x_i$ il valore $f_i / n$. Si osserva che la somma di tutte le frequenze relative in un campione è sempre pari ad $1$.

#### Frequenze cumulate

Le frequenze cumulate si ottengono quando i valori di una variabile possono essere ordinati. Il procedimento consiste nel disporre i valori in ordine crescente, calcolare le loro frequenze individuali e poi sommarle progressivamente: al primo valore si associa la sua frequenza, al secondo la somma della frequenza del primo e del secondo, al terzo la somma delle frequenze dei primi tre, e così via.

È importante notare che l’ultima frequenza cumulata rappresenta il totale dei casi osservati.  Inoltre, il concetto di frequenza cumulata si applica sia alle frequenze assolute che a quelle relative: nel caso delle frequenze relative, i valori cumulati variano da 0 a 1.

Quando i dati sono numerici o comunque ordinabili, un concetto affine alle frequenze relative cumulate è quello della *funzione cumulativa empirica*, nota anche come funzione di ripartizione empirica. 

Data una serie di osservazioni ${ x_1, \dots, x_n }$, la funzione cumulativa empirica $\hat F: \mathbb R \to [0, 1]$ è definita in modo che per ogni $x \in \mathbb R$ essa assuma il valore pari alla frequenza relativa delle osservazioni minori o uguali a $x$. In altre parole:
$$
\hat F(x) = \frac{\# \{ x_i \leq x \}}{n}
= \frac{1}{n} \sum_{i=1}^n \mathrm I_{(-\infty, x]}(x_i)
$$
dove $\mathrm I_A: \mathbb R \to \{0, 1\}$ è la funzione indicatrice dell’insieme $A$, che restituisce $1$ se l’argomento appartiene ad $A$ e $0$ altrimenti: di conseguenza l’intervallo $(-\infty, x]$ include tutti i valori minori o uguali a $x$. Pertanto, per ogni $x$, $\hat F(x)$ rappresenta la frequenza relativa cumulata del massimo valore osservato che non supera $x$, e il grafico di questa funzione sarà a tratti costanti.
$$
I_A(x) = \begin{cases}
	1 & \text{se } x \in A \\[0.1em]
	0 & \text{se } x \not\in A
\end{cases} \quad \Rightarrow \quad 
I_{(- \infty, x]}(x_i) = \begin{cases}
	1 & \text{se } x_i \in (- \infty, x] \\[0.1em]
	0 & \text{se } x_i \not\in (- \infty, x]
\end{cases} \;\; = 
\;\; \begin{cases}
	1 & \text{se } x_i \le x \\[0.1em]
	0 & \text{se } x_i > x
\end{cases}
$$
*In pratica rappresenta il numero di osservazioni dei miei campioni che sono minori o uguali di una certa $x$, diviso per il numero totale di campioni. La divisione per $n$ è fatta per avere dei valori relativi.*

#### Frequenze congiunte e marginali

Quando si analizza un insieme di osservazioni, può essere particolarmente utile considerare due caratteri contemporaneamente, in modo da verificare se esiste una relazione tra i valori dei due attributi. In questo caso, il concetto di frequenza si adatta contando il numero di occorrenze in cui i due caratteri assumono contemporaneamente determinati valori. Questo conteggio porta alla definizione di *frequenza congiunta assoluta*; se invece si considera la frazione delle osservazioni, si parla di *frequenza congiunta relativa*.

Quando il numero dei possibili valori osservabili per i caratteri non è elevato, è possibile rappresentare visivamente queste frequenze tramite una *tabella delle frequenze congiunte* o *tabella di contingenza*. In tale tabella, le righe sono associate ai valori di uno dei caratteri, mentre le colonne rappresentano i valori del secondo carattere. Gli elementi all’interno della tabella indicano le frequenze congiunte (assolute o relative) per le coppie di valori.

Per facilitare ulteriori analisi, si riportano spesso nelle ultime colonne e nelle ultime righe della tabella le *frequenze marginali*, ottenute sommando rispettivamente i valori per ogni riga e per ogni colonna. Se si desiderano valori relativi, questi totali devono essere normalizzati rispetto al numero complessivo delle osservazioni.



## Grafici

### Simmetria

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Simmetria}
```

Simmetria
: Un insieme di dati si dice simmetrico attorno a un valore $x_0$ se, per ogni scostamento $c$ da $x_0$, la frequenza dei valori $(x_0 - c)$ è uguale a quella dei valori $(x_0 + c)$. In tal caso, il valore $x_0$ si definisce "centro di simmetria" della distribuzione. 

Quasi simmetria
: Se i dati non sono perfettamente simmetrici, ma la distribuzione è comunque "quasi" speculare rispetto a un punto centrale, si parla di quasi simmetria. 

Un modo semplice per rendersi conto se una distribuzione è (quasi) simmetrica è rappresentarla graficamente e osservarne la forma.

### Grafici per la frequenza

Se l'insieme di dati contiene un numero ridotto di valori distinti, lo si può rappresentare con una *tabella delle frequenze*. Questa tabella associa a ciascun valore distinto osservato la sua frequenza assoluta. La somma di tutte le frequenze deve corrispondere al numero totale di osservazioni.  
Data una variabile statistica $X$ che può assumere vari valori, si elencano i valori distinti di $X$ in una colonna e, a fianco di ognuno, la relativa frequenza di occorrenza nel campione.

Per costruire una tabella delle frequenze relative da un insieme di dati, bisogna innanzitutto disporre i valori dei dati in ordine crescente. Si determinano i valori distinti e quante volte ciascuno di essi compaia. Si elencano questi valori distinti affiancati dalla loro frequenza $f$ e dalla loro frequenza relativa $f/n$, dove $n$ è il numero totale di osservazioni nell'insieme di dati.

### Grafici a bastoncini, a barre e poligonali

```{=latex}
\begin{minipage}[c]{0.3\textwidth}
    \centering
    \includegraphics[width=\linewidth]{diagramma-bastoncini.jpg}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.66\textwidth}
    \vspace{-2mm}
    I dati di una tabella di frequenza possono essere rappresentati 
    graficamente in diversi modi. Uno dei più intuitivi è il \textit{grafico 
    a bastoncini}, in cui i valori della variabile statistica sono 
    disposti lungo l’asse orizzontale, mentre le frequenze si riportano 
    sull’asse verticale. Ogni valore viene quindi associato a un semplice 
    segmento che parte dall’asse orizzontale e arriva all’altezza 
    corrispondente alla relativa frequenza.
\end{minipage}

\begin{minipage}[c]{0.3\textwidth}
    \centering
    \includegraphics[width=\linewidth]{diagramma-barre.jpg}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.66\textwidth}
    \vspace{-2.5mm}
    Un secondo tipo di rappresentazione, molto simile concettualmente, 
    è il \textit{grafico a barre}: anche in questo caso i valori si trovano 
    sull’asse orizzontale e le frequenze su quello verticale, ma invece dei 
    singoli segmenti si utilizzano barre di un certo spessore. Ciò permette di 
    mettere in evidenza ciascuna categoria o classe di dati e risulta particolarmente 
    efficace quando si vogliono confrontare categorie di grandezza diversa.
\end{minipage}

\begin{minipage}[c]{0.30\textwidth}
	\centering
 	\includegraphics[width=\linewidth]{diagramma-poligonale.jpg}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.66\textwidth}
 	\vspace{-6mm}
    Infine, esiste il \textit{grafico poligonale}, in cui i valori (sempre disposti
    sull’asse orizzontale) vengono rappresentati da punti, collocati a un’altezza
    proporzionale alla loro frequenza, che vengono poi congiunti da segmenti. In questo modo
    si ottiene una linea spezzata che rende immediata la visualizzazione delle variazioni di
    frequenza da un valore all’altro, permettendo di apprezzare più facilmente tendenze o
    andamenti complessivi.
\end{minipage}
```

### Diagramma ramo-foglia

```{=latex}
\hfill

\begin{minipage}[c]{0.30\textwidth}
    \centering
    \fbox{%
        \begin{minipage}{0.91\textwidth}
            \hspace*{-1.5mm}
            \begin{tabular}{r|l}
                22 & 372 \\
                23 & 512, 688, 941 \\
                24 & 706 \\
                25 & 020, 057, 128, 400, 557\\
                26 & 183, 894, 982 \\
                27 & 671, 711, 744 \\
                28 & 345, 764, 913, 967 \\
            \end{tabular}
        \end{minipage}%
    }
    \vspace{-2mm}
    \captionof*{table}{\small Diagramma a stelo}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.66\textwidth}
    \vspace{-3mm}
    Un modo efficiente di rappresentare un insieme di dati di dimensioni medie consiste nel utilizzare il \textit{diagramma ramo-foglia} (o a stelo). Tale grafico si ottiene dividendo ciascun valore dei dati in due parti, chiamati appunto rami e foglie. \\ \\
    La scelta dei rami dovrebbe essere fatta in modo che il \mbox{diagramma} ramo-foglia che ne risulta sia informativo sui dati. Questi diagrammi sono particolarmente adatti a descrivere insiemi di dati dimensioni ridotte.
\end{minipage}
\vspace{1mm}
```

Fisicamente, questo grafico ha l'aspetto di un istogramma ruotato su un lato, con il vantaggio di contenere tutti i valori dei dati originali in ogni classe. Quando il grafico presenta troppe foglie per ogni riga, si può raddoppiare il numero di rami utilizzando due righe per ogni valore del ramo.

### Diagramma a torta

Se i dati non sono numerici si utilizza un diagramma a torta. Si costruisce usando un cerchio suddiviso in settori, uno per ogni valore distinto dei dati. Dato un valore con frequenza relativa $f/n$, allora l’area del settore corrisponde all'area del cerchio moltiplicata per $f/n$, ovvero un arco con un angolo di $360 \cdot(f /n)$ gradi.

### Diagrammi di Pareto

I diagrammi di Pareto sono grafici a barre ordinati in ordine decrescente di frequenza, ai quali è spesso affiancata una linea che rappresenta la frequenza cumulata. In questo modo, oltre a mostrare il numero di casi per ciascuna categoria, permettono di evidenziare quali categorie contribuiscono maggiormente al totale, facilitando l’individuazione delle cause o delle categorie più rilevanti.

### Istogrammi

Utilizzare i grafici presentati precedentemente è un metodo efficace per descrivere un insieme di dati. Tuttavia alcuni di questi insiemi hanno troppi valori distinti per poter usare questo metodo. 

Raggruppamento dei dati
: In questi casi si suddividono i valori in gruppi, o classi, e poi si rappresenta con un grafico il numero di valori dei dati che cadono in ciascuna classe. Il numero di classi scelte è un compromesso tra:

    1. scegliere poche classi al costo di perdere molte informazioni sui valori effettivi in una classe
    2. scegliere troppe classi, ottendendo frequenze troppo basse all'interno di ciascuna di esse

I valori al bordo di una classe si chiamano *estremi* della classe. Si adotta la convenzione di inclusione a sinistra, che richiede che una classe includa il suo estremo sinistro ma non quello destro.

Una volta suddivisi i dati in classi, si costruisce la tabella delle frequenze (e delle frequenze relative), e da questa si ottiene l’istogramma, un grafico a barre adiacenti che mostra la distribuzione dei dati in ciascuna classe. L’istogramma offre una visione immediata di come i valori si distribuiscono: per esempio, se sono concentrati in un certo intervallo, se ci sono "vuoti" senza osservazioni o se alcuni valori si distaccano notevolmente dagli altri. Pur non contenendo tutte le informazioni dell’insieme di dati originale, la tabella delle frequenze di classe e l’istogramma illustrano le caratteristiche fondamentali della distribuzione, come la simmetria, la dispersione e i possibili estremi isolati.

### Diagramma di dispersione

Insieme di dati a coppie
: Un insieme di dati può consistere in coppie di valori che hanno una relazione di qualche tipo tra di loro. Ne viene che ogni elemento dell'insieme di dati sia costituito da un valore $x$ e da uno $y$.  Si indica con $(x_i, y_i), \; i=1 \dots n\,$ la $i$-esima coppia.

Un metodo per rappresentare un insieme di dati di questo tipo consiste nel considerare ogni elemento della coppia separatamente, producendo istogrammi (o diagrammi ramo-foglia) separati per ciascuno. Così facendo però, nonostante i due grafici ci diano molte informazioni sulle singole variabili (attributi), non si ha nessun tipo di informazione riguardo al rapporto tra queste due variabili.

Per capirne la relazione è necessario considerare i valori accoppiati di ciascun dato simultaneamente. Si possono allora rappresentare questi dati accoppiati in un diagramma rettangolare e bidimensionale, in cui l'asse $x$ rappresenta il valore $x$ dei dati, e l'asse $y$ il valore $y$. Così facendo si ottiene un *diagramma di dispersione*.

Una delle ragioni per cui questo tipo di diagramma è utile consiste nella possibilità di fare previsioni sul valore $y$ di una futura osservazione, noto il valore $x$. Per stimare il valore $y$ a partire da $x$ si cerca, in modo intuitivo, di tracciare una "retta media" che approssimi l’andamento dei punti sul diagramma, ovvero una retta che passi "il più vicino possibile" a tutti i dati.

```{=latex}
\newpage
```

Il diagramma di dispersione, oltre a mostrare il comportamento relativo di due variabili e ad aiutarci nelle previsioni, è utile per riconoscere i *valori anomali* (outlier) che sono i punti che non sembrano seguire il comportamento degli altri. Una volta identificati questi valori, si può decidere quali di essi siano appropriati e quali siano invece causati da errori nella raccolta dei dati.



# Statistiche

Statistica
: Una statistica è una quantità numerica calcolata a partire da un insieme di dati.

## Centralità

Verranno presentate le statistiche che descrivono la tendenza centrale di un insieme di dati, ossia delle statistiche che descrivono il centro di un insieme di dati. Questa proprietà che si può individuare in un insieme di dati è detta *centralità* o posizione.

Esistono tre indici di posizione: media, mediana e moda. In tutti i tre i casi si parla di campionaria, in quanto sono effettuate su dei campioni.



### Media campionaria

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Media campionaria}
```

Si supponga di avere un campione di $n$ dati i cui valori sono $x_1, x_2, \cdots, x_n$. Una statistica per indicare il centro di questo insieme di dati è la media campionaria, definita come la media aritmetica dei valori dati:
$$
\bar{x} = \frac{1}{n} \sum_{i=1}^n x_i = \frac{x_1 + x_2 + \cdots + x_n}{n}
$$
Si osserva che $\bar{x}$ può non corrispondere ad uno dei dati $x_i$ con $1 \le i \le n$ presi in considerazione.

##### Trasformazioni

```{=latex}
\hfill
```

**Traslazione**
Si consideri ancora lo stesso insieme di dati. Se ciascun valore viene incrementato di una costante $b$, allora anche la media campionaria viene incrementata di $b$:
$$
y_i = x_i + b \; \text{ per } i=1, \cdots, n \quad \Rightarrow \quad \bar{y} = \bar{x} + b
$$
dove $\bar{y}$ e $\bar{x}$ sono le medie campionarie risettivamente degli $y_i$ e degli $x_i$. 

Dimostrazione: $\quad \displaystyle\bar{y} = \dfrac{1}{n} \sum_{i=1}^n y_i = \dfrac{1}{n} \sum_{i=1}^n (x_i + b) =
	\underbrace{\dfrac{1}{n} \sum_{i=1}^nx_i}_{\large \bar{x}} ~+~ \underbrace{\dfrac{1}{n} \sum_{i=1}^n b}_{\large \tfrac{1}{n} \cdot\, nb} = \bar{x} + b$

**Scalatura**
Se invece ciascun valore dei dati viene moltiplicato per $a$, lo è anche la media campionaria:
$$
y_i = ax_i \; \text{ per } i=1, \cdots, n \quad \Rightarrow \quad \bar{y} = a\bar{x}
$$

Dimostrazione: $\quad \displaystyle \bar{y} = \dfrac{1}{n} \sum_{i=1}^n y_i = \dfrac{1}{n}\sum_{i=1}^n a x_i = a \dfrac{1}{n} \sum_{i=1}^n x_i = a \bar{x}$

**Combinazione**
Si faccia ora una combinazione delle due trasformazioni precedentemente illustrate:
$$
y_i = ax_i + b \; \text{ per } i=1, \cdots, n \quad \Rightarrow \quad \bar{y} = a\bar{x} + b
$$


Queste tre proprietà derivano dal fatto che tutte queste trasformazioni siano lineari.

```{=latex}
\newpage
```

#### Media pesata

Quando i dati sono disposti in una tabella delle frequenze, la media campionaria può essere espressa come la somma del prodotto dei valori distinti per le loro frequenze, divisi per la dimensione dell'insieme dei dati.

Per verificarlo, si supponga di disporre di una tabella delle frequenze che elenca $k$ valori distinti $x_1, x_2, \cdots, x_k$ con le rispettive frequenze $f_1, f_2, \cdots f_k$. Ne segue che questo insieme di dati è costituito da $n$ osservazioni, dove $n = \sum^k_{i=1} f_i$ e dove il valore $x_i$ compare $f_i$ volte per $i=1,2,\cdots,k$. La media campionaria per questo insieme di dati è:
$$
\bar{x} = \dfrac{x_1 + \cdots + x_1 + x_2 + \cdots + x_2 + \cdots + x_k + \cdots + x_k}{n} 	= \dfrac{f_1 x_1 + f_2 x_2 + \cdots + f_k x_k}{n} \tag{3.1}
$$
Ora, se $w_1, w_2, \cdots, w_k$ sono numeri non negativi la cui somma è $1$, allora
$$
w_1 x_1 + w_2 x_2 + \cdots + w_k x_k
$$
prende il nome di *media pesata* dei valori $x_1, x_2, \cdots, x_k$ dove $w_i$ è il peso di $x_i$.

Scrivendo l'equazione $(3.1)$ come
$$
\bar{x} = \dfrac{f_1}{n}x_1 + \dfrac{f_2}{n}x_2 + \cdots + \dfrac{f_k}{n}x_k\,
$$
possiamo vedere che la media campionaria $\bar{x}$ è la media pesata dell'insieme dei valori distinti. Il peso assegnato al valore $x_i$ è $f_i/n$, ossia rappresenta la frazione di volte in cui il valore $x_i$ comare nell'insieme dei dati.

#### Scarti

Si supponga che l'insieme di dati sia costituito dagli $n$ valori $x_1, \cdots, x_n$ e che $\bar{x} = \sum^n_{i=1} x_i / n$ sia la media campionaria. Le differenze tra ciascun valore dei dati e la media campionaria si chiamano *scarti*.
Il valore dell'$i$-esimo scarto è $x_i - \bar{x}$.

La somma di tutti gli scarti è sempre $0$, ovvero:
$$
\sum^n_{i=1} (x_i - \bar{x}) = \sum^n_{i=1} x_i - \sum^n_{i=1} \bar{x} = n \bar{x} - n \bar{x} = 0
$$
Questa uguaglianza afferma che la somma degli scarti positivi della media campionaria controbilancia esattamente la somma degli scarti negativi.

*Utilizzando un linguaggio fisico, questo significa che se $n$ pesi dotati della stessa massa vengono posti su un'asta nei punti* $x_i$ *con* $i=1, \cdots, n$, *allora* $\bar{x}$ *è il punto in cui l'asta può essere messa in equilibrio. Questo punto di equilibrio si chiama centro di gravità.*



### Mediana campionaria

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Mediana campionaria}
```

La media campionaria presenta un forte punto debole come indicatore del centro di un insieme di dati: il suo valore è infatti ampliamente influenzato da eventuali valori estremi (valori fuori scala).

Si dispongano i valori dei dati in ordine crescente. Se il numero di valori è dispari, allora la mediana campionaria è il valore intermedio della lista ordinata; se è pari, allora la mediana campionaria è la media dei due valori intermedi.

Sia $x_{(i)}$ l'$i$-esimo dato del campione ordinato in maniera crescente, la mediana $m$ è definita come:
$$
m = \begin{cases}
x_{\left( \tfrac{n+1}{2} \right)} & \text{per } n \text{ dispari} \\
\left( x_{\left( \tfrac{n}{2} \right)} +  x_{\left( \tfrac{n}{2} + 1 \right)} \right) / 2 & \text{per } n \text{ pari}
\end{cases}
$$
```{=latex}
\newpage
```

La media campionaria e la mediana campionaria sono due statistiche utili per descrivere la tendenza centrale di un insieme di dati. Il loro utilizzo è però molto diverso, in quanto la media campionaria (essendo una media aritmetica) prende in considerazione tutti i valori dell'insieme di dati, mentre invece la mediana campionaria, dato che considera solo uno o due valori centrali, non è influenzata dai valori estremi.

Per gli insiemi di dati che sono approssimativamente simmetrici rispetto ai valori centrali, la media campionaria e la mediana campionaria sono vicine. Entrambe le statistiche sono informative, e il loro utilizzo dipende dal contesto.

### Percentili campionari

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Percentili campionari}
```

La mediana campionaria è un caso particolare di una statistica nota come $100p$-esimo percentile campionario, dove $p$ indica un qualunque numero $\mathbb{R}$ nell'intervallo $\left[ 0,1 \right]$.

Per poter calcolare il percentile si deve poter definire un ordinamento sulle osservazioni.

100$\textbf{\textit{p}}$-esimo percentile campionario

: È un valore maggiore o uguale di almeno $100p$ percento dei valori dati, e minore o uguale di almeno $100(1-p)$ percento dei valori dati. Se due valori dei dati soddisfano questa condizione, allora il $100p$-esimo percentile campionario è la media aritmetica di essi.

La mediana campionaria è il $50$-esimo percentile, ossia è il percentile campionario $100p$ quando $p=0.5$

Supponiamo che i dati di un campione di cardinalità $n$ siano disposti in ordine crescente. Per determinare il  
$100p$-esimo percentile campionario bisogna determinare quale valore sia:

- maggiore o uguale di almeno $np$ valori dei dati
- minore o uguale di almeno $n(p-1)$ valori dei dati

Se $np$ non è un intero, il solo valore dei dati che soddisfa questi requisiti è quello la cui posizione è il più piccolo intero maggiore di $np$.  
Se invece $np$ è un intero, allora sia il valore in posizione $np$ che il valore in posizione $np+1$ soddisfano i due requisti, e quindi il $100p$-esimo percentile campionario è la media dei due valori.

> **Calcolo del 100$\textbf{\textit{p}}$-esimo percentile campionario di un insieme di dati di $\textbf{\textit{n}}$ elementi:**
>
> 1. Si dispongono i dati in ordine crescente
> 2. Se $np$ non è un intero, si determina il più piccolo intero maggiore di $np$. Il valore dei dati in questa posizione è il $100p$-esimo percentile campionario.
> 3. Se $np$ è un intero, allora la media dei valori nelle posizioni $np$ e $np+1$ è il $100p$-esimo percentile campionario.

```{=latex}
\vspace{0.2cm}
```

Il valore $p$ prende il nome di *quantile di livello*, e a seconda dei valori che può assumere si ottengono statistiche diverse. In particolare si definiscono:

- **Decili**: i percentili multipli di $10$, che dividono il campione in $10$ parti uguali
- **Quartili**: i percentili multipli di $25$, che dividono il campione in $4$ parti uguali.

Il $25$-esimo percentile campionario si chiama *primo quartile*. Il $50$-esimo percentile campionario si chiama *mediana* o *secondo quartile*. Il $75$-esimo percentile campionario si chiama *terzo quartile*.

I quartili suddividono i dati in quattro parti in modo tale che il $25\%$ dei dati sia inferiore del primo quartile, il $25\%$ sia compreso tra il primo e il secondo quartile, il $25\%$ tra il secondo e il terzo quartile e il restante $25\%$ sia maggiore del terzo quartile.

```{=latex}
\newpage
```

### Moda campionaria

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Moda campionaria}
```

Un altro indicatore della tendenza centrale è la moda campionaria, che è il valore che si verifica con maggiore frequenza nell'insieme di dati.

Se non esiste un singolo valore che si verifica con più frequenza rispetto agli altri, allora tutti i valori con la frequenza più alta sono detti *valori modali*. In questo caso si dice che non c'è un valore unico della moda campionaria.

Questi valori si vedono facilmente in una tabella delle frequenze; sono infatti i valori con la frequenza più alta.



#### Riepilogo

Si considerino le varie classificazioni degli attributi:

```{=latex}
\begin{tikzpicture}[
    >=stealth,
    thick,
    every node/.style={font=\small, anchor=west} % anchor=west = testo ancorato a sinistra
]

    % Nodo principale
    \node (attrib) at (0,0) {Attributo};

    % Nodi figli
    \node (quant) at (2.5,0.5) {Quantitativo};
    \node (qual)  at (2.5,-0.5) {Qualitativo};

    % Frecce: dal bordo destro di "attrib" al bordo sinistro di "quant" e "qual"
    \draw [->] (attrib.east) -- (quant.west);
    \draw [->] (attrib.east) -- (qual.west);

    % Altri nodi
    \node (ord) at (5.3,0) {Ordinale};
    \node (nom) at (5.3,-1) {Nominale o Categorico};

    % Frecce: dal bordo destro di "qual" al bordo sinistro di "ord" e "nom"
    \draw [->] (qual.east) -- (ord.west);
    \draw [->] (qual.east) -- (nom.west);

\end{tikzpicture}
```

La media si può fare solo per gli attributi quantitativi; la mediana e i percentili si possono svolgere anche sugli attributi qualitativi ordinali con cardinalità del campione dispari; la moda si può fare per qualsiasi tipo di attributo.



```{=latex}
\hfill
```

## Dispersione

Due campioni $A$ e $B$ possono presentare la stessa centralità ma essere molto diversi tra loro. Si considerino:
$$
A:1,2,5,6,6 \qquad B:-40,0,5,20,35
$$
Entrambi i campioni hanno la stessa media campionaria e la stessa mediana campionaria, però i valori contenuti nell'insieme $B$ sono decisamente più sparsi di quelli nell'insieme $A$.

Un modo per misurare la dispersione dei dati è considerare gli scarti dei valori dei dati rispetto ad un valore centrale. Il valore centrale più usato per questo scopo è proprio la media campionaria. Se i valori dei dati sono $x_1, \cdots, n_n$ e la media campionaria è $\bar{x} = \sum^n_{i=1} x_i /n,$ allora lo scarto del valore $x_i$ dalla media campionaria è $x_i - \bar{x}$ con $i = 1, \cdots, n.$

Si potrebbe pensare di misurare la dispersione totale di un insieme di dati calcolando la media aritmetica degli scarti dalla media. Tuttavia, come abbiamo osservato precedentemente, $\sum^n_{i=1}(x_i - \bar{x}) = 0$; questo significa che la somma degli scarti rispetto alla media campionaria è sempre uguale a $0$, e di conseguenza lo è anche la media aritmetica degli scarti.

Questo avviene proprio perché gli scarti positivi e negativi si cancellano tra di loro. Si vogliono quindi considerare i singoli scarti indipendentemente dal segno. Si può ottenere questo risultato sia considerando il valore assoluto degli scarti che, come risulta più utile in pratica, il quadrato.

\newpage

### Varianza campionaria

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Varianza campionaria}
```

La varianza campionaria è una misura della media degli scarti quadratici rispetto alla media campionaria. Tuttavia, per ragioni tecniche questa "media" divide la somma di $n$ scarti quadratici per $n-1$, piuttosto che per l'usuale valore $n$.

La varianza campionaria si può calcolare solo per attributi quantitativi, e a differenza degli indici di centralità presenta un problema: la sua unità di misura è diversa da quella dei singoli dati del campione.

La varianza campionaria $s^2$ dell'insieme di dati $x_1, \cdots, x_n$ di media $\bar{x} = \left( \sum^n_{i=1} x_i \right) / n$ è definita come
$$
s^2 = \dfrac{\displaystyle \sum^n_{i=1} \left( x_i - \bar{x} \right)^2 }{n-1}
$$
L'identità algebrica che segue è utile per calcolare la varianza campionaria a mano:
$$
\sum_{i=1}^n (x_i - \bar{x})^2 = \sum_{i=1}^n x_i^2 \;-\; n\,\bar{x}^2 \tag{3.2}
$$

##### Trasformazioni

```{=latex}
\hfill
```

**Traslazione**
Si supponga di sommare una costante $b$ a ciascuno dei valori $x_1,\cdots, x_n$ per ottenere un nuovo insieme di dati, la varianza campionaria non cambia:
$$
y_i = x_i + b \; \text{ per } i=1, \cdots, n \quad \Rightarrow \quad s^2_y = s^2_x
$$
Si ricordi che $\bar{y} = \bar{x} + b$ e quindi $y_i - \bar{y} = x_i + b - (\bar{x} + b) = x_i - \bar{x}$. Questo significa che gli scarti di $y$ sono uguali agli scarti di $x$, e quindi anche le somme dei quadrati sono uguali.

La varianza campionaria quindi non cambia se sommiamo una costante a ciascun valore. *Questa proprietà può essere utilizzata insieme all'identità algebrica $(3.2)$ per semplificare il calcolo della varianza campionaria.*

**Scalatura**
Se ciascun valore dei dati viene moltiplicato per $a$, la varianza campionaria viene moltiplicata per il quadrato di $a$:
$$
y_i = ax_i \; \text{ per } i=1, \cdots, n \quad \Rightarrow \quad s^2_y = a^2 s^2_x
$$
Dimostrazione: $\quad \displaystyle s^2_y = \dfrac{1}{n-1} \sum^n_{i=1} (y_i - \bar{y})^2 = \dfrac{1}{n-1} \sum^n_{i=1} \left[ a(x_i - \bar{x}) \right]^2 = a^2 \dfrac{1}{n-1} \sum^n_{i=1} (x_i - \bar{x}) = a^2 s^2_x$

**Combinazione**
Si faccia ora una combinazione delle due trasformazioni precedentemente illustrate:
$$
y_i = ax_i + b \; \text{ per } i=1, \cdots, n \quad \Rightarrow \quad s^2_y = a^2 s^2_x
$$



### Deviazione standard campionaria

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Deviazione standard campionaria}
```

La radice quadrata positiva della varianza campionaria si dice deviazione standard campionaria, e si indica con $s$. Questa è definita come
$$
s = \sqrt{\dfrac{\displaystyle \sum^n_{i=1} \left( x_i - \bar{x} \right)^2 }{n-1}}
$$
La deviazione standard campionaria, a differenza della varianza campionaria, è espressa nella stessa unità di misura dei dati originali.

```{=latex}
\newpage
```

##### Trasformazioni

```{=latex}
\hfill
```

**Traslazione**
Si supponga di sommare una costante $b$ a ciascuno dei valori $x_1,\cdots, x_n$ per ottenere un nuovo insieme di dati, la deviazione standard campionaria non cambia:
$$
y_i = x_i + b \; \text{ per } i=1, \cdots, n \quad \Rightarrow \quad s_y = s_x
$$
**Scalatura**
Se ciascun valore dei dati viene moltiplicato per $a$, si ottiene che $s^2_y = a^2 s^2_x$. Calcolando la radice quadrata di entrambi i membri dell'uguaglianza si ottiene che la deviazione standard dei valori $y$ è uguale al valore assoluto di $a$ moltiplicato per la deviazione standard dei valori in $x$:
$$
y_i = ax_i + b \; \text{ per } i=1, \cdots, n \quad \Rightarrow \quad s_y = \left| a \right| s_x
$$
**Combinazione**
Si faccia ora una combinazione delle due trasformazioni precedentemente illustrate:
$$
y_i = ax_i + b \; \text{ per } i=1, \cdots, n \quad \Rightarrow \quad s_y = \left| a \right| s_x
$$



La varianza campionaria e la deviazione standard campionaria sono due indici di dispersione che derivano dalla media campionaria.

Due altri indicatori della dispersione di un insieme di dati frequentemente utilizzati sono l'**intervallo di variazione**, ossia la differenza fra il più grande e il più piccolo valore, e lo **scarto interquartile**.

### Scarto interquartile

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Scarto interquartile}
```

Lo scarto interquartile è un indice di dispersione che deriva dalla mediana campionaria, e rappresenta la lunghezza dell'intervallo in cui si trova la metà centrale dei dati. Richiamando i quartili, possiamo dire che si tratta della lunghezza dell'intervallo compreso tra il primo quartile $Q1$ e il terzo quartile $Q3$.

Un $\text{IQR}$ piccolo indica che la metà centrale dei dati è relativamente concentrato attorno alla mediana, mentre un $\text{IQR}$ ampio suggerisce una maggiore dispersione nella parte centrale della distribuzione.

Come la mediana campionaria, l'$\text{IQR}$ è un indice robusto perché non è influenzato da valori fuori scala. Questo lo rende particolarmente utile quando la distribuzione dei dati è asimmetrica o contiene anomalie.

Questo indice è fondamentale per la costruzione dei boxplot perché viene proprio utilizzato per definire quali valori siano fuori scala e quali no. Generalmente, i valori inferiori a $Q1 - 1.5 \cdot \text{IQR}$ o superiori a $Q3 + 1.5 \cdot \text{IQR}$ sono considerati outlier.



```{=latex}
\hfill
```

## Indici di correlazione

Si consideri un insieme composto da dati accoppiati $(x_1,y_1),(x_2, y_2), \dots, (x_n, y_n)$. Per vedere la relazione relativa di queste due variabili è possibile rappresentarle in un diagramma di dispersione. Questo approccio è però qualitativo, e quindi soggetto a interpretazione.  
Si vuole trovare un indice quantitativo in grado di rappresentare questa relazione oggettivamente. Questi indici sono detti di dipendenza o associazione e misurano la forza della relazione, ossia forniscono un valore numerico che indica quanto intensamente le variabili siano collegate.

### Covarianza campionaria

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Covarianza campionaria}
```

Si introduce una statistica, detta *covarianza campionaria*, che quantifica in che misura grandi valori di $x$ corrispondano a grandi valori di $y$ e piccoli valori di $x$ a piccoli valori di $y$. Questo indice quindi misura la tendenza con cui due variabili si muovono insieme ed è definita come la media dei prodotti degli scostamenti delle variabili dalle loro medie.

```{=latex}
\vspace{-2mm}
```

##### Relazione tendenziale

Si procede considerando una relazione di tipo tendenziale e non deterministico. Ciò significa che le affermazioni che seguiranno varranno tendenzialmente sempre: ci saranno quindi delle eccezioni, ma per lo più saranno valide.

Si supponga che un insieme sia costituito dalle coppie di valori $(x_i, y_i) \text{ con } i =1, \cdots, n$. Si calcolino le rispettive medie campionarie $\bar{x}$ e $\bar{y}$. Per la $i$-esima coppia di dati, si considerino $(x_i - \bar{x})$ lo scarto del valore $x$ rispetto alla sua media campionaria e $(y - \bar{y})$ lo scarto del valore $y$ rispetto alla sua media campionaria. Si procede ora analizzando due casi, ossia quello in cui si presenta una relazione diretta e quello con una relazione inversa.

Quando grandi valori di $x$ tendono a essere associati con grandi valori di $y$, e piccoli valori di $x$ tendono a essere associati a piccoli valori di $y$, allora i segni (positivi o negativi) di $(x_i - \bar{x})$ e $(y_i - \bar{y})$ tenderanno a essere gli stessi. A questo punto, se gli scarti hanno segno concorde, il loro prodotto $(x_i - \bar{x})(y_i - \bar{y})$ sarà positivo. Si ottiene che la sommatoria $\sum^n_{i=1} (x_i - \bar{x})(y_i - \bar{y})$ tenderà a essere un grande numero positivo.  

```{=latex}
\begin{small}
\vspace{2mm}
\begin{minipage}[c]{0.31\textwidth}
    \centering
    \includegraphics[width=\linewidth]{rel-diretta.jpg}
\end{minipage}
\hspace{1.5mm}
\begin{minipage}[c]{0.3\textwidth}
    \vspace{0mm}
    \begin{tabular}{ccc}
    x "grande" & e & y "grande" \\
    $x \ge \bar{x}$ &  & $y \ge \bar{y}$ \\
    $(x_i - \bar{x}) \ge 0$ &  & $(y_i - \bar{y}) \ge 0$ \\[2ex]
    \multicolumn{3}{c}{\text{Tendenzialmente:}} \\[1mm]
    \multicolumn{3}{c}{$(x_i - \bar{x})(y_i - \bar{y}) \ge 0$} \\[1mm]
    \multicolumn{3}{c}{$\displaystyle\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y}) > 0$}
    \end{tabular}
\end{minipage}
\begin{minipage}[c]{0.01\textwidth}
    \centering
    \vrule width 0.35pt height 2.85cm
\end{minipage}
\hspace{1mm}
\begin{minipage}[c]{0.3\textwidth}
    \vspace{0mm}
    \begin{tabular}{ccc}
    x "piccolo" & e & y "piccolo" \\
    $x < \bar{x}$ &  & $y < \bar{y}$ \\
    $(x_i - \bar{x}) < 0$ &  & $(y_i - \bar{y}) < 0$ \\[2ex]
    \multicolumn{3}{c}{\text{Tendenzialmente:}} \\[1mm]
    \multicolumn{3}{c}{$(x_i - \bar{x})(y_i - \bar{y}) \ge 0$} \\[1mm]
    \multicolumn{3}{c}{$\displaystyle\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y}) > 0$}
    \end{tabular}
\end{minipage}

\vspace{1mm}
\begin{center}
	\begin{minipage}[c]{0.9\textwidth}
		Si individua quindi una correlazione positiva tra le due variabili poiché tendenzialmente presentano segno concorde. In questo caso si parla di relazione tra le due variabili di tipo diretta.
	\end{minipage}
\end{center}
\vspace{3mm}
\end{small}
```

Per lo stesso motivo, quando grandi valori di una variabile tendono a verificarsi in corrispondenza a piccoli valori dell'altra, allora i segni di $(x_i - \bar{x})$ e $(y_i - \bar{y})$ saranno discordi e quindi la sommatoria $\sum^n_{i=1} (x_i - \bar{x})(y_i - \bar{y})$ tenderà ad essere un grande numero negativo.  

```{=latex}
\begin{small}
\vspace{2.5mm}
\begin{minipage}[c]{0.31\textwidth}
    \centering
    \includegraphics[width=\linewidth]{rel-indiretta.jpg}
\end{minipage}
\hspace{1.5mm}
\begin{minipage}[c]{0.3\textwidth}
    \vspace{0mm}
    \begin{tabular}{ccc}
    x "grande" & e & y "piccola" \\
    $x \ge \bar{x}$ &  & $y < \bar{y}$ \\
    $(x_i - \bar{x}) \ge 0$ &  & $(y_i - \bar{y}) < 0$ \\[2ex]
    \multicolumn{3}{c}{\text{Tendenzialmente:}} \\[1mm]
    \multicolumn{3}{c}{$(x_i - \bar{x})(y_i - \bar{y}) < 0$} \\[1mm]
    \multicolumn{3}{c}{$\displaystyle\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y}) < 0$}
    \end{tabular}
\end{minipage}
\begin{minipage}[c]{0.01\textwidth}
    \centering
    \vrule width 0.35pt height 2.85cm
\end{minipage}
\hspace{1mm}
\begin{minipage}[c]{0.3\textwidth}
    \vspace{0mm}
    \begin{tabular}{ccc}
    x "piccolo" & e & y "grande" \\
    $x < \bar{x}$ &  & $y \ge \bar{y}$ \\
    $(x_i - \bar{x}) < 0$ &  & $(y_i - \bar{y}) \ge 0$ \\[2ex]
    \multicolumn{3}{c}{\text{Tendenzialmente:}} \\[1mm]
    \multicolumn{3}{c}{$(x_i - \bar{x})(y_i - \bar{y}) < 0$} \\[1mm]
    \multicolumn{3}{c}{$\displaystyle\sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y}) < 0$}
    \end{tabular}
\end{minipage}

\vspace{1mm}
\begin{center}
	\begin{minipage}[c]{0.9\textwidth}
		Si individua quindi una correlazione negativa tra le due variabili poiché tendenzialmente presentano segno discorde. In questo caso si parla di relazione tra le due variabili di tipo indiretta.
	\end{minipage}
\end{center}
\vspace{3mm}
\end{small}
```

Si procede poi standardizzando la sommatoria dividendo per $n-1$, al fine di evitare che questo indice assuma valori troppo elevati. Si osserva che la formula della covarianza campionaria è riconducibile a quello della varianza campionaria, motivo per il quale si possa intuire perché si vada a dividere per $n-1$ e non direttamente per il numero totale di osservazioni.

Ricapitolando, si definisce la covarianza campionaria come:
$$
s_{x,y} = \dfrac{1}{n-1} \displaystyle \sum^n_{i=1} (x_i - \bar{x})(y_i - \bar{y}) = 
\begin{cases}
> 0 & \text{relazione diretta} \\
\approx 0 & \text{assenza di relazione / indipendenza} \\
< 0 & \text{relazione indiretta / inversa}
\end{cases}
$$


### Coefficiente di correlazione di Pearson

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Coefficiente di correlazione di Pearson}
```

La covarianza campionaria non può essere posizionata all'interno di una scala assoluta in quanto non è normalizzata e il suo valore dipende dalle osservazioni coinvolte. Si ricava perciò da questo indice il *coefficiente di correlazione lineare campionaria* (anche detto indice di correlazione di Pearson), che si indica con $\rho$.

Presa la covarianza campionaria, si standardizza il suo valore dividendolo per il prodotto delle due deviazioni standard campionarie delle due variabili:
$$
\rho =\dfrac{\displaystyle \sum^n_{i=1} (x_i - \bar{x})(y_i - \bar{y})}{(n-1)s_x s_y}
$$
Il coefficiente di correlazione di Pearson è quindi un numero puro e, proprio come la covarianza campionaria, quando $\rho > 0$ i dati sono correlati positivamente; invece quando $\rho < 0$ sono correlati negativamente.  
Non dipendendo dalle unità di misura, questo indice può essere usato per comparare dataset diversi.

Una proprietà importante, che non verrà dimostrata, è che $-1 \le \rho \le 1$

#### Relazione deterministica

```{=latex}
\vspace{-3mm}
```

##### Primo caso

Si passi da una relazione tendenziale a una deterministica, in cui la variabile $y$ è una trasformazione lineare della variabile $x$; tutti i vari indici statistici variano di conseguenza:
$$
\forall i \;\; y_i = a + b x_i \quad \Rightarrow \quad \bar{y} = a + b \bar{x} \quad \Rightarrow \quad s_y^2 = b^2 s_x^2 \quad \Rightarrow \quad s_y = |\, b\, | s_x
$$
Nella relazione deterministica $y = a + bx$, la costante $b$ rappresenta la pendenza (ossia il coefficiente angolare) della retta che lega le due variabili e indica di quanto varia $y$ all'aumentare di $x$. Ci si aspetta che: 

- se $b$ è positivo, all’aumento di $x$ corrisponde un incremento di $y \Rightarrow$ relazione diretta
- se $b$ è negativo, all’aumento di $x$ corrisponde una diminuzione di $y \Rightarrow$ relazione inversa 

Si calcoli ora il coefficiente di correlazione di Pearson:
$$
\rho = \dfrac{b \sum_{i=1}^n (x_i - \bar{x})^2}{(n-1)\,|\, b \,|\, s_x^2} =
	\dfrac{b}{|\, b \,|} \cdot \dfrac{1}{s_x^2} \dfrac{\sum_{i=1}^n (x_i - \bar{x})^2}{n-1} = \dfrac{b}{|\, b \,|} \cdot \dfrac{1}{\cancel{s_x^2}} \cancel{s_x^2}
	= \dfrac{b}{|\, b \,|} \;\;= \;\;
    \begin{cases}
		+1 & \text{se } b>0 \\
		-1 & \text{se } b < 0
    \end{cases}
$$
Questo significa che:

- l'indice $\rho$ è uguale a $+1$ se $b$ è una costante positiva, e se quindi le due variabili esibiscono una relazione di tipo deterministica diretta.
- l'indice $\rho$ è uguale a $-1$ se $b$ è una costante negativa, e se quindi le due variabili esibiscono una relazione di tipo deterministica indiretta.

Le conclusioni che abbiamo ottenuto con i calcoli rispecchiano le attese iniziali.

##### Secondo caso

Si consideri ora una relazione in cui entrambe le variabili $x$ e $y$ sono soggette a una trasformazione lineare; i vari indici statistici variano nel seguente modo:
$$
\forall i \quad
\begin{aligned}
x'_i &= a + bx_i \quad \Rightarrow \quad \bar{x}' = a + b\bar{x} \quad \Rightarrow \quad s_{x'} = |\, b\,|\, s_x \quad \Rightarrow \quad x'_i - \bar{x}' = b(x_i - \bar{x}) \\
y'_i &= c + dy_i \,\quad \Rightarrow \quad \bar{y}' = c + d\bar{y} \quad \Rightarrow \quad s_{y'} = |\, d\,|\, s_y \quad \Rightarrow \quad y'_i - \bar{y}' = d(y_i - \bar{y})
\end{aligned}
$$
Si procede calcolando il coefficiente di correlazione di Pearson:
$$
\rho' = \dfrac{\sum_{i=1}^n (x'_i - \bar{x}')(y'_i - \bar{y}')}{(n-1) s_x' s_y'} =
	\dfrac{b\, d\, \sum_{i=1}^n (x_i - \bar{x})(y_i - \bar{y})}{(n-1)\, |\,b\,|\, |\,d\,|\, s_x s_y} = 
	\dfrac{b\, d}{|\, b\, |\, |\, d\,|} \rho \;\;=\;\;
    \begin{cases}
		+\rho & \text{se } b \text{ concorda con }d \\
		-\rho & \text{se } b \text{ discorda con }d
    \end{cases}
$$
Ciò significa che la correlazione tra $x'$ e $y'$ rimane numericamente invariata rispetto a quella tra $x$ e $y$ e può eventualmente cambiare solo di segno:

- se i coefficienti di trasformazione $b$ e $d$ hanno lo stesso segno allora $\rho' = \rho$
- se i coefficienti di trasformazione $b$ e $d$ hanno segni opposti allora $\rho' = -\rho$

```{=latex}
\vspace{1mm}
```

#### Conclusioni

Il coefficiente di correlazione di Pearson è un indicatore fondamentale per valutare la forza e la direzione di una relazione (o associazione) di tipo lineare tra due variabili, con valori che spaziano fra $-1$ e $+1$.

Relazione deterministica
: Quando due variabili presentano una relazione lineare deterministica $y = a + bx$, il coefficiente di correlazione assume valore estremo: $\rho = +1$ se $b>0$ e $\rho = -1$ se $b<0$. In altre parole, se tutti i punti giacciono esattamente su una retta crescente (o decrescente), la correlazione è massima (o minima).

Relazione tendenziale
:   Nella maggior parte dei casi reali, le due variabili seguono una relazione lineare tendenziale. In questo contesto, il valore assoluto del coefficiente  di correlazione, $|\rho|$, fornisce una misura di quanto le osservazioni si dispongano in prossimità di una retta:

    - $|\rho|=1$ evidenzia una perfetta relazione lineare: in altre parole, è 
      possibile collegare tutti i valori $(x_i, y_i)$ con $i=1,\cdots,n$ con 
      una retta.
    - Più $|\rho|$ si avvicina a $1$, e più i dati esibiscono una relazione lineare forte, anche se non perfetta: ciò significa che se anche non esiste una retta che attraversa tutti i valori dei dati, ce n'è una che passa vicino a tutti.
    - Se $|\rho|$ è prossimo allo $0$, non c'è evidenza di un legame lineare tra le variabili. 
      
    Il segno di $\rho$ indica invece la direzione della relazione. Il segno è positivo quando l'approssimazione lineare è crescente (diretta), ed è invece negativo quando l'approssimazione lineare è decrescente (inversa).

È importante tenere a mente che un valore di $\rho = 0$ non implica automaticamente l’assenza di qualsiasi relazione, poiché potrebbero esistere legami non lineari che questo indice non è in grado di cogliere.

Vale inoltre la pena sottolineare che il coefficiente di correlazione di Pearson non implica in alcun modo un rapporto di causa-effetto tra le due variabili prese in considerazione. In altre parole, due variabili possono presentare un valore di correlazione elevato senza che una determini o causi l’altra. Spesso, infatti, può intervenire un terzo fattore (o più fattori) a influenzare entrambe le variabili, generando un legame che in realtà non corrisponde a un meccanismo causale diretto.



```{=latex}
\hfill
```

## Eterogeneità

Per le variabili qualitative nominali non è possibile calcolare la varianza né gli indici che ne derivano, perché non esistono una media, una mediana o altri valori numerici di riferimento su cui misurare distanze. Risulta comunque necessario avere un indice che misuri la dispersione della distribuzione delle frequenze, detta *eterogeneità*. In particolare si dice che una variabile è distribuita in modo eterogeneo quando ogni suo valore compare con la stessa frequenza.

### Indice di Gini

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Indice di Gini}
```

Si consideri un campione $\{ x_1, \cdots, x_n\}$ in cui occorrono i valori distinti $v_1, \cdots, v_m$, e si indichi con $f_j$ la frequenza relativa dell'elemento $v_j$ per $j=1, \cdots, m$. Si definisce l'*indice di eterogeneità di Gini* come:
$$
I = 1 - \sum_{j=1}^m f_j^2
$$
Una proprietà importante di questo indice è che $0 \le I < 1$. Inoltre l'omogeneità massima dell'insieme di dati si presenta quando $I = 0$, mentre l'eterogeneità massima la si ha quando $I \to 1$. Di conseguenza, più aumenta il valore dell'indice di Gini e più aumenta il grado di eterogeneità.

```{=latex}
\newpage
```

Per dimostrare le limitazioni inferiori e superiori si ricordi innanzitutto che, trattandosi di frequenze relative, $0 \le f_j \le 1 \;\; \forall j \in \{1,\dots,m\}$. Inoltre $\sum_{j=1}^m f_j = 1$. Di conseguenza si avrà:

- per almeno un $j$ si ha $\displaystyle f_j > 0 \Rightarrow f_j^2 > 0 \Rightarrow \sum_{j=1}^m f_j^2 > 0 \quad \Rightarrow \quad I < 1$
- per ogni $j$, dato che $0 \le f_j \le 1$, si ha che $\displaystyle f_j^2 \le f_j \Rightarrow \sum_{j=1}^m f_j^2 \le \sum_{j=1}^m f_j = 1 \quad \Rightarrow \quad I \ge 0$

Si noti, come accennato precedentemente, che l'estremo inferiore si presenta quando l'insieme è massimamente omogeneo e l'estremo superiore quando è massimamente eterogeneo:

- l'eterogeneità minima la si ha quando tutti gli elementi hanno lo stesso valore, e quindi  
    $\displaystyle \exists\, k \in \left[ 1, m\right]\; |\; f_k = 1, \; \forall j \not = k \;\; f_j = 0 \quad \Rightarrow \quad I = 1 - \sum_{j=1}^m f_j^2 = 1 - f_k^2 = 1 - 1 = 0$
- l'eterogeneità massima la si ha quando tutti gli elementi hanno la stessa frequenza, e quindi  
    $\displaystyle \forall j \in \left[ 1,m \right] \;\; f_j = \frac{1}{m} \quad \Rightarrow \quad I = 1 - \sum_{j=1}^m f_j^2 = 1 - \sum_{j-1}^m \frac{1}{m^2} = 1 - \frac{1}{m} = \frac{m-1}{m} \;\; \to 1 \text{ al crescere di }m$

##### Indice di Gini normalizzato

Si ricordi che $m$ è la cardinalità dell'insieme dei valori distinti. Questo indice presenta due problematiche:

1. il valore massimo che può assumere, ossia quando l'insieme di dati è massimamente eterogeneo, è $(m-1)/m$. Di conseguenza, specialmente nel caso in cui non si conosca il valore $m$, non si può sapere quanto questo indice debba tendere a $1$ affinché si abbia la massima eterogeneità nell'insieme dei dati.
2. il suo valore dipende fortemente dal valore di $m$. Non è quindi possibile confrontare 2 attributi qualitativi che presentano intervalli di valori diversi, ossia $m$ diverso.

Per ovviare a questi problemi si introduce l'*indice di Gini normalizzato*, che si ottiene dividendo l'indice di Gini per il valore massimo $(m-1)/m$ che può assumere:
$$
I' = \dfrac{m \cdot I}{m-1}
$$
Questo indice può assumere anche 1 come valore: $0 \le I' \le 1$. Si consideri infatti il caso in cui l'eterogeneità di un insieme di dati è massima:
$$
I = \dfrac{m-1}{m} \quad \Rightarrow \quad I' = \dfrac{m \cdot I}{m-1} = \dfrac{m \cdot (m-1)}{(m-1) \cdot m} = 1
$$



### Indice di entropia

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Indice di entropia}
```

Si consideri un campione $\{ x_1, \cdots, x_n\}$ in cui occorrono i valori distinti $v_1, \cdots, v_m$, e si indichi con $f_j$ la frequenza relativa dell'elemento $v_j$ per $j=1, \cdots, m$. Si definisce l'*indice di entropia* del campione come:
$$
H = \sum_{j=1}^m f_j \log \dfrac{1}{f_j} = - \sum_{j=1}^m f_j \log f_j
$$

La funzione $I(p) = \log 1/p = - \log p$ è detta *autoinformazione* e misura la quantità di informazione ottenuta dal verificarsi di un evento con probabilità $p$. In altre parole, misura quanto viene ridotta l’incertezza una volta che sappiamo che l’evento si è effettivamente realizzato. Questa funzione è descrescente monotona, vale $0$ quando $p=1$ e tende a infinito per $p$ che tende a 0.

Nel calcolo dell'entropia compare $-f_j \log f_j$. Se $f_j = 0$ questa espressione assume la forma indeterminata $0 \cdot \infty$. È però possibile estendere la definizione dell'entropia anche nei casi in cui alcune frequenze relative siano nulle. Valutando il limite $\displaystyle \lim_{f_j \to 0^+} -f_j \log f_j = 0$ si definisce per convenzione $- 0 \log 0 = 0$. 

```{=latex}
\newpage
```

Si effettuano le seguenti osservazioni:

- $\forall j$ vale $-f_j \log f_j \ge 0 \;\; \Rightarrow \;\; H \ge 0$

- $\forall j$ si ha che $-f_j \log f_j = 0 \;\; \Leftrightarrow \;\; f_j = 0 \lor  \log f_j = 0 \text{ e quindi } f_j =1$. Pertanto $H=0$ se e solo se ci si trova in condizione di massima omogeneità, e quindi tutti i dati del campione assumono lo stesso valore.

- In caso di invece massima eterogeneità si avrà $f_j = 1/m$ e quindi 
    $$
    H = \sum_{j=1}^m \dfrac{1}{m} \log m = m \left(\dfrac{1}{m} \log m \right) =  \log m
    $$
    Si può dimostrare che in questo caso l'entropia assume il valore massimo.

```{=latex}
\vspace{2mm}
```

Una proprietà importante di questo indice è quindi che $0 \le H \le \log m$. Più questo indice cresce, e più aumenta il grado di eterogeneità dell'insieme, viceversa più descresce e più aumenta il grado di omogeneità.

##### Indice di entropia normalizzato

Si definisce l'*indice di entropia normalizzato* come
\vspace{-1mm}
$$
H' = \dfrac{H}{\log m}
$$
I valori di questo indice sono compresi tra $0$ e $1$, infatti nel caso di massima eterogeneità si ha che:
\vspace{-1mm}
$$
H = \log m \quad \Rightarrow \quad H' = \dfrac{\log m}{\log m} = 1
$$
Se il logaritmo è in base $2$ allora l'entropia si misura in bit: ciò risulta utile quando bisogna svolgere i calcoli in un computer; è comunque possibile usare altre basi, come per sempio il logaritmo naturale e quello in base 10.



```{=latex}
\hfill
```

## Concentrazione

Le misure di concentrazione sono strumenti statistici che consentono di comprendere come una determinata risorsa o bene – ad esempio la ricchezza – sia distribuita all’interno di una popolazione. In questo modo, è possibile valutare se tale risorsa sia distribuita in maniera equa tra tutti gli individui oppure se risulti concentrata in un numero ristretto di soggetti.

Mentre la varianza quantifica la dispersione dei singoli valori rispetto alla media, la concentrazione mette in evidenza se una piccola parte della popolazione detiene una quota sproporzionata del bene considerato.

Si consideri un campione di $n$ osservazioni, ciascuno dei quali possiede una certa quantità di risorse. Si indichi con $a_i$ la quantità posseduta dall'$i$-esimo individuo dopo aver ordinato le osservazioni in ordine crescente, ossia $a_1 \le a_2 \le \cdots \le a_n$. Il valore medio della risorsa è definito come $\bar{a} = 1/n \sum_{i=1}^n a_i$, dove la sommatoria rappresenta la somma di tutte le dotazioni individuali. Moltiplicando il valore medio $\bar{a}$ per il numero totale degli individui $n$ otteniamo il totale aggregato della risorsa:

```{=latex}
\vspace{-3.7mm}
```

$$
TOT = n\, \bar{a} = \sum_{i=1}^n a_i
$$
```{=latex}
\vspace{-2.1mm}
```

Qui la somma viene effettuata su tutte le osservazioni $a_1, a_2, \ldots, a_n$, cioè su tutte le dotazioni della risorsa in esame. L'ordinamento in ordine crescente serve per facilitare l'analisi della distribuzione della risorsa fra gli individui (come vedremo dopo per la curva di Lorenz).

Si possono presentare due situazioni estreme:

- caso di concentrazione minima: tutti gli elementi del campione assumono lo stesso valore:  
    $a_1 = a_2 = \cdots = a_n = \bar{a}$
- caso di concentrazione massima: tutti gli elementi del campione assumono valore pari a $0$, tranne uno:  
    $a_1 = a_2 = \cdots = a_{n-1} = 0\,$ e $\,a_n = n\, \bar{a}$

È necessario avere un indice di concentrazione che valga $0$ e $1$ nei casi rispettivamente di concentrazione minima e massima, e che sia negli altri casi un valore crescente in funzione della concentrazione. Si considerino:

- la frequenza relativa cumulata degli individui fino alla $i$-esima osservazione:  
    \vspace{-1mm}
    $$
    F_i = \dfrac{i}{n} \;\; \text{ per } i=1,\cdots,n \qquad \small \text{\% degli inidividui}
    $$

- la quantità relativa cumulata fino all'$i$-esima osservazione:  
    \vspace{-2mm}
    $$
    Q_i = \dfrac{1}{TOT} \sum_{k=1}^i a_k \qquad \text{\small \% della ricchezza}
    $$

Queste due quantità possiedono le seguenti proprietà:

- $0 \le F_i,\, Q_i \le 1$
- $Q_i = F_i\,$ nel caso di concentrazione minima
- $Q_n = F_n = 1$
- $Q_i \le F_i\,$ siccome le osservazioni sono state ordinate in modo crescente.

#### Dimostrazione

Si vuole provare che $Q_i \le F_i$. Pertanto si divide l'insieme ordinato in due sottogruppi, $\{a_1, \cdots, a_i\}$ e $\{a_{i+1}, \cdots, a_n\}$, e si definiscono le rispettive somme $S_i$ e $T_i$:

\qquad $\displaystyle S_i = \sum_{k=1}^i a_k \qquad T_i = \sum_{k=i+1}^n a_k \qquad TOT = S_i + T_i = S_n$

Si cominci riscrivendo la disuguaglianza $Q_i \le F_i$ in termini di $S_i$ e $T_i$. In particolare, si osserva che

\qquad $\displaystyle Q_i = \dfrac{S_i}{TOT} \le \dfrac{i}{n} \;\; \Longleftrightarrow \;\; \dfrac{S_i}{S_i + T_i} \le \dfrac{i}{n}$

Da quest'ultima forma, si vuole isolare da un lato della disequazione $\tfrac{i\, T_i}{S_i}$:

\qquad $\dfrac{S_i}{S_i + T_i} \le \dfrac{i}{n} \;\; \Rightarrow \;\; \dfrac{1}{1+\tfrac{T_i}{S_i}} \le \dfrac{i}{n} \;\; \Rightarrow \;\; 1+\dfrac{T_i}{S_i} \ge \dfrac{n}{i} \;\; \Rightarrow \;\; i \roundp{\dfrac{T_i}{S_i}} \ge i \roundp{\dfrac{n}{i} - 1} \;\; \Rightarrow \;\; \dfrac{i\, T_i}{S_i} \ge n - i$

Si scompone ora il termine $\tfrac{i\, T_i}{S_i}$ come somma sugli elementi $a_k$ con $k > i$:

\qquad $\displaystyle \dfrac{i\, T_i}{S_i} = \dfrac{i}{S_i} \sum_{k=i+1}^n a_k = \sum_{k=i+1}^n \dfrac{i\, a_k}{S_i}$

Questa rielaborazione permette di sfruttare l'ordinamento $a_k \ge a_i \;\; \forall i < k$. Infatti, se $a_k \ge a_i$, allora:

\qquad $\dfrac{i\, a_k}{S_i} = \dfrac{\overbrace{a_k + a_k + \cdots + a_k\,\rule[0.8ex]{0pt}{1ex}}^{\raisebox{0.5ex}{\mbox{i volte}}}}{a_1 + a_2 + \cdots + a_k} \;\; \ge 1$

```{=latex}
\vspace{2mm}
```

Ne consegue che

\qquad $\displaystyle \dfrac{i\, T_i}{S_i} = \sum_{k=i+1}^n \dfrac{i\, a_k}{S_i} \ge \sum_{k=i+1}^n 1 = n - (i+1) + 1 = n - i$

In tal modo si conclude che $\tfrac{i\, T_i}{S_i} \ge n - i$, che equivale, tramite le equivalenze iniziali, a

\qquad $\dfrac{i\, T_i}{S_i} \ge n-i \;\; \Rightarrow \;\; \dfrac{S_i}{S_i + T_i} \le \dfrac{i}{n} \;\; \Rightarrow \;\; Q_i \le F_i$

```{=latex}
\vspace{5mm}
```

In conclusione si è dimostrato che, ordinando i dati in modo crescente, la quantità cumulata $Q_i$ risulta sempre minore o uguale alla frequenza cumulata $F_i$. 

```{=latex}
\hfill
```

Per $i = 1, \cdots, n$ le coppie $(F_i, Q_i)$ indicano che il $100F_i\%$ della popolazione detiene il $100Q_i\%$ della quantità considerata. Si considerino ora i punti sul piano che sono identificati da queste coppie.

```{=latex}
\vspace{1mm}
\hspace{-0.9em}\begin{minipage}[c]{0.44\textwidth}
    \centering
    \begin{tikzpicture}
    \begin{axis}[
        xmin=0, xmax=1,
        ymin=0, ymax=1,
        width=6.75cm, height=5.75cm,
        xlabel={$F_i$},
        ylabel={$Q_i\;\;\;$},
        xlabel style={
            at={(axis description cs:0.5,-0.135)},
            anchor=north,
        },
        y label style={
            rotate=-90,
            anchor=center,
        },
        grid=major,
        grid style={dashed,gray!30},
        xtick={0,0.125,0.25,0.375,0.5,0.625,0.75,0.875,1},
        xticklabels={$\hspace{-1.7em} 0$, $\frac{1}{n}$, $\frac{2}{n}$, $$, \raisebox{-1.5ex}{$\dots$}, $$, $\frac{n-2}{n}$, $\frac{n-1}{n}$, $1$},
        ytick={0,0.125,0.25,0.375,0.5,0.625,0.75,0.875,1},
        yticklabels={$$, $\frac{1}{n}$, $\frac{2}{n}$, $$, $\dots$, $$, $\frac{n-2}{n}$, $\frac{n-1}{n}$, $1$},
        yticklabel style={anchor=center, xshift=-1.1em},
    ]
    \addplot [
        color=black,
        thick,
        mark=*,
        mark options={color=gray!100!black, fill=gray!100!black}
    ] coordinates {
        (0,0) (0.125,0.125) (0.25,0.25) (0.375,0.375) (0.5,0.5) (0.625,0.625) (0.75,0.75) (0.875,0.875) (1,1)
    };
    \end{axis}
    \end{tikzpicture}
\end{minipage}
\begin{minipage}[l]{0.56\textwidth}
\vspace{-3em}
\textbf{Concentrazione minima}\quad Nel caso di concentrazione minima tutti i punti $(F_i, Q_i)$ giacciono sulla retta $F=Q$: si può dunque dire che in questo caso $F_i - Q_i = 0$ per ogni $i$.
\\[0.6em]

\raggedright
\makebox[0pt][l]{%
\hspace{-1mm}$\displaystyle
\begin{array}{l@{\ =\ }c@{,\,}c@{,\,}c@{,\,}l@{\;\;\;}l}
a_i 
  & \bar{a} 
  & \cdots 
  & \bar{a} 
  & \bar{a} 
  & \quad a_i = \bar{a} \quad \forall i = 1,\dots,n 
\\[1mm]
Q_i 
  & \tfrac{\bar{a}}{TOT}
  & \cdots
  & \tfrac{(n-1)\bar{a}}{TOT}
  & \tfrac{n\,\bar{a}}{TOT}
  & \quad Q_i = \dfrac{i\,\bar{a}}{TOT} = \dfrac{i\,\bar{a}}{n\,\bar{a}} = \dfrac{i}{n} = F_i
\end{array}
$%
}
\end{minipage}


\hspace{-0.9em}\begin{minipage}[c]{0.44\textwidth}
    \centering
    \begin{tikzpicture}
    \begin{axis}[
        xmin=0, xmax=1,
        ymin=0, ymax=1,
        width=6.75cm, height=5.75cm,
        xlabel={$F_i$},
        ylabel={$Q_i\;\;\;$},
        xlabel style={
            at={(axis description cs:0.5,-0.135)},
            anchor=north,
        },
        y label style={
            rotate=-90,
            anchor=center,
        },
        grid=major,
        grid style={dashed,gray!30},
        xtick={0,0.125,0.25,0.375,0.5,0.625,0.75,0.875,1},
        xticklabels={$\hspace{-1.7em} 0$, $\frac{1}{n}$, $\frac{2}{n}$, $$, \raisebox{-1.5ex}{$\dots$}, $$, $\frac{n-2}{n}$, $\frac{n-1}{n}$, $1$},
        ytick={0,0.125,0.25,0.375,0.5,0.625,0.75,0.875,1},
        yticklabels={$$, $\frac{1}{n}$, $\frac{2}{n}$, $$, $\dots$, $$, $\frac{n-2}{n}$, $\frac{n-1}{n}$, $1$},
        yticklabel style={anchor=center, xshift=-1.1em},
    ]
    \addplot [
        color=black,
        thick,
        mark=*,
        mark options={color=gray!100!black, fill=gray!100!black}
    ] coordinates {
        (0,0) (0.125,0) (0.25,0) (0.375,0) (0.5,0) (0.625,0) (0.75,0) (0.875,0) (1,1)
    };
    \addplot [
        domain=0:1,
        dashed,
        black,
        thin,
    ] {x};
    \end{axis}
    \end{tikzpicture}
\end{minipage}
\begin{minipage}[l]{0.56\textwidth}
\vspace{-2.2em}
\textbf{Concentrazione massima}\quad Nel caso di concentrazione \mbox{massima} tutti i punti \((F_i, Q_i)\) giacciono sulla retta \(Q=0\), tranne per l'ultimo in cui $F_n = Q_n$: dunque in questo caso \(F_i - Q_i = F_i\) per \(i=1, \cdots, n-1\) e $F_n - Q_n = 0$.
\\[0.6em]

\hspace{20mm}\makebox[0pt][l]{%
\hspace{-1mm}$\displaystyle
\begin{array}{l@{\ =\ }c@{,\,}c@{,\quad}c@{,\quad}c@{,\,}l@{}l}
a_i & 0 & 0 & \cdots & 0 & TOT \\[1mm]
Q_i & 0 & 0 & \cdots & 0 & 1 \\[1mm]
F_i & \dfrac{1}{n} & \dfrac{2}{n} & \cdots & \dfrac{n-1}{n} & 1
\end{array}
$%
}
\end{minipage}
\vspace{1mm}
```



```{=latex}
\vspace{1mm}
\hspace{-0.9em}\begin{minipage}[c]{0.44\textwidth}
    \centering
    \begin{tikzpicture}
    \begin{axis}[
        xmin=0, xmax=1,
        ymin=0, ymax=1,
        width=6.75cm, height=5.75cm,
        xlabel={$F_i$},
        ylabel={$Q_i\;\;\;$},
        xlabel style={
            at={(axis description cs:0.5,-0.135)},
            anchor=north,
        },
        y label style={
            rotate=-90,
            anchor=center,
        },
        grid=major,
        grid style={dashed,gray!30},
        xtick={0,0.125,0.25,0.375,0.5,0.625,0.75,0.875,1},
        xticklabels={$\hspace{-1.7em} 0$, $\frac{1}{n}$, $\frac{2}{n}$, $$, \raisebox{-1.5ex}{$\dots$}, $$, $\frac{n-2}{n}$, $\frac{n-1}{n}$, $1$},
        ytick={0,0.125,0.25,0.375,0.5,0.625,0.75,0.875,1},
        yticklabels={$$, $\frac{1}{n}$, $\frac{2}{n}$, $$, $\dots$, $$, $\frac{n-2}{n}$, $\frac{n-1}{n}$, $1$},
        yticklabel style={anchor=center, xshift=-1.1em},
    ]

    % 1) Definiamo la bisettrice (senza disegnarla)
    \addplot [
        name path=diag,
        domain=0:1,
        draw=none
    ] {x};

    % 2) Definiamo la curva di Lorenz (sotto la bisettrice): y = x^2
    \addplot [
        name path=lorenz,
        domain=0:1,
        draw=none
    ] {x^2};

    % 3) Riempiamo l'area fra le due curve in grigio
    \addplot [gray!30] fill between[of=lorenz and diag];

    % 4) Disegniamo la bisettrice in nero tratteggiato
    \addplot [
        domain=0:1,
        dashed,
        black,
        thin
    ] {x};

    % 5) Disegniamo la curva di Lorenz in nero
    \addplot [
        domain=0:1,
        color=black,
        semithick
    ] {x^2};

    \end{axis}
    \end{tikzpicture}
\end{minipage}
\begin{minipage}[l]{0.56\textwidth}
\vspace{-8mm}
\textbf{Concentrazione intermedia}\quad Nei casi intermedi si avrà che i punti staranno su una curva sotto la bisettrice del I° e III° quadrante $F = Q$, dato che $Q_i \le F_i$ per qualsiasi $i=1,\cdots,n$. Più la curva si avvicina alla bisettrice, e più la concentrazione è bassa, mentre più si allontana e più la concentrazione è alta.
\end{minipage}
```

La curva dei punti $(F_i, Q_i)$ è detta *curva di Lorenz*. L'area compresa tra la curva di Lorenz e la retta di equidistribuzione (la bisettrice) è detta area di concentrazione e può essere utilizzata come base per la definizione di appositi indici di concentrazione: maggiore infatti è la concentrazione osservata e maggiore sarà quell'area.

```{=latex}
\newpage
```

### Indice di concentrazione di Gini

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Indice di concentrazione di Gini}
```

I diagrammi illustrati precedentemente sono però degli strumenti qualitativi. Si vuole perciò introdurre un indice numerico calcolato a partire dai dati, il cui valore possa facilemnte essere confrontato con due estremi minimo e massimo. Si definisce quindi l'*indice di concentrazione di Gini*:
$$
G = \sum^{n-1}_{i=1} (F_i - Q_i)
$$
Si osserva che non viene considerato il caso in cui $i=n$ in quanto $F_n - Q_n = 0$ sempre.

Per interpretare questo indice come l'area nel diagramma $(F,Q)$, occorre introdurre una somma di Riemann. Ogni differenza $(F_i - Q_i)$ va infatti molitplicata per l'ampiezza in ascissa $\Delta F_i$: trovandoci in un contesto discreto con dati equispaziati, ciò si traduce in $\Delta F_i = 1/n$. Di conseguenza, la somma $\sum (F_i - Q_i)$ diventa $n$ volte l'area effettiva. Dividendo quindi questa sommatoria per $n$, si ottiene un indice $G_{area}$ che riflette la superficie compresa tra la retta di equidistribuzione e la curva di Lorenz:
$$
G_{area} = \sum_{i=1}^{n-1} \squarep{(F_i - Q_i) \Delta F_i} = \dfrac{1}{n} \sum_{i=1}^{n-1} (F_i - Q_i)
$$

```{=latex}
\vspace{-1mm}
\hspace{-0.9em}\begin{minipage}[c]{0.44\textwidth}
    \centering
    \begin{tikzpicture}
    \begin{axis}[
        xmin=0, xmax=1,
        ymin=0, ymax=1,
        width=6.75cm, height=5.75cm,
        xlabel={$F_i$},
        ylabel={$Q_i\;\;\;$},
        xlabel style={
            at={(axis description cs:0.5,-0.135)},
            anchor=north,
        },
        y label style={
            rotate=-90,
            anchor=center,
        },
        grid=major,
        grid style={dashed,gray!30},
        xtick={0,0.125,0.25,0.375,0.5,0.625,0.75,0.875,1},
        xticklabels={$\hspace{-1.7em} 0$, $\frac{1}{n}$, $\frac{2}{n}$, $$, \raisebox{-1.5ex}{$\dots$}, $$, $\frac{n-2}{n}$, $\frac{n-1}{n}$, $1$},
        ytick={0,0.125,0.25,0.375,0.5,0.625,0.75,0.875,1},
        yticklabels={$$, $\frac{1}{n}$, $\frac{2}{n}$, $$, $\dots$, $$, $\frac{n-2}{n}$, $\frac{n-1}{n}$, $1$},
        yticklabel style={anchor=center, xshift=-1.1em},
    ]

    % 1) Bisettrice
    \addplot [
        name path=diag,
        domain=0:1,
        draw=none
    ] {x};

    % 2) Curva di Lorenz
    \addplot [
        name path=lorenz,
        domain=0:1,
        draw=none
    ] {x^2};

    % 3) Asse x
    \addplot [
        name path=axis,
        domain=0:1,
        draw=none
    ] {0};

    % 4) Area sotto la curva - grigio chiaro
    \addplot [gray!10] fill between[of=lorenz and axis];

    % 5) Area tra curva e bisettrice - grigio medio
    \addplot [gray!30] fill between[of=lorenz and diag];

    % 6) Bisettrice
    \addplot [
        domain=0:1,
        black,
        semithick
    ] {x};

    % 7) Curva di Lorenz
    \addplot [
        domain=0:1,
        color=black,
        semithick
    ] {x^2};

    \node at (axis cs:0.5,0.38) {\textbf{A}};
    \node at (axis cs:0.75,0.25) {\textbf{B}};

    \end{axis}
    \end{tikzpicture}
\end{minipage}
\begin{minipage}[l]{0.56\textwidth}
\vspace{-9.4mm}
Questo indice misura l'area compresa tra la bisettrice $F=Q$ e la curva di Lorenz. Nel grafico è rappresentata da $A$. \\[2mm]
Nel caso di concentrazione minima la curva di Lorenz si \mbox{appiattisce} e coincide con la bisettrice: di conseguenza \mbox{l'indice} avrà valore minimo 0. \\[2mm]
Nel caso di concentrazione massima la curva di Lorenz \mbox{coincide} con l'asse orizzontale, e quindi l'area è \mbox{rappresentata} da $A + B$. L'indice avrà valore massimo $1/2$, ossia l'area della porzione di piano compreso tra la bisettrice e l'asse orizzontale.
\end{minipage}
```

Calcolando algebricamente il valore massimo di $G_{area}$ si trova che in realtà questo non assume mai valore pari a $1/2$. Ricordando che nel caso di concentrazione massima $F_i - Q_i = F_i$ per $i, \cdots, n-1$:
$$
G_{area}\text{(max)} = \dfrac{1}{n} \sum_{i=1}^{n-1} F_i = \dfrac{1}{n} \sum_{i=1}^{n-1} \dfrac{i}{n} = \dfrac{1}{n^2} \sum_{i=1}^{n-1} i = \dfrac{1}{n^2} \dfrac{(n-1)(n-\cancel 1 + \cancel 1)}{2} = \dfrac{n-1}{2n}
$$
Di conseguenza si trova che per $n$ grande, nel caso di concentrazione massima, il valore di $G_{area}$ tende a $1/2$. Si è dimostrato che $0 \le G_{area} < 1/2$.

##### Indice di concentrazione di Gini normalizzato

Si consideri $G_{area}$, lo si normalizza dividendolo per il suo valore massimo $\sum F_i$ che si presenta nel caso di concentrazione massima:
$$
G' = \dfrac{2n}{n-1} \sum_{i=1}^{n-1} \squarep{(F_i - Q_i) \Delta F_i} = \dfrac{2n}{n-1}  \dfrac{1}{n} \sum_{i=1}^{n-1} (F_i - Q_i) = \dfrac{2}{n-1} \sum_{i=1}^{n-1} (F_i - Q_i)
$$

Si osserva che $0 \le G' \le 1$. Si noti che si è arrivati a tale conclusione partendo da $G_{area}$, ma è possibile arrivare al medesimo risultato dividendo $G$ per il suo valore massimo $(n-1)/2$.

Considerando il grafico, questo indice indica il rapporto $A / (A+B)$, dove $(A+B)$ rappresenta proprio l'area dell'indice non normalizzato nel caso di concentrazione massima.



```{=latex}
\newpage
```



# Altro

## Altri grafici

### Box Plot

Per visualizzare alcune statistiche riassuntive di un insieme di dati si usa un *box plot* (diagramma a scatola). Per realizzarlo tracciamo un segmento orizzontale dal minore al maggiore dei dati. Al segmento sovrapponiamo un rettangolo che si estende dal primo al terzo quartile. Il rettangolo è diviso in due parti da un segmento verticale in corrispondenza della mediana campionaria.

La lunghezza della base del rettangolo corrisponde allo scarto interquartile.

```{=latex}
\begin{tikzpicture}
\begin{axis}[
    width=12cm,
    height=2.8cm,
    xmin=0, xmax=10,
    ymin=0.5, ymax=1.5,
    axis x line=none,
    axis y line=none,
    boxplot/draw direction=x,
    clip=false,
]
  % box plot
  \addplot+[
    boxplot prepared={
      lower whisker=1,
      lower quartile=2,
      median=3.5,
      upper quartile=5.8,
      upper whisker=8,
    },
    thick,
    draw=black,
    fill=white,
  ] coordinates {};

  % outliers
  \addplot+[
    only marks,
    mark=o,
    mark options={draw=black, line width=0.8pt},
  ] coordinates {(9.3,1) (11,1)};

  % etichette
  \node[above, yshift=0.6cm] at (axis cs:1,1) {Min};
  \node[above, yshift=0.55cm] at (axis cs:2,1) {Q1};
  \node[above, yshift=0.6cm] at (axis cs:3.5,1) {Med};
  \node[above, yshift=0.55cm] at (axis cs:5.8,1) {Q3};
  \node[above, yshift=0.6cm] at (axis cs:8,1) {Max};

  % frecce
  \draw[<->, thick, gray]
    (axis cs:1.1,0.4) -- (axis cs:1.9,0.4)
    node[midway,below, text=gray]{25\%};
  \draw[<->, thick, gray]
    (axis cs:2.1,0.4) -- (axis cs:3.4,0.4)
    node[midway,below, text=gray]{25\%};
  \draw[<->, thick, gray]
    (axis cs:3.6,0.4) -- (axis cs:5.7,0.4)
    node[midway,below, text=gray]{25\%};
  \draw[<->, thick, gray]
    (axis cs:5.9,0.4) -- (axis cs:7.9,0.4)
    node[midway,below, text=gray]{25\%};

\end{axis}
\end{tikzpicture}
```

In un box plot ciascuno dei quattro segmenti contiene il $25\%$ delle osservazioni, ossia un quarto dei dati, però la lunghezza di ciascun segmento sulla scala orizzontale dipende dalla distribuzione dei valori. Se i dati sono più concentrati in un certo intervallo, quel tratto sarà più corto. I quartili quindi dividono le osservazioni in parti uguali sul numero dei dati, non sulla distanza numerica.

I pallini a destra del box plot rappresentano dei valori fuori scala, determinati tramite l'utilizzo dell'$\text{IQR}$.

### Q-Q Plot

```{=latex}
\begin{minipage}[c]{0.3\textwidth}
    \centering
    \includegraphics[width=\linewidth]{qq-plot.jpg}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.65\textwidth}
    \vspace{-7mm}
Un diagramma Q-Q (o diagramma quantile-quantile) è una rappresentazione grafica qualitativa che permette di verificare le similarità tra le distribuzioni di due campioni diversi (utile per vedere quindi se seguono una stessa distribuzione). \\\\ 
Questi diagrammi si basano sul fatto che i quantili campionari rappresentino l'approssimazione di quantili teorici che, se considerati tutti insiemi, individuano la distribuzione dei dati.
\end{minipage}
```

Ogni asse cartesiano di questo diagramma contiene i quantili dei due campioni presi in considerazione. Poiché i quantili sono ordinati in modo crescente, anche il grafico risultante sarà crescente, o perlomeno non decrescente.

Se due campioni hanno una distribuzione uguale, allora estraendo da entrambi il quantile di un livello fissato si dovranno ottenere due numeri vicini. In questo caso i punti del diagramma Q-Q tenderanno ad allinearsi alla bisettrice del I° e III° quadrante.

```{=latex}
\hfill
```

## Distribuzioni normali

Dati normali
: Un insieme di dati si dice *normale* se il rispettivo istogramma ha le proprietà seguenti:

- L'istogramma è simmetrico rispetto all'intervallo centrale
- Ha il punto massimo in corrispondenza dell'intervallo centrale
- Spostandoci dal centro verso destra o verso sinistra, l’altezza diminuisce in modo tale che l’intero istogramma è a forma di campana.

Se l'istogramma di un insieme di dati è vicino a essere un istogramma normale, allora diciamo che l'insieme di dati è approssimativamente normale. Inoltre l'insieme di dati si dice assimmetrico a destra o a sinistra a seconda di quale sia la coda più lunga.

A causa della simmetria dell'istogramma normale, la media e la mediana di un insieme di dati approssimativamente normale sono uguali o molto prossime.

Regola empirica
: Siano $\bar{x}$ e $s$ rispettivamente la media e la deviazione standard campionarie di un insieme di dati approssimativamente normale. La *regola empirica* specifica le proporzioni approssimate delle osservazioni che si trovano a una distanza di $s$, $2s$ e $3s$ da $\bar{x}$:

- circa il $68\%$ delle osservazioni rientrano nell'intervallo $\bar{x} \pm s$
- circa il $95\%$ delle osservazioni ritentrano nell'intervallo $\bar{x} \pm 2s$
- circa il $99.7\%$ delle osservazioni ritentrano nell'intervallo $\bar{x} \pm 3s$

Insiemi di dati bimodali
: Un insieme di dati ottenuto campionando una popolazione costituita da sottogruppi eterogenei non è di solito normale. Piuttosto, l’istogramma di un insieme di dati di questo tipo spesso rassomiglia a una sovrapposizione di istogrammi normali e quindi spesso ha due o più massimi locali. Questi massimi locali si comportano come mode. Un insieme di dati il cui istogramma ha due massimi locali si dice quindi *bimodale*.

In questi casi, quando nei dati si hanno due popolazioni ben distinte per quanto riguarda un certo attributo, ha senso dividere i dati in base a queste popolazioni e ottenere un insieme normale.



```{=latex}
\hfill
```

## Trasformazione dei dati

Può risultare utile una rielaborazione dei dati iniziali per diversi motivi: per poterli confrontare con altri dati riportandoli ad un intervallo predefinito, per poter confrontare la loro distribuzione di frequenza con quella di altri dati oppure per renderli più facilmente leggibili.

Si consideri un insieme di valori distinti $V = \{v_1, v_2, \cdots, v_m\}$, ognuno con la propria frequenza relativa $f_1, f_2, \cdots, f_m$. Si consideri anche una funzione $f$ che trasformi i valori di $V$ in valori appartenenti all'insieme $V' = \{v_1', v_2', \cdots, v_m' \}$: si ha perciò che $\forall j \in \{1, \dots,m\} \;\; f(v_j) = v_j'$.

Si prenderanno in esame solo funzioni *iniettive*: per questo tipo di trasformazioni i valori delle frequenze relative per l'insieme $V'$ rimangono i medesimi di quelli per l'insieme $V$, ossia $f_1, f_2, \cdots, f_m$. 

Si analizzera come variano gli indici statistici, e di conseguenza il grafico della distribuzione, a seconda delle trasformazioni che verranno effettuate. Verranno analizzate solo le trasformazioni che prevedono di applicare ai dati una funzione *lineari*. Fissate perciò due costanti $a, b \in \mathbb{R}$ si avrà che $v' = f(v) = a\, v + b$.

### Traslazione

Se si vogliono traslare i dati di una quantità costante $k \in \mathbb{R}$, si applica la trasformazione $f(x) = x + k$. Per $k > 0$ si trasla verso destra e per $k < 0$ si trasla verso sinistra.

Questa trasformazione è utile quando i valori osservati sono molto grandi e sono poco dispersi attorno ad un valore centrale. Si osserva che:

- gli indici di centralità, quali media, quantili e mediana, vengono traslati della stessa quantità $k$.
- gli indici di dispersione, quali range (dei dati), IQR, varianza e devizazione standard, dell'insieme traslato $V'$ rimangono invece gli stessi dell'insieme di partenza $V$.

La traslazione è una trasformazione iniettiva, e quindi i dati osservati varieranno nei loro valori ma le relative frequenze rimarranno uguali. Qualora si rappresentasse graficamente la distribuzione dei dati originali e quella dei dati trasformati, si osserverebbe che la forma dei due grafici non subirebbe alterazioni: ciò che cambia sono solo i valori dei dati l'ungo l'asse delle ascisse.

Si conclude che la traslazione comporta uno spostamento dell'*origine* del sistema di riferimento, ovvero il punto in cui si trova lo zero sull'asse delle ascisse. Le relazioni interne, e di conseguenza le proprietà della distribuzione come la forma, la simmetria e gli indici di dispersione, rimangono invariate.

### Scalatura

Se si vogliono dilatare o contrarre i dati di un fattore costante $h \in \mathbb{R}^+$ si applica la trasformazione $f(x) = h x$. Se $h > 1$ il range dei valori risulta aumentato, ed è stata quindi applicata una dilatazione, mentre per $0 < h < 1$ si applica una contrazione del range dei valori.

Si noti che non viene considerato il caso in cui $h<0$ in quanto, oltre alla dilatazione o contrazione, i dati vengono specchiati rispetto all'asse delle ordinate.

Si consideri $h = 1/k$. Se $k$ è minore del valore minimo nel campione, allora tutti i valori trasformati saranno maggiori di 1, mentre se $k$ è maggiore del valore massimo, allora tutti i valori trasformati saranno minori di 1[^1].

Si osserva che:

- gli indici di centralità vengono scalati della stessa quantità $h$.
- il range di variazione e l'IQR vengono scalati della stessa quantità $h$.
- la varianza viene scalata di una quantità $h^2$ mentre la deviazione standard viene scalata di $|h|$.

Anche in questo caso si verifica che i dati osservati varieranno nei loro valori ma le relative frequenze rimarranno uguali. I grafici che rappresentano la distribuzione dei dati originali e quella dei dati trasformati hanno quindi la medesima forma ma valori diversi sull'asse delle ascisse.



[^1]: Questa proprietà vale solo quando i dati del campione $\in \mathbb{R}^+$. Non vale se sono presenti valori negativi.



### Cambiamento di origine e scala

Si abbia un insieme di valori nell'intervallo $(a,b)$ e vogliamo adattarli in modo che appartengano all'intervallo $(c,d)$, la trasformazione da applicare sarà:

\vspace{-3mm}
$$
f(x) = c + \dfrac{d-c}{b-a} \, (x - a)
$$

\vspace{-5.7mm}

#### Dimostrazione

\vspace{-1mm}
Metodo delle rette
: La funzione che trasforma i valori nell'intervallo $(a,b)$ all'interno dell'intervallo $(c,d)$ è una retta, la cui equazione si ricava tramite la formula della retta passante per due punti.  
Sia $(a,c) = (x_0, y_0)$ e $(b,d)= (x_1,y_1)$, allora:

    \vspace{-7mm}
    $$
    \dfrac{y-y_0}{y_1 - y_0} = \dfrac{x-x_0}{x_1 - x_0}  \;\;\Rightarrow\;\; \dfrac{x'-x'_0}{x_1'-x_0'} = \dfrac{x-x_0}{x_1 - x_0} \;\;\Rightarrow\;\; \dfrac{x'-c}{d-c}=\dfrac{x-a}{b-a} \;\;\Rightarrow\;\; f(x) = x' = c + \dfrac{d-c}{b-a} (x-a)
    $$

\vspace{-1mm}

Metodo delle condizioni
: Si consideri la funzione $f: [a,b] \rightarrow [c,d]$. In generale, una trasformazione lineare ha la forma $f(x) = mx + q$. Per determinare $m$ e $q$ si impongono le condizioni:

    1. $f(a) =c$, ossia $ma + q = c$
    2. $f(b) = d$, ossia $m b + q = d$

    Sottraendo la prima dalla seconda si ottiene: 

    \vspace{-1mm}

    \quad $m\, (b-a) = d-c \;\; \Rightarrow \;\; m = \dfrac{d-c}{b-a}$

    \vspace{-1mm}

    Sostituendo $m$ nella prima equazione:

    \quad $\dfrac{d-c}{b-a}\, a + q = c \;\; \Rightarrow \;\; q = c - \dfrac{d-c}{b-a}\, a$

    Di conseguenza la funzione diventa:

    \quad $f(x) = \dfrac{d-c}{b-a}\, x + \left( c - \dfrac{d-c}{b-a}\, a\right) = c + \dfrac{d-c}{b-a}\, (x-a)$

\newpage

Scegliendo un apposito intervallo $(c,d)$, è possibile trasformare un campione di dati affinché le osservazioni siano compresi tra due valori significativi. Utilizzando l'equazione ottenuta:

- nel caso in cui si vogliano mappare i valori in $(0,1)$ si applica una funzione $f(x) = \dfrac{x-a}{b-a}$
\vspace{1mm}
- nel caso in cui si vogliano mappare i valori in $(-1,1)$ si applica una funzione $f(x) = 2 \dfrac{x-a}{b-a} - 1$

Si osserva che questa mappatura lineare conserva l'ordine dei dati.

#### Standardizzazione

La standardizzazione è un caso particolare di cambiamento di origine e scala, e consiste nello traslare verso sinistra rispetto alla media dei valori delle osservazioni, per poi applicare una scala il cui fattore è il reciproco della deviazione standard dei valori. Indicando con $\bar{x}$ e con $s_x$ rispettivamente la media campionaria e la deviazione standard campionaria dei valori, la trasformazione che si ottiene sarà:
$$
f(x) = \dfrac{x - \bar{x}}{s_x}
$$
La standardizzazione è quindi un'operazione di trasformazione lineare che prevede una centratura, ossia la sottrazione della media, e una uniformazione, ossia la divisione per la deviazione standard. Tramite la centratura si ottiene un nuovo campione la cui media sia zero, e tramite l'uniformazione si rimuove l'unità di misura alle osservazioni, rendendoli numeri adimensionali, e si ha come deviazione standard per il campione 1. Infatti:
$$
\bar{x}' = \dfrac{\bar{x}-\bar{x}}{s_x} = 0 \qquad s_{x'}^2 = \dfrac{1}{s_x^2} = 1 \;\;\Rightarrow\;\; s_{x'}=1
$$


### Trasformazioni logaritmiche

A volte i valori di una variabile osservata sono molto grandi oppure molto distanziati. In questi casi può essere utile considerare non tanto il valore originale ma, pensando a tale valore come potenza di una data base, ragionare in termini del relativo esponente. Ciò corrisponde ad applicare una trasformazione logaritmica del seguente tipo:
$$
f(x) = \log x
$$
La scelta della base del logaritmo in questa funzione dipende dal contesto in cui bisogna applicarlo: basi comuni sono il 10, la costante $e$ oppure il 2.

Nel caso i valori siano molto distanziati tra loro e caratterizzati da una distribuzione di frequenza unimodale fortemente asimmetrica, la trasformazione logaritmica permette di ottenere una distribuzione di frequenza più simmetrica. Questo tipo di trasformazione ha molti altri vantaggi, dovuti al fatto che l'operazione di prodotto (o quoziente)  tra due valori viene trasformata nella somma (o nella differenza) dei rispettivi logaritmi.




```{=latex}
\hfill
```

## Alberi di decisione

Gli indici di eterogeneità non servono solo per misurare la dispersione delle frequenze nelle variabili qualitative, ma trovano anche un’applicazione fondamentale nella costruzione degli alberi di decisione. In un albero di decisione, ogni oggetto da classificare è descritto da un vettore di attributi, e la classificazione avviene valutando, a partire dalla radice dell’albero, condizioni sui valori di tali attributi.

In pratica, ad ogni nodo dell’albero viene associata una condizione (o test) che suddivide il campione in sottoinsiemi: si percorre la freccia corrispondente in base al risultato del test, fino a raggiungere una foglia, la quale indica la classe assegnata. La scelta del test in ciascun nodo è guidata proprio dagli indici di eterogeneità: l’obiettivo è quello di ridurre l’eterogeneità dei dati nei nodi figli rispetto a quella del nodo padre. 

Si cerca quindi di porre nei vari nodi domande che permettono di ottenere sottogruppi il più omogenei possibile. Così facendo si riduce il numero di domande da fare.

Ad esempio, utilizzando l’indice di Gini si seleziona la condizione che minimizza l’indice nei gruppi risultanti, cioè quella che porta a sottoinsiemi in cui la distribuzione delle classi è il più possibile concentrata in una sola categoria. Analogamente, se si impiega l’indice di entropia, si cerca la divisione che riduce al minimo l’incertezza (ovvero l’entropia) nei nodi successivi. In entrambi i casi, il criterio adottato assicura che, procedendo lungo l’albero, si raggiungano foglie contenenti gruppi di oggetti omogenei rispetto alla classe di appartenenza.

Così, l’impiego degli indici di eterogeneità consente di valutare quantitativamente la bontà delle suddivisioni, contribuendo a costruire alberi di decisione efficaci per il compito di classificazione.

## Analisi di classificatori

Un classificatore è un meccanismo che, dati degli oggetti su cui si desidera effettuare una distinzione, associa a ciascun oggetto una classe tra quelle disponibili. Matematicamente, ciò equivale ad avere un insieme $\Omega$ (che raccoglie i campioni da classificare), e un insieme di etichettte $\mathcal{C}$. Il classificatore è quindi una funzione $c: \Omega \rightarrow \mathcal{C}$ che. a ogni elemento $x \in \Omega$, associa una delle etichette in $\mathcal{C}$.

Classificatore binario
: Sia $\Omega$ l'insieme degli oggetti su cui vogliamo effettuare la classificazione, e supponiamo che a ciascun oggetto $x \in \Omega$ sia associata, in modo noto, un'etichetta $\gamma(x)\in \mathcal{C} = \{\text{positivo},\text{negativo}\}$.

    Un classificatore binario è una funzione $c: \Omega \rightarrow \{\text{positivo}, \text{negativo}\}$ che, a partire da un oggetto $x$, ne prevede la classe, positiva o negativa che sia.



Una volta definito il classificatore $c$, la sua prestazione rispetto a un insieme di oggetti di test $\mathcal{D} \sube \Omega$, di cui sono note le classi vere $\gamma(x)$, si può valutare confrontando l'uscita $c(x)$ con la classe effettiva $\gamma(x)$. Da questo confronto si possono verificare quattro possibili casi: true positive, false negative, true negative e false positive.

I valori ottenuti possono essere organizzati in delle matrici, dette *matrici di confusione*.



```{=latex}
\vspace{0mm}
\noindent
\begin{minipage}[c]{0.3\textwidth}
    \centering
    \begin{tabular}{c c | c c}
        \toprule
         & & \multicolumn{2}{c}{\textbf{Valore Effettivo}} \\ 
         & & P & N \\ 
        \midrule
        \multirow{2}{*}{\shortstack{\textbf{Valore} \\ \textbf{Predetto}}}
         & P & TP  & FP \\
         & N & FN & TN  \\ 
        \bottomrule
    \end{tabular}
\end{minipage}
\hfill
\begin{minipage}[c]{0.6\textwidth}
	\vspace{4.5mm}
	TP: oggetti $x$ con $\gamma(x) = \text{positivo}$ e $c(x)= \text{positivo}$ \\[1mm]
	FN: oggetti $x$ con $\gamma(x) = \text{positivo}$ e $c(x)= \text{negativo}$ \\[1mm]
	TN: oggetti $x$ con $\gamma(x) = \text{negativo}$ e $c(x)= \text{negativo}$ \\[1mm]
	FP: oggetti $x$ con $\gamma(x) = \text{negativo}$ e $c(x)= \text{positivo}$ \\[1mm]
\end{minipage}
```



Si osserva che sommando i valori sulla prima colonna si ha la cardinalità degli elementi realmente positivi, mentre sommando quelli sulla seconda si ottiene la cardinalità degli elementi realmente negativi. Sommando queste due cardinalità si ottiene la cardinalità del campione.

**[To be done]**

\hfill

### Classificatori costanti

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Classificatori costanti}
```

### Classificatori ideali

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Classificatori ideali}
```

### Classificatori casuali

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Classificatori casuali}
```

### Classificatori a soglia

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Classificatori a soglia}
```





```{=latex}
\newpage
\part{Teoria della probabilità}
```

# Calcolo combinatorio

Principio fondamentale del calcolo combinatorio
: Se ci sono $s_1$ modi per operare una scelta e, per ciascuno di essi, ci sono $s_2$ modi per operare una seconda scelta e, per ciascuno di essi, ci sono $s_3$ modi per operare una terza scelta e così via fino a $s_t$ modi per operare la $t$-esima scelta, allora il numero delle sequenze di possibili scelte è 
$$
s_1 \cdot s_2 \cdots s_t = \prod^t_{i=1} s_i
$$

Si osserva che questo risultato corrisponde a calcolare il numero delle foglie di un albero di profondità $t$ il cui primo livello ha $s_1$ nodi, ciascuno dei quali ha $s_2$ figli, ciascuno dei quali ha $s_3$ figli e così via.

## Permutazioni

Si consideri un insieme di $n$ oggetti $A = \{a_1, \cdots, a_n\}$. Una permutazione di questi $n$ oggetti è una sequenza ordinata in cui compaiono tutti e soli gli elementi dell’insieme $A$.

### Permutazioni semplici

Se gli $n$ oggetti di $A$ sono tutti distinguibili, allora si parla di permutazione semplice. 

Il numero totale di permutazioni semplici si ottiene applicando il principio fondamentale del calcolo combinatorio: il primo elemento della configurazione può essere scelto in $n$ modi, il secondo in $(n-1)$, il terzo in $(n-2)$ e così via, fino all'ultimo che può essere scelto in un solo modo, essendo rimasto un solo oggetto disponibile.

Indicando con $p_n$ il numero delle possibili permutazioni di un insieme di $n$ elementi distinguibili, si ottiene:
$$
p_n = n \cdot (n-1) \cdot (n-2) \cdots 1 = n!
$$
Come casi particolari, si ottiene $p_1 = 1! = 1$, mentre, per convenzione, si pone $p_0 = 0! = 1$.

### Permutazioni con ripetizioni

Se gli $n$ oggetti di $A$ non sono tutti distinguibili, ma sono suddivisi in $r$ gruppi di oggetti indistinguibili tra loro, con numerosità rispettive $k_1, k_2, \cdots, k_r$, allora una sequenza ordinata che includa tutti gli oggetti è detta *permutazione con ripetizioni*. Poiché ogni oggetto appartiene a un solo gruppo, si ha $\sum_{i=1}^r k_i = n$, da cui segue $r \le n$.

Indicando con $P_n$ il numero delle possibili permutazioni di un insieme di $n$ elementi non tutti distinguibili, si ottiene:
$$
P_n^{k_1, k_2, \cdots, k_r} = \dfrac{n!}{k_1!\, k_2!\, \cdots\, k_r!} = \binom{n}{k_1, k_2, \cdots, k_r}
$$
Questa formula si ottiene dividendo il numero totale di permutazioni di $n$ oggetti distinti per il numero delle permutazioni indistinguibili, ovvero quelle interne ai singoli gruppi di oggetti uguali, che non alterano la configurazione complessiva. La quantità ottenuta è detta *coefficiente multinomiale*.

Si osserva che $p_n = P_n^{k_1, \cdots, k_r} \cdot k_1! \cdots k_r!$ e che, nel caso in cui tutti i gruppi abbiano numerosità unitaria, ossia $k_i = 1$ per ogni $i$, si ottiene la formula delle permutazioni semplici.

```{=latex}
\hfill
```



## Disposizioni

Si consideri un insieme di $n$ oggetti $A = \{a_1, \dots, a_n\}$. Una disposizione di $k$ oggetti tratti dall’insieme $A$ è una sequenza ordinata di $k$ elementi in cui l’ordine è rilevante e gli oggetti possono essere scelti con o senza ripetizione, a seconda del contesto.

### Disposizioni semplici

Se gli $n$ oggetti di $A$ sono tutti distinguibili e non sono ammesse ripetizioni, allora si parla di disposizione semplice. Ne segue che $k \le n$.

Il numero totale di disposizioni semplici si ottiene applicando il principio fondamentale del calcolo combinatorio: il primo elemento della configurazione può essere scelto in $n$ modi, il secondo in $(n-1)$, il terzo in $(n-2)$ e così via, fino al $k$-esimo che può essere scelto in $(n-k+1)$ modi diversi.

Indicando con $d_{n,k}$ il numero delle possibili disposizioni semplici di $k$ elementi tra $n$ oggetti distinti, si ottiene:
$$
d_{n,k} = n\, (n-1) \dots (n-k+1) = n\, (n-1) \dots (n-k+1)\, \textcolor[rgb]{0.65,0.65,0.65}{\dfrac{(n-k)!}{(n-k)!}} = \dfrac{n!}{(n-k)!}
$$
Le permutazioni semplici possono essere interpretate come un caso particolare delle disposizioni semplici, in cui il numero di elementi scelti coincide con il numero totale disponibile, ossia quando $k = n$.

### Disposizioni con ripetizioni

Se gli $n$ oggetti dell’insieme $A$ sono tutti distinguibili e ogni elemento può comparire più volte nella sequenza, si parla di disposizione con ripetizione.

In questo caso, ogni posizione della sequenza può essere occupata da uno qualunque degli $n$ elementi, senza alcuna restrizione, e quindi ognuna delle $k$ posizioni può essere riempita in $n$ modi indipendenti dagli altri.

Indicando con $D_{n,k}$ il numero delle disposizioni con ripetizione di $k$ elementi tratti da un insieme di $n$ oggetti distinti, si ottiene:
$$
D_{n,k} = \underbrace{n \cdot n  \dots n}_{k\ \text{volte}} = n^k
$$
Tale formula vale per ogni intero $k \ge 0$, indipendentemente dalla cardinalità dell’insieme di partenza.

Quando $k = 1$, si ottiene ${D}_{n,1} = n$; quando $k = 0$, si pone per convenzione ${D}_{n,0} = 1$, in quanto esiste un’unica sequenza vuota di lunghezza zero.



```{=latex}
\hfill
```

## Combinazioni

Si consideri un insieme di $n$ oggetti $A = \{a_1, \dots, a_n\}$. Una combinazione di $k$ oggetti tratti dall'insieme $A$ è un insieme di $k$ elementi in cui l'ordine non è rilevante e gli oggetti possono essere scelti con o senza ripetizione, a seconda del contesto.

### Combinazioni semplici

Una combinazione semplice di $k$ oggetti tratti da un insieme $A$ di $n$ oggetti distinguibili è definita come un sottoinsieme di $k$ elementi di $A$, in cui l’ordine non è rilevante e non è consentito ripetere lo stesso oggetto più volte. Ne consegue che $k$ debba soddisfare la condizione $0 \le k \le n$.

Per determinarne il numero, si consideri il numero di disposizioni semplici di $k$ elementi su $n$, vale a dire tutte le possibili sequenze ordinate di $k$ oggetti distinti scelti da $A$. Ogni sottoinsieme di $k$ elementi può essere riordinato in $k!$ modi diversi, ossia in un numero pari a quello delle permutazioni dei suoi $k$ oggetti. Per convertire quindi il conteggio delle sequenze ordinate in quello dei sottoinsiemi, in cui l’ordine è irrilevante, è necessario dividere $d_{n,k}$ per $k!$. 

Indicando con $c_{n,k}$ il numero delle combinazioni semplici di $k$ elementi tratti da un insieme di $n$ oggetti distinti, si ottiene:
$$
c_{n,k} = \dfrac{d_{n,k}}{p_k} = \dfrac{n!}{(n-k)!} \, \dfrac{1}{k!} = \dfrac{n!}{k!\,(n-k)!} = \binom{n}{k}
$$

La quantità ottenuta è detta *coefficiente binomiale* $n$ su $k$ ed esprime il numero di tutti i possibili sottoinsiemi di cardinalità $k$ che si possono formare a partire da $n$ oggetti distinti. Si osservi come per definizione $c_{n,k} < d_{n,k}$. 

### Combinazioni con ripetizione

Se ogni elemento di $A$ può comparire più volte nella combinazione, ignorando comunque l'ordine, si parla di combinazione con ripetizione. In tal caso si possono scegliere $k$ elementi (con possibile duplicazione) tra gli $n$ oggetti di $A$, senza considerare l'ordine in cui vengono selezionati.

Indicando con $C_{n,k}$ il numero delle combinazioni con ripetizione di $k$ elementi tratti da un insieme di $n$ oggetti distinti, si ottiene:
$$
C_{n,k} = c_{n+k-1, k} = \binom{n+k-1}{k}
$$

#### Dimostrazione

Sia $A = \{a_1, a_2, \dots, a_n\}$ un insieme di $n$ oggetti distinti. Vogliamo contare il numero di combinazioni con ripetizione di $k$ elementi da $A$. Poiché in questo contesto l'ordine non è rilevante e le ripetizioni sono permesse, possiamo associare ogni combinazione (ossia, ogni multinsieme) a una sequenza non decrescente di indici. In particolare, consideriamo una sequenza
$$
m_1, m_2, \dots, m_k \quad \text{con} \quad 1 \le m_1 \le m_2 \le \dots \le m_k \le n
$$
Qui, i numeri $m_i$ non rappresentano direttamente gli oggetti di $A$, ma sono gli indici che li identificano: l'indice $m_i$ corrisponde all'oggetto $a_{m_i}$ in $A$. In questo modo, ogni scelta di $k$ elementi da $A$, con ripetizione, è associata a una sequenza non decrescente di indici.

Per facilitare il conteggio, trasformiamo questa sequenza non decrescente in una sequenza strettamente crescente mediante la trasformazione
$$
n_i = m_i + (i-1) \quad \text{per } i=1,2,\dots,k
$$
Dal momento che $m_i \le m_{i+1}$, si ha
$$
n_i = m_i + (i-1) < m_{i+1} + i = n_{i+1}
$$
che garantisce che la nuova sequenza $n_1, n_2, \dots, n_k$ sia strettamente crescente.

Osserviamo inoltre che il primo elemento soddisfa $n_1 = m_1 \ge 1$, mentre l'ultimo elemento è
$$
n_k = m_k + (k-1) \le n + (k-1)
$$
quindi ogni $n_i$ appartiene all'insieme $\{1, 2, \dots, n+k-1\}$.

La trasformazione appena definita stabilisce una corrispondenza biunivoca tra le sequenze non decrescenti di indici (che rappresentano le combinazioni con ripetizione di $k$ elementi da $A$) e le sequenze strettamente crescenti di $k$ numeri presi da $\{1, 2, \dots, n+k-1\}$. Queste ultime sono esattamente le combinazioni semplici di $k$ elementi da un insieme di $n+k-1$ elementi, il cui numero è dato da
$$
\binom{n+k-1}{k}
$$

Pertanto, il numero di combinazioni con ripetizione $C_{n,k}$ è proprio quel valore.

Questa dimostrazione evidenzia come il problema delle combinazioni con ripetizione possa essere ridotto a quello delle combinazioni semplici, tramite una trasformazione che converte una sequenza non decrescente di indici in una sequenza strettamente crescente.



```{=latex}
\subsection*{Coefficienti combinatori}
```

I coefficienti combinatori misurano il numero di modi in cui si possono selezionare o distribuire gli elementi. 

Coefficiente binomiale
: Rappresenta il numero di modi in cui si possono scegliere $k$ elementi da un insieme di $n$ elementi, senza considerare l'ordine. Il suo valore è dato da:
$$
\binom{n}{k} = \binom{n}{k,\, n{-}k} = \dfrac{n!}{k!\,(n-k)!}
$$

Coefficiente multinomiale
: Generalizza il concetto del coefficiente binomiale e indica il numero di modi per suddividere $n$ elementi in $r$ gruppi distinti di dimensioni $k_1, \dots, k_r$ dove $k_1 + \dots + k_r = n$. Il suo valore è dato da:
\hfill \vspace{2mm}
$$
\binom{n}{k_1, k_2, \cdots, k_r} = \dfrac{n!}{k_1!\, k_2!\, \cdots\, k_r!}
$$

\hfill

Si osserva che il coefficiente binomiale è il caso particolare del coefficiente multinomiale quando si divide l'insieme in due gruppi: uno di grandezza $k$ e l'altro di grandezza $n-k$. La somma delle cardinalità dei due gruppi distinti continua a essere $n$, infatti $k + (n-k) = n$.




```{=latex}
\hfill
```

# Introduzione alla Probabilità

Il concetto di probabilità di un evento, quando si effettua un esperimento, è passabile di diverse interpretazioni filosofiche:

1. Interpretazione frequentista: la probabilità di un evento viene intesa come il limite del rapporto tra il numero di volte in cui l’evento si verifica e il numero totale di prove, quando queste sono ripetute indefinitamente. 
2. Interpretazione soggettivistica: la probabilità non è vista come una proprietà oggettiva dell’esito, ma come una misura del livello di fiducia che lo studioso ripone nel verificarsi dell’evento.

Indipendentemente dall'approccio che si favorisce, utilizzando un approccio matematico ed i suoi strumenti, come per esempio la notazione insiemistica, è possibile formalizzare le regole e gli assiomi della teoria della probabilità.

## Definizioni

Prima di enunciare gli assiomi della teoria della probabilità, occorre introdurre alcuni concetti fondamentali relativi agli esperimenti e ai loro esiti.

### Spazio degli esiti

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Spazio degli esiti}
```

Esperimento
: Un esperimento è un procedimento o una prova condotta in condizioni controllate, il cui risultato è incerto.
\vspace{1mm}

Esito
: L'esito è un possibile risultato ottenuto da un esperimento. Si indica con $\omega$ e appartiene allo spazio degli esiti: $\omega \in \Omega$.
\vspace{1mm}

Spazio degli esiti
: Lo spazio degli esiti (o insieme universo o spazio campionario) è l'insieme dei possibili esiti dell'esperimento, e si indica con $\Omega$. L'universo può essere:

    - finito o infinito, a seconda del numero di esiti possibili
    - discreto se gli esiti sono isolati e contabili, o continuo se gli esiti formano un continuum. In questo contesto, la distinzione tra spazi discreti e continui riguarda la struttura complessiva di $\Omega$, e non le proprietà intrinseche degli elementi stessi

\vspace{1mm}

### Evento

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Evento}
```

Un evento $E$ è un sottoinsieme dello spazio degli esiti, perciò $E \subseteq \Omega$. Un evento formato da un solo esito $\{\omega\}$ è detto evento elementare. Per definizione, $\Omega$ rappresenta l'evento certo mentre $\varnothing$ è l'evento impossibile.

#### Operazioni

Dati due eventi $E, F \subseteq \Omega$, è possibile applicare le operazioni fondamentali degli insiemi:

- Unione $E \cup F$: è l'evento che si verifica quando si verifica almeno uno tra $E$ e $F$.  
    Per un esito $x$ si ottiene che $\;x \in E \cup F \; \Leftrightarrow\; x \in E \lor x \in F$

- Intersezione $E \cap F$: è l'evento che si verifca quando si verificano entrambi gli eventi $E$ e $F$.  
    Per un esito $x$ si ottiene che $\;x \in E \cap F \; \Leftrightarrow\; x \in E \land x \in F$  
    Se $E \cap F = \varnothing$ allora $E$ e $F$ si dicono *mutualmente esclusivi* o *eventi disgiunti*.

- Complementare $E^C$ di $E$: è l'evento che si verifica quando non si verifica $E$ . Si indica anche con $\overline{E}$.  
    Per un esito $x$ si ottiene che $\;x \in E^C \; \Leftrightarrow\; x \not \in E$  
    Si osserva che $E^C = \Omega - E$. Vale anche la relazione $\Omega^C = \varnothing$.

- Differenza $E \smallsetminus F$: è l'evento che si verifica quando $E$ si verifica ma non $F$.
    Per un esito $x$ si ottiene che $x \in E \smallsetminus F \; \Leftrightarrow \; x \in E \land x \not\in F$  
    Si osserva che questa operazione non è simmetrica, infatti $E \smallsetminus F \not = F \smallsetminus E$.

È possibile definire l'unione o l'intersezione di più eventi. Si considerino gli eventi $E_1, E_2, \dots, E_n$:

- la loro unione $\bigcup_{i=1}^n E_i = E_1 \cup \dots \cup E_n$ è l'evento formato da tutti gli esiti che appartengono ad almeno uno degli eventi $E_i$

- la loro intersezione $\bigcap^n_{i=1} E_i = E_1 \cap \dots \cap E_n$ è l'evento formato da tutti gli esiti che appartengono a tutti gli eventi $E_i$

In altre parole, l'unione degli $E_i$ si verifica se almeno uno degli eventi $E_i$ si verifica, mentre l'intersezione degli $E_i$ si verifica solo se tutti gli $E_i$ si verificano.

Inclusione
: È inoltre possibile definire delle relazioni di inclusione e uguaglianza tra eventi. Siano $E, F \subseteq \Omega$ due eventi, si dice che l'evento $E$ è contenuto in $F$, e si scrive $E \sube F$, se tutti gli esiti di $E$ appartengono anche a $F$. Formalmente, si può indicare questa relazione come $E \sube F \; \Leftrightarrow \; \forall\, \omega \in E: \omega \in F$. Questo significa che se si verifica $E$, allora si verifica anche $F$. Si osserva che se $E \subseteq F \land F \subseteq E \; \Rightarrow \; E = F$.

#### Proprietà

Per l'unione e l'intersezione valgono le seguenti proprietà (verranno presentate solo sull'unione):

- commutatività: $\;E \cup F = F \cup E$
- associatività: $\; E \cup F \cup G = (E \cup F) \cup G = E \cup (F \cup G)$
- distributività: $\; E \cup (F \cap G) = (E \cup F) \cap (E \cup G)$

- leggi di assorbimento: $\; E \cup (E \cap F) = E \;$ e $\; E \cap (E \cup F) = E$ 

- leggi di De Morgan:  $\; \overline{E \cup F} = \overline{E} \cap \overline{F}\;$ e $\;\overline{E \cap F} = \overline{E} \cup \overline{F}$

  **Dimostrazione**

  1. $x \in \overline{E \cup F} \;\Rightarrow\; x \not\in E \cup F \;\Rightarrow\; x \not\in E \land x \not\in F \;\Rightarrow\; x \in \overline{E} \land x \in \overline{F} \;\Rightarrow\; x \in \overline{E} \cap \overline{F} \;\Rightarrow\; \overline{E \cup F} \subseteq \overline{E} \cap \overline{F}$

  2. $x \in \overline{E} \cap \overline{F} \;\Rightarrow\; x \in \overline{E} \land x \in \overline{F} \;\Rightarrow\; x \notin E \land x \notin F \;\Rightarrow\; x \notin E \cup F \;\Rightarrow\; x \in \overline{E \cup F} \;\Rightarrow\; \overline{E} \cap \overline{F} \subseteq \overline{E \cup F}$

  Da entrambe le inclusioni si ottiene che $\overline{E \cup F} = \overline{E} \cap \overline{F}$.

\vspace{1mm}

Un modo rigoroso per dimostrare queste proprietà consiste nel verificare che ogni esito appartenente all'evento al primo membro è anche contenuto nell'evento al secondo membro, e viceversa, proprio come si è fatto pocanzi tramite la dimostrazione della legge di De Morgan.



##### Diagrammi di Venn

Un tipo di rappresentazione grafica degli eventi, utile per illustrare le relazioni logiche che li legano, sono i *diagrammi di Venn*. Lo spazio degli esiti $\Omega$ è rappresentano da un rettangolo che contiene il resto della figura. Gli eventi da prendere in considerazione sono invece rappresentati da cerchi disegnati all'interno del rettangolo. A questo punto si evidenziano gli eventi complessi rilevanti.



Si illustrano le operazioni di unione, intersezione, complemento e inclusione tramite i diagrammi di Venn:

```{=latex}
\vspace{1mm}
\noindent
% --- 1) Unione E ∪ F ---
\begin{minipage}{0.3\linewidth}
  \centering
  \begin{tikzpicture}[scale=1]
    % Rettangolo di contorno (universo Ω): da (-2, -1.4) a (2, 1.6)
    \draw[thick] (-2,-1.4) rectangle (2,1.6);
    % Etichetta del rettangolo: Ω in alto a sinistra
    \node[anchor=north west] at (-2,1.6) {$\Omega$};

    % UNIONE: coloriamo in grigio le aree coperte dai cerchi di E e F
    \begin{scope}
      \clip (-0.5,0) circle (1);
      \fill[gray!40] (-2,-1.4) rectangle (2,1.6);
    \end{scope}
    \begin{scope}
      \clip (0.5,0) circle (1);
      \fill[gray!40] (-2,-1.4) rectangle (2,1.6);
    \end{scope}

    % Disegno dei due cerchi
    \draw (-0.5,0) circle (1);
    \draw (0.5,0) circle (1);

    % Etichette degli insiemi: E e F posizionate a y = 1.2
    \node at (-0.9,1.2) {$E$};
    \node at (0.9,1.2) {$F$};
  \end{tikzpicture}

  \vspace{0.5em}
  \(E \cup F\)
\end{minipage}
\hfill
% --- 2) Intersezione E ∩ F ---
\begin{minipage}{0.3\linewidth}
  \centering
  \begin{tikzpicture}[scale=1]
    % Rettangolo di contorno (universo Ω): da (-2, -1.4) a (2, 1.6)
    \draw[thick] (-2,-1.4) rectangle (2,1.6);
    % Etichetta del rettangolo: Ω in alto a sinistra
    \node[anchor=north west] at (-2,1.6) {$\Omega$};

    % INTERSEZIONE: coloriamo in grigio la parte comune dei cerchi di E e F
    \begin{scope}
      \clip (-0.5,0) circle (1);
      \clip (0.5,0) circle (1);
      \fill[gray!40] (-2,-1.4) rectangle (2,1.6);
    \end{scope}

    % Disegno dei due cerchi
    \draw (-0.5,0) circle (1);
    \draw (0.5,0) circle (1);

    % Etichette degli insiemi: E e F posizionate a y = 1.2
    \node at (-0.9,1.2) {$E$};
    \node at (0.9,1.2) {$F$};
  \end{tikzpicture}

  \vspace{0.5em}
  \(E \cap F\)
\end{minipage}
\hfill
% --- 3) Complemento di F ---
\begin{minipage}{0.3\linewidth}
  \centering
  \begin{tikzpicture}[scale=1]
    % Rettangolo di contorno (universo Ω): da (-2, -1.4) a (2, 1.6)
    \draw[thick] (-2,-1.4) rectangle (2,1.6);

    % COMPLEMENTO di F: coloriamo l'intera area del rettangolo in grigio (con margini minimi)
    \fill[gray!40] (-1.99,-1.39) rectangle (1.99,1.59);
    % "Buchiamo" (ritagliamo) l'area di F in bianco, per evidenziare il complemento di F
    \begin{scope}
      \clip (-2,-1.4) rectangle (2,1.6);
      \fill[white] (0,0) circle (1);
    \end{scope}

    % Disegno del cerchio di E
    \draw (0,0) circle (1);
    
    % Disegno del cerchio E concentrico all'interno di F (raggio 0.56)
    \draw (0,0) circle (0.5);
    % Etichetta del cerchio interno E
    \node at (-0.46,0.54) {$E$};

    % Etichetta dell'insieme F
    \node at (0.65,1.08) {$F$};

	\node[anchor=north west] at (-2,1.6) {$\Omega$};
	
  \end{tikzpicture}

  \vspace{0.5em}
  \(\overline{F},\, E \subseteq F \)
\end{minipage}
```



\hfill

### Algebra degli eventi

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Algebra degli eventi}
```

Un'algebra degli eventi $\mathcal{A}$ su $\Omega$ è una collezione di sottoinsiemi di $\Omega$, ossia $\mathcal{A}\subseteq \mathcal{P}(\Omega)$, tale che:

1. $\Omega \in \mathcal{A}:\;$ l'evento certo fa parte dell'algebra

2. $\forall E \in \mathcal{A} \; \Rightarrow\; \overline{E} \in \mathcal{A}:\;$ chiusura rispetto al complementare

3. $\forall E, F \in \mathcal{A} \;\Rightarrow \; E \cup F \in \mathcal{A}:\;$ chiusura rispetto all'unione di due eventi

\vspace{3mm}

Da queste proprietà discendono varie conseguenze:

- $\varnothing \in \mathcal{A}\,$ perché $\, \varnothing = \overline{\Omega}$ 

- Per induzione, $\mathcal{A}$ è chiusa per l'unione finita, infatti $\forall E_1, E_2, \dots, E_n \in \mathcal{A} \quad \bigcup^n_{{i=1}} E_i \in \mathcal{A}$.

- $\mathcal{A}$ è chiusa rispetto all'intersezione di due eventi: $\,A \cap B = \overline{\overline{A} \cup \overline{B}}$, e per induzione anche rispetto all'intersezione finita: $\forall E_1, E_2, \dots, E_n \in \mathcal{A} \quad \bigcap^n_{{i=1}} E_i \in \mathcal{A}$

- $\mathcal{A}$ è chiusa rispetto alla differenza finita: $\, E \smallsetminus F = E \cap \overline{F}$ 

Se $\Omega$ è finito, l'algebra più grande che si possa considerare è $\mathcal{P}(\Omega)$, l'insieme di tutte le parti di $\Omega$.

#### $\boldmath{\sigma}$-algebra

Sia $\mathcal{A} \sube \mathcal{P}(\Omega)$ un'algebra su $\Omega$. Se per ogni famiglia numerabile di insiemi $\{E_i\}_{i \in \mathbb{N}} \sube \mathcal{A}$ vale

\vspace{-4mm}
$$
\bigcup^{\infty}_{i=1} E_i \in \mathcal{A}
$$
\vspace{-4mm}

allora $\mathcal{A}$ si dice $\sigma$-algebra e si indica con $\mathcal{F}$. Da ciò discende, per De Morgan, anche la chiusura rispetto alle intersezioni numerabili. Gli elementi di una $\sigma$-algebra si dicono insiemi *misurabili*.

Insieme numerabile
: Un insieme è detto numerabile se i suoi elementi sono in numero finito oppure se possono essere messi in corrispondenza biunivoca con $\mathbb{N}$. Se un insieme numerabile ha un numero infinito di elementi, viene detto infinito numerabile, e dato che può essere messo in corrispondenza biunivoca con i numeri naturali, si può dire che un insieme è infinito numerabile se ha la cardinalità di $\mathbb{N}$.

Se $\Omega$ è finito, l'insieme di tutte le parti ha cardinalità $|\mathcal{P}(\Omega)| = 2^{|\Omega|}$ ed è quindi finito anch'esso. In questo caso, ogni algebra $\mathcal{A} \sube \mathcal{P}(\Omega)$, che è chiusa per unioni finite, è automaticamente una $\sigma$-algebra, poiché ogni unione numerabile coincide con una unione finita. $\mathcal{P}(\Omega)$ rappresenta la $\sigma$-algebra più grande possibile.  
Nel caso in cui $\Omega$ sia infinito, $\mathcal{P}(\Omega)$ è certamente una $\sigma$-algebra, ma in genere non è quella che si usa in contesti di misura, perché spesso si considerano $\sigma$-algebre proprie (strettamente più piccole).

\vspace{2.5mm}

Spazio misurabile
: Una volta fissata una $\sigma$-algebra $\mathcal{F}$ su $\Omega$, la coppia $(\Omega, \mathcal{F})$ si chiama *spazio misurabile*. Qui $\mathcal{F}$ individua i sottoinsiemi di $\Omega$ considerati misurabili, ossia quelli ai quali sarà in seguito possibile associare una misura in modo coerente. Lo spazio misurabile è dunque la struttura formata dallo spazio degli esiti $\Omega$ e dalla famiglia $\mathcal{F}$ di sottoinsiemi ammessi.



#### Isomorfismo tra algebre

Due spazi misurabili $(\Omega_1, \mathcal{F}_1)$ e $(\Omega_2, \mathcal{F}_2)$ si dicono isomorfi se esiste una funzione biunivoca $\phi: \mathcal{F}_1 \to \mathcal{F}_2$ che preserva le operazioni fondamentali, cioè:

- Per ogni $E \in \mathcal{F}_1$, vale $\phi(\overline{E}) = \overline{\phi(E)}$
- Per ogni coppia $E, F \in \mathcal{F}_1$, vale $\phi(E \cup F) = \phi(E) \cup \phi(F)$

La mappa $\phi$ è un isomorfismo di algebre booleane, il che implica che le due strutture hanno la stessa struttura misurabile, pur essendo definite su spazi degli esiti differenti. Questo significa che, per ogni proprietà, operazione o misura che possiamo definire su una delle algebre, c’è una corrispondenza diretta nell’altra.

> **Esempio** Si consideri il lancio di una moneta, per il quale la $\sigma$-algebra è  
> $\mathcal{F}_M = \{\varnothing, \{T\}, \{C\}, \Omega_M\},$ dove $T$ sta per testa, $C$ per croce e $\Omega_M = \{T, C\}$.
>
> Per il lancio di un dado, supponiamo di considerare solo due eventi, ottenuti partizionando lo spazio degli esiti $\Omega_D = \{1,2,3,4,5,6\}$ in $\mathcal{F}_D = \{\varnothing, \{1,2\}, \{3,4,5,6\}, \Omega_D\}$. $\mathcal{F}_D$ è un'algebra ammissibile diversa dall'insieme delle parti $\mathcal{P}(\Omega_D)$. 
>
> Si definisce la mappa $\phi: \mathcal{F}_D \to \mathcal{F}_M$ mediante:
>
> - $\phi(\varnothing)=\varnothing$
> - $\phi(\{1,2\})=\{T\}$
> - $\phi(\{3,4,5,6\})=\{C\}$
> - $\phi(\Omega_D)=\Omega_M$
>
> È facile verificare che $\phi$ preserva il complementare e le unioni, quindi $\mathcal{F}_D$ e $\mathcal{F}_M$ sono isomorfe. In questo modo, funzionalmente, il lancio del dado (con questa specifica scelta di $\sigma$-algebra) si comporta come il lancio della moneta, pur essendo l'esperimento originariamente a sei esiti.



### Assiomi di Kolmogorov

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Assiomi di Kolmogorov}
```

Sperimentando un esperimento ripetutamente, mantenendo costanti le condizioni, si osserva empiricamente che la frazione di casi in cui si realizza un evento $E$ tende, al crescere del numero dei tentativi, a stabilizzarsi in un valore costante, che dipende unicamente da $E$. Questo valore costante è quello che intendiamo come probabilità dell'evento $E$.

Si consideri lo spazio misurabile $(\Omega, \mathcal{F})$. Definiamo la *misura di probabilità* come una funzione $\sigma$-additiva $\mathbb{P}:\mathcal{F}\to[0,1]$ che assegna a ciascun evento $E\in\mathcal{F}$ il numero $\mathbb{P}(E)$, ossia la probabilità che $E$ si verifichi. 

La funzione $\mathbb{P}$ deve soddisfare i seguenti assiomi (assiomi di Kolmogorov):

1. Non negatività:  
   $\forall E\in\mathcal{F} \quad \mathbb{P}(E)\ge0$
   
2. Normalizzazione:  
   $\mathbb{P}(\Omega)=1\quad$ l'evento certo ha probabilità $1$
   
3. Additività numerabile (o $\sigma$-additività):  
   Se $\{E_i\}_{i\in\mathbb{N}}\subseteq\mathcal{F}$ è una famiglia di eventi disgiunti (cioè, $E_i\cap E_j=\varnothing$ per ogni $i\neq j$), allora
   \vspace{-2mm}
   $$
   \mathbb{P}\Bigl(\bigcup_{i=1}^{\infty}E_i\Bigr)=\sum_{i=1}^{\infty}\mathbb{P}(E_i).
   $$

Questi assiomi formalizzano l'osservazione empirica: la probabilità, definita come la frequenza relativa limite, viene interpretata come una misura che assegna ad ogni evento misurabile un valore compreso tra 0 e 1, rispettando le proprietà di coerenza e additività.

Si osserva che per garantire una collezione di $n$ eventi $\{E_1, E_2, \dots, E_n\}$ sia considerata disgiunta, è necessario e sufficiente provare che ogni coppia di eventi distinti $E_i$ e $E_j$, con $i \neq j$, non abbia nessun elemento in comune, ossia che $E_i \cap E_j = \varnothing \quad \forall i \neq j$.

\vspace{2mm}

$\sigma$-additività
: Sia $\mathcal{A}$ un'algebra di insiemi. Una funzione $\mu: \mathcal{A} \rightarrow (-\infty, +\infty)$ è detta (finitamente) additiva se $\forall A, B \in \mathcal{A}$ disgiunti si ha $\mu(A \cup B) = \mu(A) +\mu(B)$. La funzione è detta numerabilmente additiva o $\sigma$-additiva se per ogni successione $A_1, \dots, A_n, \dots\, \in \mathcal{A}$ tra loro disgiunti e tali che la loro unione numerabile stia ancora in $\mathcal{A}$ si ha:

    \vspace{-5mm}
    $$
    \mu \Bigl( \bigcup^{\infty}_{n=1} A_n \Bigr) = \sum_{n=1}^{\infty} \mu(A_n)
    $$
    Ogni funzione $\sigma$-additiva è una funzione (finitamente) additiva, ma non vale il contrario



\vspace{2mm}

#### Proprietà

Sia $(\Omega, \mathcal{F}, \mathbb{P})$ uno spazio di probabilità. Sono allora vere le seguenti proprietà che verranno dimostrate.

##### Teorema 1

$\forall E \in \mathcal{F} \quad \mathbb{P}(\overline{E}) = 1 - \mathbb{P}(E)$

Dimostrazione:

\qquad - $E \cup \overline{E} = \Omega \land E \cap \overline{E} = \varnothing \;\; \Rightarrow \;\;
\text{I due insiemi sono disgiunti}$

\qquad - Dato che i due insiemi sono disgiunti, è possibile applicare il terzo assioma:

$\qquad\qquad 1 \overset{\;K2\;}{=} \mathbb{P}(\Omega) \overset{}{=} \mathbb{P}(E \cup \overline{E}) \overset{\;K3\;}{=} \mathbb{P}(E) + \mathbb{P}(\overline{E})$

$\qquad\qquad \mathbb{P}(E) + \mathbb{P}(\overline{E}) = 1 \;\; \Rightarrow\;\; \mathbb{P}(\overline{E}) = 1 - \mathbb{P}(E)$

\vspace{2mm}

##### Teorema 2

$\forall E,F \in \mathcal{F} \quad \mathbb{P}(E \cup F) = \mathbb{P}(E) + \mathbb{P}(F) - \mathbb{P}(E \cap F)$

Dimostrazione:

```{=latex}
\vspace{1mm}
\quad\begin{minipage}{0.285\linewidth}
  \centering
  
\begin{tikzpicture}[scale=1]
  % Rettangolo di contorno (universo Ω)
  \draw[thick] (-2,-1.4) rectangle (2,1.6);
  % Etichetta Ω
  \node[anchor=north west] at (-2,1.6) {$\Omega$};

  % Regione I: E \ F
  \begin{scope}
    \clip (-0.5,0) circle (1);
    \fill[gray!20] (-2,-1.4) rectangle (2,1.6);
  \end{scope}

  % Regione III: F \ E
  \begin{scope}
    \clip (0.5,0) circle (1);
    \fill[gray!20] (-2,-1.4) rectangle (2,1.6);
  \end{scope}

  % Regione II: E ∩ F (più scuro per distinguerla)
  \begin{scope}
    \clip (-0.5,0) circle (1);
    \clip (0.5,0) circle (1);
    \fill[gray!50] (-2,-1.4) rectangle (2,1.6);
  \end{scope}

  % Disegno dei due cerchi
  \draw (-0.5,0) circle (1);
  \draw (0.5,0) circle (1);

  % Etichette degli insiemi
  \node at (-0.9,1.2) {$E$};
  \node at (0.9,1.2) {$F$};

  % Etichette delle regioni
  \node at (-1.3,0) {I};
  \node at (0,0) {II};
  \node at (1.2,0) {III};
\end{tikzpicture}

  \vspace{0.3em}
  \small Suddivisione di \(E \cup F\)

\end{minipage}
\begin{minipage}{0.65\linewidth}
\vspace{-4.2mm}
	- Si suddivide l'evento $E \cup F$ in tre eventi distinti: \\[1mm]
	\noindent\hspace*{1em} 1. I = $E \cap \overline{F}$ \\
	\noindent\hspace*{1em} 2. II = $E \cap F$ \\
	\noindent\hspace*{1em} 3. III = $\overline{E} \cap F$ \\[3mm]
    \hspace{-2mm}\begin{tabular}{@{}l@{\hspace{1mm}}p{1\linewidth}}
    - & Dal diagramma di Venn si osserva che questi tre eventi sono disgiunti a due a due. 
       Si dimostra ora algebricamente che I e II sono disgiunti. 
    \end{tabular}
	
\end{minipage}
\vspace{2mm}
```



\qquad - I e II sono disgiunti $\;\; \Leftrightarrow \;\; (\text{I} \cup \text{II} = E) \land (\text{I} \cap \text{II} = \varnothing)$

\qquad\qquad $(E \cap \overline{F}) \cup (E \cap F) = E \cup (\overline{F} \cap F) = E \cup \varnothing = E$

\qquad\qquad $(E \cap \overline{F}) \cap (E \cap F) = (E \cap E) \cap (F \cap \overline{F}) = E \cap \varnothing = \varnothing$

```{=latex}
\qquad \begin{tabular}{@{}l@{\hspace{1mm}}p{0.93\linewidth}}
- & Si è quindi dimostrato che I e II sono due eventi disgiunti. Dimostrandolo analogamente per le altre coppie, è possibile poi applicare il terzo assioma su questi tre eventi disgiunti:
\end{tabular}
```

\qquad\qquad $\mathbb{P}(E \cup F) = \mathbb{P}(\text{I} \cup \text{II} \cup \text{III}) \overset{\;K3\;}{=}  \underbrace{\mathbb{P}(\text{I}) + \mathbb{P}(\text{II})}_{\Large \mathbb{P}(E)} + \underbrace{\mathbb{P}(\text{III}) \textcolor[rgb]{0.65,0.65,0.65}{\; +\; \mathbb{P}(\text{II})}}_{\Large \mathbb{P}(F)} \textcolor[rgb]{0.65,0.65,0.65}{- \mathbb{P}(\text{II})} = \mathbb{P}(E) + \mathbb{P}(F) + \mathbb{P}(E \cap F)$



##### Teorema 3

$\mathbb{P}(\varnothing) = 0$

Dimostrazione:

\qquad - $\overline{\Omega} = \varnothing$

\qquad - $\mathbb{P}(\overline{\Omega}) \overset{\;T1\;}{=} 1 - \mathbb{P}(\Omega) \;\; \Rightarrow \;\; \mathbb{P}(\varnothing) = 1 - \mathbb{P}(\Omega) \;\; \overset{\;K2\;}{\Rightarrow} \;\; \mathbb{P}(\varnothing) = 1-1=0$

##### Teorema 4

$\forall E \in \mathcal{F} \quad \mathbb{P}(E) \le 1$

Dimostrazione:

\qquad - $\mathbb{P}(\overline{E}) \overset{\;T1\;}{=}  1 - \mathbb{P}(E) \;\; \overset{K1}{\Rightarrow} \;\; \mathbb{P}(\overline{E}) = 1 - \mathbb{P}(E) \ge 0 \;\; \Rightarrow \;\; \mathbb{P}(E) \le 1$

##### Teorema 5

$\forall E, F \in \mathcal{F} ~|~ E \sube F \quad \mathbb{P}(E) \le \mathbb{P}(F)$

Dimostrazione:

\qquad - Dato che $E \sube F$, allora si può scrivere $F = E \cup (F \smallsetminus E)$ con $E \cap (F \smallsetminus E) = \varnothing$

\qquad - $E$ e $F\smallsetminus E$ sono quindi due eventi disgiunti ed è quindi possibile applicare il terzo assioma:

\qquad\qquad $\mathbb{P}(F) \overset{\;K3\;}{=} \mathbb{P}(E) + \mathbb{P}(F \smallsetminus E) \;\; \overset{\;K1\;}{\Rightarrow} \;\; \mathbb{P}(F\smallsetminus E) \ge 0 \;\; \Rightarrow \;\; \mathbb{P}(F) \ge \mathbb{P}(E)$



\hfill

### Spazio di probabilità

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Spazio di probabilità}
```

Se $\mathcal{F}$ è una $\sigma$-algebra definita sullo spazio degli esiti $\Omega$ e $\mathbb{P}$ è una misura di probabilità definita su $\mathcal{F}$ che soddisfa gli assiomi di Kolmogorov, allora la terna $(\Omega, \mathcal{F}, \mathbb{P})$ è detta spazio di probabilità.

#### Spazio equiprobabile

Se nello spazio di probabilità $(\Omega, \mathcal{F}, \mathbb{P})$ lo spazio degli esiti $\Omega$ è finito e $\forall \omega \in \Omega$ si ha che $\mathbb{P}(\{\omega\})$ è costante, allora lo spazio di dice equiprobabile.

Essendo $\Omega$ finito, lo si può considerare come $\{\omega_1, \omega_2, \dots, \omega_N\}$, e di conseguenza la sua cardinalità è $|\Omega| = N$. L'equiprobabilità degli esiti si scrive come $\mathbb{P}(\{\omega_1\}) = \mathbb{P}(\{\omega_2\}) = \cdots = \mathbb{P}(\{\omega_N\}) = p$.

Dagli assiomi 1 e 3 segue che
$$
1 \overset{\;K1\;}{=} \mathbb{P}(\Omega) = \mathbb{P}(\{\omega_1\} \cup \dots \cup \{\omega_N\}) \overset{\;K3\;}{=} \mathbb{P}(\{\omega_1\}) + \dots + \mathbb{P}(\{\omega_N\}) = N p
$$
da cui si deduce che
$$
\mathbb{P}(\{\omega_i\}) = \dfrac{|\{\omega_i\}|}{|\Omega|} = p =\dfrac{1}{N} \quad\; \forall i \in \{1,\dots,N\}
$$
\vspace{-1mm}

Si consideri un evento $E \sube \Omega$, ed essendo $E$ finito sia la sua cardinalità $|E| = k$. Inidichiamo genericamente gli elementi di $E$ con $\{e_1', \dots, e_k '\}$ per sottolineare che sono $k$ elementi arbitrari di $\Omega$, e non necessariamente i primi $k$. Riapplicando gli assiomi si ha:
$$
\mathbb{P}(E) = \mathbb{P}(\{e_1', \dots, e_k'\}) = \mathbb{P}(\{e_1'\} \cup \dots \cup \{e_k'\}) \overset{\;K3\;}{=} \sum_{i=1}^k \mathbb{P}(\{e_i'\}) = \sum_{i=1}^k p = pk = \dfrac{k}{N} = \dfrac{|E|}{|\Omega|}
$$
Si definisce $\mathbb{P}(E) = \dfrac{|E|}{|\Omega|} = \dfrac{\text{\# casi favorevoli}}{\text{\# casi possibili}}\,$ come la regola classica per il calcolo delle probabilità.

\vspace{3mm}

Se $\Omega$ è infinito non è possibile definire una probabilità equiprobabile nel senso in cui ogni esito riceve la stessa probabilità positiva $p$. Infatti se $|\Omega| = \infty$ allora $p \rightarrow 0$, ma se $\forall \omega \in \Omega$ si ha che $\mathbb{P}(\{\omega\}) = 0$, allora gli assiomi di Kolmogorov non sono più soddisfatti e si giunge ad un assurdo. Questo vale per spazi discreti.



\hfill

## Probabilità condizionata

Si definisce *probabilità condizionata* la probabilità che si verifichi un evento $E$ sapendo che si è già verificato un altro evento $F$. La probabilità condizionata di $E$ dato $F$ si indica con $\mathbb{P}(E|F)$, oppure $\mathbb{P}_F(E)$, e si può definire a patto che la probabilità di $F$ sia diversa da zero.

La probabilità condizionata subentra tutte le volte che si vuole calcolare la probabilità di un evento $E$, detto *evento condizionato*, assumendo che si sia già verificato un altro evento $F$, detto *evento condizionante*. L'incertezza dell'evento $E$ è quindi solo parziale ed è limitata al sottoinsieme degli esiti in cui $F$ si verifica.

Utilizzando la definizione classica di probabilità, vale la seguente formula sulla probabilità condizionata:
$$
\mathbb{P}(E|F) = \dfrac{\mathbb{P}(E \cap F)}{\mathbb{P}(F)} \quad \text{con } \mathbb{P}(F) \not= 0
$$
Infatti, se si è verificato l'evento $F$, affinché si verifichi anche $E$ il caso deve aver favorito un elemento che sta sia in $E$ che in $F$, ovvero che appartiene all'intersezione $E \cap F$. In secondo luogo, il verificarsi di $F$ restringe lo spazio degli esiti ai soli elementi di $F$, escludendo quelli che non vi appartengono. L'evento condizionante diventa quindi il nuovo spazio degli esiti, sostituendo $\Omega$.

Nel caso in cui $F = \varnothing$, e quindi $\mathbb{P}(F) = 0$, non è possibile calcolare $P(E|F)$ che è perciò detta indefinita.

> **Esempio** Si immagini di tirare due dadi. Lo spazio degli esiti di questo esperimento è descritto  
> da $\Omega = \{ (x,y) \;\, | \;\, x,y \in \{1,\dots, 6\}  \}$ dove si intende che si ottiene l'esito $(x,y)$ se il risultato del primo dado è $x$ e quello del secondo $y$. Si supponga che entrambi i dadi non siano truccati, e di trovarci quindi in uno spazio equiprobabile dove $\mathbb{P}((x,y)) = 1/|\Omega| = 1/36$.
>
> ```{=latex}
> \begin{minipage}{0.35\linewidth}
> 	\centering
>  \begin{tikzpicture}[scale=0.45]
>      % Assi con frecce
>      \draw[->] (0,0) -- (7,0) node[below] {$x$};
>      \draw[->] (0,0) -- (0,7) node[left] {$y$};
> 
>      % Unico 0 in obliquo all'origine
>      \node[below left] at (0,0) {0};
> 
>      % Tacche e etichette sugli assi (1..6)
>      \foreach \x in {1,2,3,4,5,6} {
>          \draw (\x,0) -- (\x,-0.1) node[below] {\x};
>      }
>      \foreach \y in {1,2,3,4,5,6} {
>          \draw (0,\y) -- (-0.1,\y) node[left] {\y};
>      }
> 
>      % Retta x+y = 8
>      \draw[color=gray!60] (1.1,6.9) -- (6.9,1.1);
>      % Retta x = 3
>      \draw[color=black] (3,0) -- (3,6.9);
> 
>      % Rombi per la retta x+y=8, escluso l'intersezione (3,5)
>      \foreach \p in {(2,6), (4,4), (5,3), (6,2)} {
>          \draw[rotate around={45:\p}, color=gray!70] \p 
>              ++(-0.2,0) -- ++(0.2,0.2) -- 
>              ++(0.2,-0.2) -- ++(-0.2,-0.2) -- cycle;
>      }
> 
>      % Rombi per la retta x=3, escluso l'intersezione (3,5)
>      \foreach \y in {1,2,3,4,6} {
>          \draw[rotate around={45:(3,\y)}, color=black] (3,\y) 
>              ++(-0.2,0) -- ++(0.2,0.2) -- 
>              ++(0.2,-0.2) -- ++(-0.2,-0.2) -- cycle;
>      }
> 
>      % Evidenzia l'intersezione (3,5) con un quadrato grosso
>      \draw[black,thick] (2.8,4.8) rectangle (3.2,5.2);
> 
>      % Griglia di punti (i, j) con i, j = 1..6
>      \foreach \x in {1,2,3,4,5,6} {
>          \foreach \y in {1,2,3,4,5,6} {
>              \fill (\x,\y) circle (2.5pt);
>          }
>      }
>      
>      \node[color=gray!60, font=\small] at (2,6.6) {$E$};
>      \node[color=black, font=\small] at (3.4,6.6) {$F$};
> 
>  \end{tikzpicture}
> \end{minipage}
> \begin{minipage}{0.65\linewidth}
> 	Sia $E = \{(x,y) \in \Omega \;\,|\;\, x\, +\, y = 8 \}$ l'evento che si verifica quando la somma dei due dadi lanciati vale 8. Graficamente, queste coppie $(x,y)$ stanno sulla retta $x\,+\,y=8$ nel diagramma: si hanno quindi 5 possibili coppie valide. \\[3mm]
> 	Se si calcola la probabilità di questo evento, si ottiene: \\[-2mm]
> 	$$
> 	\mathbb{P}(E) = \dfrac{|E|}{|\Omega|} = \dfrac{5}{36}
> 	$$
> \end{minipage}
> ```
>
> Si supponga ora che il primo dado sia risultato in un 3, si vuole ancora calcolare la probabilità che $E$ si verifichi. Possedendo questa informazione, si definisce $F = \{(x,y) \in \Omega \;\, | \;\, x = 3\}$ come l'evento condizionante. Graficamente, si osserva che l'evento $F$ contiene esattamente 6 esiti; di conseguenza $\mathbb{P}(F) = |F|/|\Omega| = 1/6$.
>
> Calcolando $\mathbb{P}(E|F)$ si ottiene la probabilità di $E$ sapendo che $F$ si è verificato. Per definizione:
> $$
> \mathbb{P}(E|F) = \dfrac{\mathbb{P}(E \cap F)}{\mathbb{P}(F)} = \dfrac{1/36}{1/6} = \dfrac{1}{6}
> $$
> $E \cap F$ è infatti l'insieme degli esiti che soddisfano sia $x+y = 8$ che $x=3$. Graficamente, si osserva che le due rette si incontrano in un unico punto, e di conseguenza $|E \cap F| = 1$.
>
> Nel diagramma, l'evento $F$ è rappresentato dalla retta verticale $x=3$ mentre $E$ è rappresentato dalla retta obliqua $x+y = 8$. Una volta saputo che il primo dado risulta in un 3, rimangono solo 6 possibili esiti, ossia quelli della retta verticale: lo spazio degli esiti è quindi ridotto da $\Omega$ a $F$. Tra questi punti, solo uno realizza la somma 8, ossia quella all'incrocio delle due rette.
>
> Si noti come $\mathbb{P}(E)$ differisca da $\mathbb{P}(E |F)$: l’informazione sul primo dado modifica la probabilità  
> che la somma dei due dadi sia 8, mostrando il ruolo decisivo della probabilità condizionata.

\newpage

Si osserva che la definizione di probabilità condizionata è compatibile con l'interpretazione frequentista della probabilità degli eventi. Quest'ultima considera la probabilità come il limite del rapporto tra il numero di volte in cui si verifica un evento e il totale delle prove, al crescere indefinito di queste ultime. Pertanto, la probabilità condizionata rappresenta la frequenza relativa con cui $E$ si verifica tra le prove in cui $F$ è accaduto, rendendo la definizione coerente con l’approccio empirico.

##### Definizione rigorosa

Dato uno spazio misurabile $(\Omega, \mathcal{F})$ di misura $\mathbb{P}$, ogni evento $F$ eredita una struttura di spazio misurato $(F, \mathcal{A}_F, \mathbb{P})$, restringendo gli insiemi misurabili a quelli contenuti in $F$, ed induce una nuova misura $\mathbb{P}_F'(E) = \mathbb{P}(E \cap F)$ su $(\Omega, \mathcal{F})$, con $\mathbb{P}_F'(\Omega) = P(F)$.  
Se $(\Omega, \mathcal{F}, \mathbb{P})$ è uno spazio di probabilità (valgono quindi gli assiomi di Kolmogorov, tra cui $\mathbb{P}(\Omega) = 1$) e $F$ non è trascurabile (ossia $\mathbb{P}(F) \not= 0$), allora riscalando $\mathbb{P}_F'$ a $\mathbb{P}_F = \frac{1}{\mathbb{P}(F)}\, \mathbb{P}_F'$ si ottiene lo spazio di probabilità $(\Omega, \mathcal{F}, \mathbb{P}_F)$ condizionato dall'evento $F$.



\hfill

### Teorema delle probabilità totali

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Teorema delle probabilità totali}
```

#### Regola di fattorizzazione

Siano $E$ e $F$ due eventi in uno spazio di probabilità $(\Omega, \mathcal{F}, \mathbb{P})$. Se $\mathbb{P}(F) \not= 0$, moltiplicando entrambi i membri della formula della probabilità condizionata di $E$ dato $F$ per $\mathbb{P}(F)$ si ottiene $\mathbb{P}(E \cap F) = \mathbb{P}(E|F)\, \mathbb{P}(F)$

```{=latex}
\begin{center}
  % Minipage 1
  \begin{minipage}{0.3\linewidth}
    \centering
    \begin{tikzpicture}[scale=1]
      % Rettangolo di contorno (universo Ω)
      \draw[thick] (-2,-1.4) rectangle (2,1.6);
      \node[anchor=north west] at (-2,1.6) {$\Omega$};

      % Disegno dei cerchi: E (centro a -0.5,0), F (centro a 0.5,0)
      \draw (0.5,0) circle (1);
      \draw (-0.5,0) circle (1);
      
      % Etichette E e F
      \node at (-0.9,1.2) {$E$};
      \node at (0.9,1.2) {$F$};

      % Colorazione del cerchio F in grigio chiaro
      \begin{scope}
        \clip (0.5,0) circle (1);
        \fill[gray!40] (-2,-1.4) rectangle (2,1.6);
      \end{scope}
      % Cerchio E tratteggiato
      \draw[dashed] (-0.5,0) circle (1);

      % Etichette probabilità
      \node at (1.02,0) {$\mathbb{P}(F)$};
      \node at (-1.02,0) {$\mathbb{P}(E)$};
    \end{tikzpicture}
  \end{minipage}
  % Minipage 2
  \begin{minipage}{0.3\linewidth}
    \centering
    \begin{tikzpicture}[scale=1]
      % Rettangolo di contorno (universo Ω)
      \draw[thick] (-2,-1.4) rectangle (2,1.6);
      \node[anchor=north west] at (-2,1.6) {$\Omega$};

      % Cerchi E e F
      \draw (-0.5,0) circle (1);
      \draw (0.5,0) circle (1);

      % Etichette E e F (posizionate un po' in basso)
      \node at (-1.25,-1) {$E$};
      \node at (1.25,-1) {$F$};

      % Colorazione dell'intersezione E ∩ F
      \begin{scope}
        \clip (-0.5,0) circle (1);
        \clip (0.5,0) circle (1);
        \fill[gray!70] (-2,-1.4) rectangle (2,1.6);
      \end{scope}

      % Etichetta interna
      \node at (0,1.25) {\(\mathbb{P}(E \cap F)\)};
    \end{tikzpicture}
  \end{minipage}
  % Minipage 3
  \begin{minipage}{0.3\linewidth}
    \centering
    \begin{tikzpicture}[scale=1]
      % Forziamo la stessa bounding box invisibile dei primi due
      \path[draw=none] (-2,-1.4) rectangle (2,1.6);
      % Eventuale label in alto a sinistra
      \node[anchor=north west] at (-2,1.6) {\(\mathbb{P}(E|F)\)};

      % Disegno del cerchio F
      \draw (0.5,0) circle (1);

      % Colora F in grigio chiaro
      \begin{scope}
        \clip (0.5,0) circle (1);
        \fill[gray!40] (-2,-1.4) rectangle (2,1.6);
      \end{scope}

      % Colora E∩F in grigio scuro, usando il cerchio di E come clip (non disegnato)
      \begin{scope}
        \clip (0.5,0) circle (1);   % F
        \clip (-0.5,0) circle (1); % E (clip invisibile)
        \fill[gray!70] (-2,-1.4) rectangle (2,1.6);
      \end{scope}

      % Etichetta per l'intersezione
      \node at (0,0) {\(E \cap F\)};
      \node at (1.25,-1) {$F$};
    \end{tikzpicture}
  \end{minipage}

\end{center}
\vspace{4mm}
```

Allo stresso modo, se $\mathbb{P}(E) \not= 0$, moltiplicando entrambi i membri della formula della probabilità condizionata di $F$ dato $E$ per $\mathbb{P}(E)$ si ottiene $\mathbb{P}(F \cap E) = \mathbb{P}(F|E)\, \mathbb{P}(E)$

```{=latex}
\begin{center}

  % Minipage 1: Diagramma per P(E) (l'evento condizionante per P(F|E))
  \begin{minipage}{0.3\linewidth}
    \centering
    \begin{tikzpicture}[scale=1]
      % Rettangolo di contorno (universo Ω)
      \draw[thick] (-2,-1.4) rectangle (2,1.6);
      \node[anchor=north west] at (-2,1.6) {$\Omega$};
      
      % Disegno dei cerchi: E (centro a -0.5,0) e F (centro a 0.5,0)
      \draw (-0.5,0) circle (1);
      \draw (0.5,0) circle (1);
      
      % Etichette E e F
      \node at (-0.9,1.2) {$E$};
      \node at (0.9,1.2) {$F$};
      
      % Colorazione del cerchio E (condizionante per P(F|E))
      \begin{scope}
        \clip (-0.5,0) circle (1);
        \fill[gray!40] (-2,-1.4) rectangle (2,1.6);
      \end{scope}
      % Disegno tratteggiato del cerchio F
      \draw[dashed] (0.5,0) circle (1);
      
      % Etichette per le probabilità
      \node at (-1.02,0) {$\mathbb{P}(E)$};
      \node at (1.02,0) {$\mathbb{P}(F)$};
    \end{tikzpicture}
  \end{minipage}
  % Minipage 2: Diagramma per P(E ∩ F)
  \begin{minipage}{0.3\linewidth}
    \centering
    \begin{tikzpicture}[scale=1]
      \draw[thick] (-2,-1.4) rectangle (2,1.6);
      \node[anchor=north west] at (-2,1.6) {$\Omega$};
      
      % Disegno dei cerchi E e F
      \draw (-0.5,0) circle (1);
      \draw (0.5,0) circle (1);
      
      % Etichette E e F (posizionate in basso per chiarezza)
      \node at (-1.25,-1) {$E$};
      \node at (1.25,-1) {$F$};
      
      % Colorazione dell'intersezione E ∩ F
      \begin{scope}
        \clip (-0.5,0) circle (1);
        \clip (0.5,0) circle (1);
        \fill[gray!70] (-2,-1.4) rectangle (2,1.6);
      \end{scope}
      
      % Etichetta interna
      \node at (0,1.25) {\(\mathbb{P}(E \cap F)\)};
    \end{tikzpicture}
  \end{minipage}
  % Minipage 3: Diagramma per P(F|E)
  \begin{minipage}{0.3\linewidth}
    \centering
    \begin{tikzpicture}[scale=1]
      % Forza la stessa bounding box invisibile dei diagrammi precedenti
      \path[draw=none] (-2,-1.4) rectangle (2,1.6);
      \node[anchor=north west] at (-2,1.6) {\(\mathbb{P}(F|E)\)};
      
      % Disegno del cerchio E (l'evento condizionante)
      \draw (-0.5,0) circle (1);
      
      % Colora E in gray!40
      \begin{scope}
        \clip (-0.5,0) circle (1);
        \fill[gray!40] (-2,-1.4) rectangle (2,1.6);
      \end{scope}
      
      % Colora l'intersezione E ∩ F in gray!70, usando il cerchio F come clip
      \begin{scope}
        \clip (-0.5,0) circle (1);  % E
        \clip (0.5,0) circle (1);     % F (usato solo per clip)
        \fill[gray!70] (-2,-1.4) rectangle (2,1.6);
      \end{scope}
      
      % Etichetta per l'intersezione
      \node at (0,0) {\(E\cap F\)};
      \node at (-1.25,-1) {$E$};
    \end{tikzpicture}
  \end{minipage}

\end{center}
\vspace{4mm}
```

Essendo però $\mathbb{P}(F \cap E) = \mathbb{P}(E \cap F)$, si può concludere che:
$$
\mathbb{P}(E \cap F) = \mathbb{P}(E|F)\, \mathbb{P}(F) =\mathbb{P}(F|E)\, \mathbb{P}(E) \tag{6.2.1}
$$
Questa formula è detta *regola di fattorizzazione* e discende in maniera diretta dalla definizione di probabilità condizionata. Essa afferma che la probabilità dell'evento $E \cap F$ può essere vista sotto due prospettive equivalenti, a seconda dell'evento che decidiamo di considerare come condizionante.

Questa reciprocità nasce dal fatto che gli eventi $E \cap F$ e $F \cap E$ sono identici in quanto la loro intersezione è commutativa. Quindi $\mathbb{P}(E|F)$ e $\mathbb{P}(F|E)$ sono due modi diversi di esplorare lo stesso evento $E \cap F$, solo che prendono come spazio degli esiti di riferimento due eventi diversi, rispettivamente $F$ ed $E$.

\vspace{2mm}

\newpage

La regola di fattorizzazione ci permette di spezzare la probabilità di un evento E in parti più semplici, legate a condizioni note. Partendo dalla considerazione che qualsiasi evento può essere suddiviso rispetto a un altro o più eventi che lo partizionano, si ottiene la *formula delle probabilità totali*.

##### Formula binaria delle probabilità totali

Siano $E$ e $F$ due eventi in uno spazio di probabilità $(\Omega,\mathcal{F},\mathbb{P})$. Poiché $F$ e il complementare $\overline{F}$ costituiscono una partizione di $\Omega$, si può suddividere $E$ in due parti disgiunte:

```{=latex}
\vspace{1mm}
\begin{minipage}{0.285\linewidth}
  \centering
  
\begin{tikzpicture}[scale=1]
  % Rettangolo di contorno (universo Ω)
  \draw[thick] (-2,-1.4) rectangle (2,1.6);
  % Etichetta Ω
  \node[anchor=north west] at (-2,1.6) {$\Omega$};

  % Regione I: E \ F
  \begin{scope}
    \clip (-0.5,0) circle (1);
    \fill[gray!20] (-2,-1.4) rectangle (2,1.6);
  \end{scope}

  % Regione II: E ∩ F (più scuro per distinguerla)
  \begin{scope}
    \clip (-0.5,0) circle (1);
    \clip (0.5,0) circle (1);
    \fill[gray!50] (-2,-1.4) rectangle (2,1.6);
  \end{scope}

  % Disegno dei due cerchi
  \draw (-0.5,0) circle (1);
  \draw (0.5,0) circle (1);

  % Etichette degli insiemi
  \node at (-0.9,1.2) {$E$};
  \node at (0.9,1.2) {$F$};

  % Etichette delle regioni
  \node at (-1.3,0) {I};
  \node at (0,0) {II};
\end{tikzpicture}

  \vspace{0.3em}
  \small Suddivisione di $E$

\end{minipage}
\begin{minipage}{0.7\linewidth}
\vspace{-4mm}
	$E = \text{I} \cup \text{II} = (E \cap \overline{F}) \cup (E \cap F)$ \\[2mm]
	Poiché gli insiemi $E \cap F$ e $E \cap \overline{F}$ sono disgiunti, è possibile applicare il terzo assioma di Kolmogorov: \\[-3.5mm]
	$$ \mathbb{P}(E) = \mathbb{P}(E \cap \overline{F}) + \mathbb{P}(E \cap F) $$ \\[-4mm]
	Applicando la regola di fattorizzazione si ottiene: \\[-3.5mm]
	$$ \mathbb{P}(E) = \mathbb{P}(E|F)\, \mathbb{P}(F) + \mathbb{P}(E|\overline{F})\, \mathbb{P}(\overline{F}) $$
\end{minipage}
\vspace{2mm}
```

Si ottiene quindi una versiona binaria del teorema delle probabilità totali, limitata alla partizione $\{F, \overline{F}\}$:
$$
\mathbb{P}(E) = \mathbb{P}(E|F)\, \mathbb{P}(F) + \mathbb{P}(E|\overline{F})\, \mathbb{P}(\overline{F}) \tag{6.2.2}
$$
Si osserva che $\mathbb{P}(\overline{F}) = 1 - \mathbb{P}(F)$, di conseguenza andando a sostituire sopra si ha:
$$
\mathbb{P}(E) = \mathbb{P}(E|F)\, \mathbb{P}(F) + \mathbb{P}(E|\overline{F})\, (1-\mathbb{P}(F))
$$
\hfill

##### Formula estesa delle probabilità totali

Sia $(\Omega, \mathcal{F}, \mathbb{P})$ uno spazio di probabilità. Si consideri una *partizione* $\{F_1, F_2, \dots, F_n\}$ di $\Omega$, ovvero un insieme di eventi tali che:

- $F_i \not= \varnothing \quad \forall i \in \{1, \dots, n\}$

- $F_i \cap F_j = \varnothing \quad \forall i \neq j$
- $\displaystyle \bigcup_{i=1}^{n} F_i = \Omega$

\vspace{1mm}

Per un evento $E \subseteq \Omega$, possiamo scrivere $E$ come unione disgiunta di più parti:
\vspace{-2mm}
$$
E \;=\; (E \cap F_1) \;\cup\; (E \cap F_2) \;\cup\;\cdots\;\cup\;(E \cap F_n) = \bigcup_{i=1}^n (E \cap F_i)
$$

\vspace{-4mm}
dove $(E \cap F_i) \cap (E \cap F_j) = \varnothing$ per $\forall i,j \mid i \neq j$.

Essendo $E$ l'unione di eventi disgiunti, è possibile applicare il terzo assioma di Kolmogorov:
\vspace{-2mm}
$$
\mathbb{P}(E) \;=\; \mathbb{P} \Bigl(\, \bigcup_{i=1}^n (E \cap F_i) \,\Bigr)
\overset{\;K3\;}{=} \sum_{i=1}^n \mathbb{P}(E \cap F_i)
$$

Tramite la regola di fattorizzazione, per ogni $F_i$ con $\mathbb{P}(F_i) \neq 0$ si ottiene $\mathbb{P}(E \cap F_i) = \mathbb{P}(E | F_i)\,\mathbb{P}(F_i)$

Sommando su tutti gli indici $i$ si ottiene dunque la *formula delle probabilità totali in forma estesa*:
\vspace{-2mm}
$$
\mathbb{P}(E) = \sum_{i=1}^n \mathbb{P}(E | F_i)\,\mathbb{P}(F_i) \tag{6.2.3}
$$

Questa relazione generalizza il caso binario $\{ F, \overline{F} \}$ e permette di calcolare $\mathbb{P}(E)$ suddividendo lo spazio degli esiti in una partizione $\{F_1, F_2, \ldots, F_n\}$. In tal modo, ciascun insieme $F_i$ ha probabilità $\mathbb{P}(F_i)$ e, all’interno di ciascuno, si considera la probabilità condizionata $\mathbb{P}(E | F_i)$. Sommando tutti i contributi $\mathbb{P}(E|F_i)\,\mathbb{P}(F_i)$ si ottiene $\mathbb{P}(E)$.



\newpage

## Teorema di Bayes

Una volta chiarite la regola di fattorizzazione e la formula (o teorema) delle probabilità totali, è naturale introdurre il teorema di Bayes, che fornisce un modo per capovolgere il condizionamento di un evento $E$ rispetto a un altro evento $F$.

Siano $E$ e $F$ due eventi di uno spazio di probabilità $(\Omega, \mathcal{F}, \mathbb{P})$ con $\mathbb{P}(E)\neq 0$. Allora vale la seguente formula:
$$
\mathbb{P}(F | E)
= \frac{\mathbb{P}(E | F)\,\mathbb{P}(F)}{\mathbb{P}(E|F)\, \mathbb{P}(F) + \mathbb{P}(E|\overline{F})\, \mathbb{P}(\overline{F})}
= \frac{\mathbb{P}(E | F)\,\mathbb{P}(F)}{\mathbb{P}(E)} \tag{6.3.1}
$$

\vspace{1mm}

Dimostrazione
: Tramite la formula $(6.2.1)$ si è visto che $\mathbb{P}(E\cap F)$ può essere scritta in 2 modi equivalenti:

    \vspace{-4mm}
    $$
    \mathbb{P}(E\cap F) = \mathbb{P}(E| F)\,\mathbb{P}(F) = \mathbb{P}(F| E)\,\mathbb{P}(E)
    $$
    Dato che $\mathbb{P}(E) \neq 0$, isolando $\mathbb{P}(F|E)$ si ottiene proprio la formula di Bayes. Si ricordi che tramite la formula binaria delle probabilità totali $(6.2.2)$ si ha che $\mathbb{P}(E|F)\, \mathbb{P}(F) + \mathbb{P}(E|\overline{F})\, \mathbb{P}(\overline{F}) = \mathbb{P}(E)$.

\vspace{3mm}

Mentre $\mathbb{P}(E|F)$ descrive la probabilità che $E$ accada dopo che $F$ è avvenuto, $\mathbb{P}(F|E)$ sposta l’attenzione su $F$, supponendo di aver già osservato $E$.  
Inoltre il denominatore $\mathbb{P}(E)$ funge da normalizzatore: rappresenta la probabilità totale di $E$ e assicura che la probabilità condizionata $\mathbb{P}(F|E)$ sia un numero tra 0 e 1.



##### Forma estesa

Estendendo il ragionamento a una partizione generale di $\Omega$, si ottiene la forma estesa del teorema di Bayes. Sia $\{F_1,\dots,F_n\}$ una partizione di $\Omega$ e $\mathbb{P}(F_i)\neq0$ per ogni $i$, e sia $E$ sia un evento tale per cui $\mathbb{P}(E)\neq0$, allora:
$$
\mathbb{P}(F_i | E)
=
\frac{\mathbb{P}(E | F_i)\,\mathbb{P}(F_i)}
{\displaystyle \sum_{k=1}^n \mathbb{P}(E | F_k)\,\mathbb{P}(F_k)} 
= \dfrac{\mathbb{P}(E | F_i)\,\mathbb{P}(F_i)}{\mathbb{P}(E)}
\tag{6.3.2}
$$
dove il denominatore è $\mathbb{P}(E)$ per via della formula estesa delle probabilità totali.



\hfill

### Classificatori naive Bayes

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Classificatori naive-Bayes}
```

Un classificatore è un meccanismo che, dati degli oggetti (individui) su cui si vuole effettuare una distinzione, associa a ciascun oggetto una classe tra quelle disponibili. Per esempio, potremmo suddividere gli individui in “positivi” o “negativi” rispetto a una determinata condizione.

Nel contesto di un classificatore bayesiano, si sfrutta il teorema di Bayes per valutare la probabilità che un individuo appartenga a una certa classe, sulla base delle proprietà che abbiamo osservato per quell’individuo. In generale, se consideriamo:

- $n$ proprietà (o variabili aleatorie) $X_1,\dots,X_n$, con valori $\{x_1,\dots,x_n\}$
- $m$ classi $\{y_1,\dots,y_m\}$ (ognuna corrisponde a un evento $\{Y\,{=}\,y_k\}$)

Per un individuo di cui abbiamo misurato $(x_1,\dots,x_n)$ come realizzazioni di $X_1,\dots,X_n$, vorremmo attribuirgli la classe $\{Y\,{=}\,y_k\}$ che risulta più "probabile" alla luce di tali proprietà. Il teorema di Bayes ci dice che:
$$
\mathbb{P}\bigl(Y \,{=}\, y_k \mid
X_1 \,{=}\, x_1,\, \dots,\, X_n \,{=}\, x_n\bigr)
\;=\;
\frac{\mathbb{P}\bigl(X_1 \,{=}\, x_1, \dots, X_n \,{=}\, x_n \mid
Y\,{=}\,y_k\bigr)\, \mathbb{P}(Y \,{=}\, y_k)}
{\mathbb{P}(X_1 \,{=}\, x_1,\dots, X_n \,{=}\, x_n)}
$$
Per classificare l’individuo, dobbiamo scegliere la classe $\{Y\,{=}\,y_k\}$ che massimizza la probabilità a posteriori $\mathbb{P}(Y\,{=}\,y_k \mid X_1\,{=}\,x_1,\dots,X_n\,{=}\,x_n)$. Tuttavia, la stima diretta della probabilità congiunta $\mathbb{P}(X_1 \,{=}\, x_1,\dots, X_n \,{=}\, x_n \mid Y\,{=}\,y_k)$ può risultare molto onerosa, poiché richiede di considerare tutte le combinazioni dei valori $(x_1,\dots,x_n)$.

Il classificatore naive Bayes semplifica tale stima assumendo che, condizionatamente alla classe $Y\,{=}\,y_k$, le variabili $X_1,\dots,X_n$ siano approssimativamente indipendenti. In formule:
$$
\mathbb{P}\bigl(X_1 \,{=}\, x_1,\dots, X_n \,{=}\, x_n \mid Y\,{=}\,y_k\bigr)
\;\approx\;
\prod_{i=1}^n \mathbb{P}\bigl(X_i \,{=}\, x_i \mid Y\,{=}\,y_k\bigr)
$$
Sostituendo questa ipotesi nella versione bayesiana precedente, si ottiene:
$$
\mathbb{P}\bigl(Y \,{=}\, y_k \mid
X_1 \,{=}\, x_1,\, \dots,\, X_n \,{=}\, x_n\bigr)
\;\approx\;
\frac{\displaystyle \mathbb{P}(Y \,{=}\, y_k)\, \prod_{i=1}^n \mathbb{P}\bigl(X_i \,{=}\, x_i \mid Y\,{=}\,y_k\bigr)}
{\mathbb{P}(X_1 \,{=}\, x_1,\dots, X_n \,{=}\, x_n)}
$$
Il denominatore $\mathbb{P}(X_1\,{=}\,x_1,\dots,X_n\,{=}\,x_n)$ non dipende dalla classe $y_k$ ma solo dai valori osservati $(x_1,\dots,x_n)$. Per la decisione di classificazione, cioè per confrontare le probabilità di classi diverse, esso funge da costante di normalizzazione, la stessa per ogni classe candidata. Di conseguenza, è sufficiente determinare la classe $\{Y\,{=}\,y_{k^*}\}$ che massimizza il prodotto:
$$
\mathbb{P}(Y \,{=}\, y_k)\;\prod_{i\,{=}\,1}^n \mathbb{P}(X_i \,{=}\, x_i \mid Y\,{=}\,y_k)
$$
In pratica, per classificare un individuo con proprietà $(x_1,\dots,x_n)$, si calcola per ogni classe $y_k$ il prodotto $\mathbb{P}(Y\,{=}\,y_k)\prod_{i=1}^n\mathbb{P}(X_i\,{=}\,x_i\mid Y\,{=}\,y_k)$ e si sceglie la classe che ne produce il valore più alto. In notazione compatta:
\vspace{-1mm}
$$
k^* =\arg\max_{k\in\{1,\dots,m\}}
\Bigl[\,
\mathbb{P}(Y\,{=}\, y_k)\,\prod_{i=1}^n
\mathbb{P}(X_i \,{=}\, x_i \mid Y\,{=}\,y_k)
\Bigr]
$$
\vspace{-1mm}

L’ipotesi di indipendenza condizionale riduce drasticamente il numero di stime necessarie per calcolare le probabilità, passando da una modellazione congiunta (potenzialmente esponenziale) a una sommatoria di stime “marginali” ($\sum_{i}|\mathcal{X}i|$ invece di $\prod{i}|\mathcal{X}_i|$).

Sebbene nella pratica le variabili $X_i$ possano non essere completamente indipendenti all’interno di una stessa classe (da cui l'aggettivo naive), l’approssimazione risulta spesso efficace in molti scenari, a fronte di una grande semplicità computazionale.



\hfill

## Eventi indipendenti

In generale, la probabilità condizionata $\mathbb{P}(E|F)$ differisce da $\mathbb{P}(E)$, poiché il verificarsi di $F$ fornisce informazioni che possono modificare la probabilità che si verifichi $E$. Tuttavia, se si ha $\mathbb{P}(E|F) = \mathbb{P}(E)$, allora si dice che gli eventi $E$ e $F$ sono *indipendenti*. Questo significa che la conoscenza del verificarsi di $F$ non influisce sulla probabilità che $E$ si realizzi.

Partendo dalla definizione di probabilità condizionata, l'uguaglianza $\mathbb{P}(E|F) = \mathbb{P}(E)$, per $\mathbb{P}(F) \neq 0$, implica

$$
\mathbb{P}(E|F) = \frac{\mathbb{P}(E \cap F)}{\mathbb{P}(F)} = \mathbb{P}(E)
$$

Moltiplicando entrambi i membri per $\mathbb{P}(F)$ si ottiene una definizione simmetrica di indipendenza:

$$
E,\, F \text{ indipendenti} \quad \Longleftrightarrow \quad \mathbb{P}(E \cap F) = \mathbb{P}(E)\,\mathbb{P}(F) \tag{6.4.1}
$$

Analogamente, ponendo $\mathbb{P}(F|E) = \mathbb{P}(F)$ per $\mathbb{P}(E) \neq 0$ si giunge alla medesima conclusione.

Questa relazione evidenzia che, se $E$ è indipendente da $F$, anche $F$ risulta indipendente da $E$, poiché entrambi gli enunciati implicano l'uguaglianza della probabilità dell'intersezione al prodotto delle probabilità marginali. 



La nozione di indipendenza si conserva rispetto ad alcune operazioni insiemistiche elementari tra eventi. In particolare, se due eventi sono indipendenti, anche semplici combinazioni di essi, come intersezioni, unioni o complementi, possono preservare la proprietà di indipendenza.

Nel seguito, si dimostra questo fatto per quanto riguarda l’operazione di complemento.

##### Teorema

Se $E$ e $F$ sono indipendenti, allora lo sono anche $E$ e $\overline{F}$.

Dimostrazione:

```{=latex}
\qquad
\begin{tabular}{@{}l@{\hspace{1mm}}p{0.93\linewidth}}

- & Affinché $E$ e $\overline{F}$ siano indipendenti, bisogna dimostrare che 
$\mathbb{P}(E \cap \overline{F}) = \mathbb{P}(E) \, \mathbb{P}(\overline{F})$

\vspace{3mm}
\begin{minipage}{0.285\linewidth}
  \raggedright
  
  \begin{tikzpicture}[scale=1]
    % Rettangolo di contorno (universo Ω)
    \draw[thick] (-2,-1.4) rectangle (2,1.6);
    % Etichetta Ω
    \node[anchor=north west] at (-2,1.6) {$\Omega$};

    % Riempi la porzione di E che appartiene a F (cioè, con y < 0.1-1.5x) in grigio scuro:
    \begin{scope}
      \clip (0,0.1) circle (1);
      \clip (-100,-100) -- (-100, {0.1 - 1.5*(-100)}) -- (100, {0.1 - 1.5*(100)}) -- (100,-100) -- cycle;
      \fill[gray!50] (0,0.1) circle (1);
    \end{scope}

    % Riempi la porzione di E che appartiene a F^c (cioè, con y > 0.1-1.5x) in grigio chiaro:
    \begin{scope}
      \clip (0,0.1) circle (1);
      \clip (-100, {0.1 - 1.5*(-100)}) -- (-100,100) -- (100,100) -- (100, {0.1 - 1.5*(100)}) -- cycle;
      \fill[gray!20] (0,0.1) circle (1);
    \end{scope}

    % Disegna il bordo del cerchio E
    \draw[semithick] (0,0.1) circle (1);
    
    % Disegno della linea obliqua: y = 0.1 - 1.5x (che passa per il centro del cerchio)
    \draw[semithick] (-1,1.6) -- (1,-1.4);

    % Etichette per il cerchio e le regioni
    \node at (0,1.37) {$E$};
    \node at (-1.7,-1) {$F$};
    \node at (1.7,1.2) {$\overline{F}$};
  \end{tikzpicture}
  
  \vspace{0.3em}
  \quad \small $E = (E \cap F) \cup (E \cap \overline{F})$

\end{minipage}
%
\begin{minipage}{0.7\linewidth}
\vspace{-6mm}

\begin{tabular}{@{}l@{\hspace{1mm}}p{0.93\linewidth}}
- & Osservando il diagramma, è possibile suddividere E in una \\[0.5mm]
& partizione $E = \{E \cap F, E \cap \overline{F}\}$:\\[1.5mm]
& \quad 1. $(E \cap F) \cup (E \cap \overline{F}) = E$ \\
& \quad 2. $(E \cap F) \cap (E \cap \overline{F}) = \varnothing$ \\[2mm]
& Diventa quindi possibile applicare il terzo assioma di Kolmogorov

\end{tabular}
\end{minipage} \\
\\[-1mm]
- & $\mathbb{P}(E) \overset{\;K3\;}{=} \mathbb{P}(E \cap F) + \mathbb{P}(E \cap \overline{F}) \;\;\Rightarrow\;\; \mathbb{P}(E \cap \overline{F}) = \mathbb{P}(E) - \mathbb{P}(E \cap F)$ \\[2mm]
- & Dato che $E$ e $F$ sono indipendenti, allora vale $\mathbb{P}(E \cap F) = \mathbb{P}(E)\, \mathbb{P}(F)$. Sostituendo, si ottiene: \\[2mm]
& \qquad $ \mathbb{P}(E \cap \overline{F}) = \mathbb{P}(E) - \mathbb{P}(E)\, \mathbb{P}(F)$ \\[2mm]
& \qquad$\mathbb{P}(E \cap \overline{F}) = \mathbb{P}(E) \left( 1 - \mathbb{P}(F) \right) = \mathbb{P}(E)\, \mathbb{P}(\overline{F})$
\end{tabular}
```



\hfill

#### Estensione dell'indipendenza

Si osserva che non è possibile estendere l'indipendenza a più eventi richiedendo solo l'indipendenza a coppie, similmente a quanto invece si fa per provare la disgiunzione tra più eventi.

>**Esempio** Si immagini di tirare due dadi. Lo spazio degli esiti di questo esperimento è descritto  
>da $\Omega = \{ (x,y) \;\, | \;\, x,y \in \{1, \dots, 6\}  \}$ dove si intende che si ottiene l'esito $(x,y)$ se il risultato del primo dado è $x$ e quello del secondo $y$. Si supponga che entrambi i dadi non siano truccati, e di trovarci quindi in uno spazio equiprobabile dove $\mathbb{P}((x,y)) = 1/|\Omega| = 1/36$.
>
>```{=latex}
>\begin{minipage}{0.35\linewidth}
>	\centering
> \begin{tikzpicture}[scale=0.5]
>     % Assi con frecce
>     \draw[->] (0,0) -- (7,0) node[below] {$x$};
>     \draw[->] (0,0) -- (0,7) node[left] {$y$};
>
>     % Unico 0 in obliquo all'origine
>     \node[below left] at (0,0) {0};
>
>     % Tacche e etichette sugli assi (1..6)
>     \foreach \x in {1,2,3,4,5,6} {
>         \draw (\x,0) -- (\x,-0.1) node[below] {\x};
>     }
>     \foreach \y in {1,2,3,4,5,6} {
>         \draw (0,\y) -- (-0.1,\y) node[left] {\y};
>     }
>
>     % Retta x+y = 7
>     \draw[color=black] (0.4,6.6) -- (6.6,0.4);
>     % Retta x = 4
>     \draw[color=gray!90] (4,0) -- (4,6.8);
>     % Retta y = 3
>     \draw[color=gray!80] (0,3) -- (6.8,3);
>
>
>     % Evidenzia l'intersezione (4,3) con un quadrato grosso
>     \draw[black,thick] (3.8,2.8) rectangle (4.2,3.2);
>
>     % Griglia di punti (i, j) con i, j = 1..6
>     \foreach \x in {1,2,3,4,5,6} {
>         \foreach \y in {1,2,3,4,5,6} {
>             \fill (\x,\y) circle (2.5pt);
>         }
>     }
>     
>     \node[color=black, font=\small] at (1,6.6) {$E$};
>     \node[color=gray!90, font=\small] at (4.4,6.6) {$F$};
>     \node[color=gray!80, font=\small] at (6.6,3.4) {$G$};
>
> \end{tikzpicture}
>\end{minipage}
>\begin{minipage}{0.65\linewidth}
>	\vspace{1mm}
>	
>	Si considerano i seguenti eventi: \\[1mm]
>	\noindent\hspace*{1em} $E = \{(x,y) \in \Omega \;|\; x + y = 7\} = \{\text{somma dei dadi è 7}\}$ \\[1mm]
>	\noindent\hspace*{1em} $F = \{(x,y) \in \Omega \;|\; x = 4\} = \{ \text{4 sul primo dado} \}$ \\[1mm]
>	\noindent\hspace*{1em} $G = \{(x,y) \in \Omega \;|\; y = 3\} = \{ \text{3 sul secondo dado} \}$ \\[-1mm]
>	
>	Calcolando le probabilità di ciascun evento, si trova che \\[-2.5mm]
>	$$ \mathbb{P}(E) = \mathbb{P}(F) = \mathbb{P}(F) = 1/6 $$ \\[-4.5mm]
>	Osservando il grafico a lato si osserva, infatti, che ogni evento, rappresentato dalla propria retta, contiene 6 esiti. Dividendo questa quantità per $|\Omega| = 36$ si ottiene proprio $1/6$.
>	
>\end{minipage}
>\vspace{2mm}
>```
>
>

\hfill

> Gli eventi sono indipendenti a coppie, infatti:
>
> ```{=latex}
> \vspace{-1mm}
> \noindent\hspace*{1em} $\mathbb{P}(E \cap F) = 1/36 = \mathbb{P}(E)\, \mathbb{P}(F)$ \\[1mm]
> \noindent\hspace*{1em} $\mathbb{P}(E \cap G) = 1/36 = \mathbb{P}(E)\, \mathbb{P}(G)$ \\[1mm]
> \noindent\hspace*{1em} $\mathbb{P}(F \cap G) = 1/36 = \mathbb{P}(F)\, \mathbb{P}(G)$
> ```
>
> Se si calcola $\mathbb{P}(E | F \cap G) = 1$, si osserva che la probabilità di $E$ dato $F \cap G$ risulta diversa dalla probabilità marginale $\mathbb{P}(E)$. Questo implica che $E$ è dipendente dal verificarsi di $F \cap G$, e di conseguenza i tre eventi $E$, $F$ e $G$ non sono indipendenti nel senso globale.  
> Infatti, affinché valga l’indipendenza complessiva, dovrebbe risultare $\mathbb{P}(E | F \cap G) = \mathbb{P}(E)$, condizione che in questo caso non è soddisfatta.

\hfill

Dati tre eventi $E$, $F$ e $G$, questi sono indipendenti se e solo se:

- $\mathbb{P}(E \cap F) = \mathbb{P}(E)\, \mathbb{P}(F)$
- $\mathbb{P}(E \cap G) = \mathbb{P}(E)\, \mathbb{P}(G)$
- $\mathbb{P}(F \cap G) = \mathbb{P}(F)\, \mathbb{P}(G)$
- $\mathbb{P}(E \cap F \cap G) = \mathbb{P}(E)\, \mathbb{P}(F)\, \mathbb{P}(G)$

\vspace{2mm}

Si può osservare come anche in questo contesto valga quanto discusso in precedenza: se gli eventi $E$, $F$ e $G$ sono indipendenti nel senso globale, allora anche eventi ottenuti tramite semplici operazioni insiemistiche (come intersezione, unione o complementare) risultano indipendenti senza necessità di ulteriori verifiche. Questa proprietà conferma che l’indipendenza si estende naturalmente agli eventi costruiti a partire da eventi già indipendenti.



##### Teorema

Se $E$, $F$ e $G$ sono indipendenti, allora anche $E$ e $F \cup G$ sono indipendenti.

Dimostrazione:

```{=latex}
\qquad
\begin{tabular}{@{}l@{\hspace{1mm}}p{0.93\linewidth}}

- & Affinché $E$ e $F \cup G$ siano indipendenti, bisogna dimostrare che 
$\mathbb{P}(E \cap (F \cup G)) = \mathbb{P}(E) \, \mathbb{P}(F \cup G)$ \\[2mm]

- & Si applica la proprietà distributiva su $E \cap (F \cup G)$: \\[2mm]
& \qquad $\mathbb{P}(E \cap (F \cup G)) = \mathbb{P}((E \cap F) \cup (E \cap G)) = \mathbb{P}(E \cap F) + \mathbb{P}(E \cap G) - \mathbb{P}(\underbrace{(E \cap F) \cap (E \cap G)}_{E \cap F \cap G})$ = \\
\\[-3mm]
& \qquad $= \mathbb{P}(E)\, \mathbb{P}(F) + \mathbb{P}(E)\, \mathbb{P}(G) - \mathbb{P}(E)\, \mathbb{P}(F)\, \mathbb{P}(G) = \mathbb{P}(E) [ \mathbb{P}(F) + \mathbb{P}(G) - \underbrace{\mathbb{P}(F)\, \mathbb{P}(G)}_{\mathbb{P}(F \cap G)} ] $ \\[3mm]
\\[-3mm]

- & Si osserva che $\mathbb{P}(F) + \mathbb{P}(G) - \mathbb{P}(F \cap G)$ corrisponde a $\mathbb{P}(F \cup G)$ dagli assiomi di Kolmogorov, di conseguenza si è dimostrato il teorema: \\[2mm]
& \qquad $\mathbb{P}(E) \left[ \mathbb{P}(F) + \mathbb{P}(G) - \mathbb{P}(F \cap G) \right] = \mathbb{P}(E)\, \mathbb{P}(F \cup G)$

\end{tabular}
```

\hfill

\vspace{2mm}

##### Generalizzazione dell'indipendenza

Si abbiano $n$ eventi $E_1, \dots, E_n \sube \Omega$, questi sono indipendenti se e solo se $\forall r \le n \quad \forall\, 1 \le \alpha_1 \le \alpha_2 \le \dots \le \alpha_r \le n\,$ con $\, \alpha_i \in \mathbb{N}$ si ha che
$$
\mathbb{P} \Big( \bigcap_{j=1}^r E_{\alpha_j} \Big) = \prod_{j=1}^r \mathbb{P}(E_{\alpha_j})
$$
Questo significa che, dati più eventi, l’indipendenza globale richiede che ogni intersezione di un numero qualsiasi di essi abbia probabilità uguale al prodotto delle probabilità dei singoli eventi coinvolti.


\newpage
# Variabili aleatorie
## Definizioni

Lo spazio $(\Omega,\mathcal F,\mathbb P)$ descrive tutti gli esiti possibili di un esperimento e assegna le probabilità agli eventi. Per analizzare quantitativamente questi esiti si ha bisogno di rappresentarli mediante numeri reali: risulta necessario introdurre perciò le variabili aleatorie. Una variabile aleatoria è una funzione $X\colon\Omega\to\mathbb R$ che, preservando la struttura misurabile, trasporta la misura di probabilità $\mathbb P$ da $\Omega$ alla retta reale. Grazie a questo “ponte” concetti come media, varianza e distribuzione, nonché gli strumenti dell’analisi, diventano applicabili a fenomeni aleatori di qualunque natura.

\vspace{2mm}
Definizione
: Dato uno spazio di probabilità $(\Omega, \mathcal{F}, \mathbb{P})$ e una $\sigma$-algebra $\mathcal{E}$ su $\mathbb{R}$, una variabile aleatoria $X : \Omega \to \mathbb{R}$ è definita come una funzione misurabile, ossia tale che per ogni $A \in \mathcal{E}$ l'evento

    \vspace{-4mm}
    $$
    \{X \in A\} \equiv \{\omega \in \Omega \mid X(\omega) \in A\} = X^{-1}(A)
    \vspace{-0mm}
    $$
    appartenga alla $\sigma$-algebra $\mathcal{F}$ di $\Omega$. In altre parole, questa condizione garantisce che, per ogni insieme misurabile $A$ in $\mathbb{R}$, il corrispondente sottoinsieme di $\Omega$ (cioè l’insieme degli esiti per cui $X$ assume valori in $A$) sia un evento a cui è possibile assegnare una probabilità.

\vspace{2mm}
In particolare, se si considera $A = \{\alpha\}$ per un qualsiasi $\alpha \in \mathbb{R}$, allora si ottiene l'evento
\vspace{-1mm}
$$
\{X = \alpha\} \equiv \{\omega \in \Omega \mid X(\omega) = \alpha\}
\vspace{-1mm}
$$
Questa forma è particolarmente usata quando si trattano variabili aleatorie discrete.

\vspace{2mm}
> **Approfondimento**
> Alla variabile aleatoria $X$ si associa una misura di probabilità indotta su $\mathbb R$:
> 
> \vspace{-4mm}
> $$
> \mathbb{P}_X\colon \mathcal{E}\to[0,1]
> \quad \text{ tale che } \quad
> \mathbb{P}_X(A) = \mathbb{P}\bigl( X^{-1} (A) \bigr) = \mathbb{P}(X \in A) \;\;\; \forall A \in \mathcal{E}
> $$
> Questa misura, detta distribuzione di probabilità (o legge) di $X$, trasporta lo spazio di probabilità $(\Omega, \mathcal{F}, \mathbb{P})$ nello spazio reale $(\mathbb{R}, \mathcal{E}, \mathbb{P}_X)$, permettendo di studiare le proprietà statistiche di $X$.
> 
> Essendo $\mathbb{P}_X$ una misura di probabilità, ed essendo $\mathbb{P}_X(\mathbb{R}) = \mathbb{P}(X^{-1}(\mathbb{R})) = \mathbb{P}(\Omega) = 1$, si ha che $(\mathbb{R}, \mathcal{E}, \mathbb{P}_X)$ è anche esso uno spazio di probabilità.

\vspace{1mm}
Per ogni insieme misurabile $A \in \mathcal{E}$, la probabilità che la variabile aleatoria $X$ assuma valori in $A$, ossia la probabilità dell'evento $\{X \in A\}$, è definita come
$$
\mathbb{P}(X \in A) = \mathbb{P}(\{\omega \in \Omega \mid X(\omega) \in A\})
$$

\vspace{3mm}
Supporto
: I valori che la variabile aleatoria $X$ può assumere sono detti *specificazioni* o *osservazioni*. L'insieme di tutte le specificazioni di $X$ costituisce il *dominio di supporto* della variabile, e si indica con $D_X$.

> **Definizione rigorosa** Il supporto di $X$ è il più piccolo insieme chiuso $S\subseteq\mathbb R$ tale che  
$\mathbb P(X\in S)=1$. In altre parole, un punto $x$ appartiene al supporto se e solo se ogni suo intorno aperto $U$ possiede probabilità positiva, $\mathbb P(X\in U)>0$.

\vspace{2mm}
\hfill
A seconda della natura del dominio di supporto, le variabili aleatorie possono essere classificate in due categorie principali: *discrete* e *continue*.
Una variabile aleatoria si dice discreta se può assumere solo un numero finito o infinito numerabile di valori, mentre si dice continua se può assumere valori in un intervallo (o insieme) non numerabile di $\mathbb{R}$.



\newpage
### Funzione di ripartizione
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Funzione di ripartizione}
```

La funzione di ripartizione, o funzione di distribuzione cumulativa, di una variabile aleatoria $X$ a valori reali è la funzione che associa a ciascun valore $x$ la probabilità che la variabile $X$ assuma valori minori o uguali a $x$.

In altre parole, è la funzione $F_X: \mathbb{R} \rightarrow [0,1]$ definita da
$$
F_X(x) = \mathbb{P}(X \le x) \quad \forall x \in \mathbb{R}
$$
\vspace{-8mm}


```{=latex}
\vspace{4.0mm}

\def\pA{0.16}   % p1
\def\pB{0.20}   % p2
\def\pC{0.25}   % p3
\pgfmathsetmacro{\pD}{1-\pA-\pB-\pC}

\pgfmathsetmacro{\Fone}{\pA}
\pgfmathsetmacro{\Ftwo}{\pA+\pB}
\pgfmathsetmacro{\Fthree}{\pA+\pB+\pC}

\begin{minipage}{0.40\textwidth}
    \begin{tikzpicture}[>=stealth,line cap=round]
    \begin{axis}[cdfaxis,
      tick style={black},                % ← mostra i tick
      ylabel={$F_{X}$},
      ylabel style={at={(axis description cs:-0.08,1)},
                   anchor=south,rotate=-90},
      ytick={0,\Fone,\Ftwo,\Fthree,1},
      yticklabels={$0$,$F(x_{1})$,$F(x_{2})$,$F(x_{3})$,$1$},
      xlabel={$x$},
      xlabel style={at={(axis description cs:1,0)},
                   anchor=north west,yshift=-2pt},
      xtick={0,1,2,3},
      xticklabels={$x_{1}$,$x_{2}$,$x_{3}$,$x_{4}$},
      xmin=-0.4, xmax=3.7, ymin=0, ymax=1.15,
      clip=false
    ]

      %----------------------------------------------
      %    segmenti orizzontali
      %----------------------------------------------
      \addplot[gray!30,very thick] coordinates {(-0.378,0) (0,0)};
      \addplot[gray!30,very thick] coordinates {(0,\Fone) (1,\Fone)};
      \addplot[gray!30,very thick] coordinates {(1,\Ftwo) (2,\Ftwo)};
      \addplot[gray!30,very thick] coordinates {(2,\Fthree) (3,\Fthree)};
      \addplot[gray!30,very thick] coordinates {(3,1) (3.7,1)};

      %----------------------------------------------
      %    segmenti verticali
      %----------------------------------------------
      \addplot[black,thin] coordinates {(0,0) (0,\Fone)};
      \addplot[black,thin] coordinates {(1,0) (1,\Ftwo)};
      \addplot[black,thin] coordinates {(2,0) (2,\Fthree)};
      \addplot[black,thin] coordinates {(3,0) (3,1)};

      %----------------------------------------------
      %    punti pieni/vuoti
      %----------------------------------------------
      \addplot[gray!30,only marks,mark=*]
               coordinates {(0,\Fone) (1,\Ftwo) (2,\Fthree) (3,1)};
      \addplot[white,draw=gray!30,very thick,
               mark=*,mark options={scale=1.25,fill=white},
               only marks]
               coordinates {(0,0) (1,\Fone) (2,\Ftwo) (3,\Fthree)};

    \end{axis}
    \end{tikzpicture}
\end{minipage}
\begin{minipage}{0.57\textwidth}
La funzione a gradini sulla sinistra rappresenta la funzione \\ di ripartizione $F_X$ di una variabile discreta con dominio di supporto $\{ x_1, x_2, x_3, x_4 \}$. Si osserva che:
\vspace{2mm}

\begin{itemize}
    \item ogni scalino verticale coincide con un valore specifico della variabile, e l'altezza dello scalino rappresenta la probabilità che la variabile assuma quel valore.

\vspace{1mm}
    \item i tratti orizzontali mostrano che in tutti gli intervalli aperti fra un punto e il successivo la probabilità non cambia, ossia la funzione è costante.
\end{itemize}
\end{minipage}
```
\vspace{1.5mm}
\begin{myquote_smaller} \textbf{Approfondimento} La definizione della variabile aleatoria $X$ come funzione misurabile implica che $\forall x \in \mathbb{R}$ l'insieme $\{X \le x\}$, che è l'immagine inversa dell'intervallo $(-\infty, x]$, sia un evento, ossia appartenga alla $\sigma$-algebra $\mathcal{F}$ dello spazio di probabilità su cui $X$ è definita. Senza questa condizione di misurabilità, non avrebbe senso assegnare una probabilità a tali eventi e, di conseguenza, la funzione di ripartizione non sarebbe ben definita. \end{myquote_smaller}


#### Proprietà
La funzione di ripartizione $F_X$ possiede le seguenti proprietà:

- $0 \le F_X(x) \le 1 \;\; \forall x \in \mathbb{R}$

- Monotonicità: $F_X$ è non decrescente, ossia se $x_1 < x_2$, allora $F_X(x_1) \le F_X(x_2)$.  
Questo riflette il fatto che $\{X \le x_1\} \sube \{ X \le x_2 \}$.

- Continuità a destra: per ogni $\displaystyle x \in \mathbb{R} \;\; \lim_{y \to x^+} F_X(y) = F_X(x)$

- Limiti estremi: $\displaystyle \lim_{x \to -\infty} F_X(x) = 0\,$ e $\,\displaystyle \lim_{x \to +\infty} F_X(x) = 1$

La funzione di ripartizione non è necessariamente continua a sinistra.

\vspace{3mm}
##### Proposizione
La probabilità che $X$ risieda in un intervallo semichiuso $(a,b]$, dove $a < b$, è
$$
\mathbb{P}(a < X \le b) = F_X(b) - F_X(a)
$$
\vspace{-8mm}

Dimostrazione

```{=latex}
\qquad - Si consideri l'evento $\{a < X \le b\}$ con $a < b$. È possibile affermare che

\begin{center}$\{X \le b\} = \{X \le a\} \cup \{a < X \le b\}$\end{center}

\hspace*{2.3em} dove $\{X \le a\}$ e $\{a < X \le b\}$ sono due eventi disgiunti. Utilizzando il terzo assioma di Kolmogorov:

\begin{center}$\mathbb{P}(X \le b)= \mathbb{P}(X \le a) + \mathbb{P}(a < X \le b)$\end{center}

\qquad - Riscrivendo il tutto utilizzando la funzione di ripartizione, si ha

\begin{center}$F_X(b) = F_X(a) +\mathbb{P}(a < X \le b)$\end{center}

\hspace*{2.3em} da cui si ottiene che $\mathbb{P}(a < X \le b) = F_X(b) - F_X(a)$. La tesi è quindi dimostrata.
```


\vspace{1mm}
> **Approfondimento** Si può quindi esprimere la probabilità di un qualsiasi evento relativo a $X$ in termini della funzione di ripartizione, sfruttando la rappresentazione degli eventi come unioni di intervalli semiaperti. 
>
> Sia $A \sube \mathbb{R}$ un evento della variabile $X$, allora si intende in realtà l'evento  
> $\{X \in A\} \equiv \{\omega \in \Omega \mid X(\omega) \in A \}$, ossia il sottoinsieme di $\Omega$ formato da tutti gli esiti $\omega$ per cui la trasformazione $X$ produce un valore appartentente all'insieme $A \sube \mathbb{R}$.
>
> $A$ può essere scritto eventualmente come un’unione disgiunta di intervalli della forma $(a, b]$. Di conseguenza, grazie alla proprietà già dimostrata per gli intervalli semiaperti, ossia  
> $\mathbb{P}(a < X \le b)=F_X(b)-F_X(a)$, si ottiene che
> $$
> \mathbb{P}(X\in A)=\sum_{k} \Bigl[F_X(b_k)-F_X(a_k)\Bigr]
> $$
> dove la somma è presa sulla rappresentazione disgiunta di $A$ in intervalli semiaperti $(a_k, b_k]$.





\hfill
## Variabili aleatorie discrete

Le variabili aleatorie discrete sono variabili il cui dominio di supporto è un insieme numerabile:
$$
D_X = \{ x \in \mathbb{R} \mid \mathbb{P}(X = x) > 0 \}
$$
Poiché il supporto $D_X$ di una variabile aleatoria discreta è numerabile e, in genere, consiste di punti isolati, esso può essere ordinato in una sequenza $(x_1, x_2, \dots)$. In questo contesto, ogni specificazione, salvo l'eventuale massimo, ha un successivo nell’ordine naturale dei numeri reali.

Questo insieme si determina esaminando i valori per cui la funzione di massa di probabilità non è zero.

Le probabilità di un evento $\{X \in A\}$, per ogni $A \sube D_X$, si ottiene sommando le probabilità dei valori di $X$ che ricadono in $A$:
$$
\mathbb{P}(X \in A) = \sum_{x \in A \cap D_X} \mathbb{P} (X = x)
$$

\hfill

Proposizione
: La somma delle probabilità di tutte le specificazioni deve essere $1$:
$$
\sum_{x \in D_X} \mathbb{P}(X=x) = 1
$$

\vspace{-2.5mm}
Dimostrazione

```{=latex}
\qquad - Se $D_X$ è il supporto di $X$, allora $\Omega$ si può scrivere come unione disgiunta di tutti gli eventi $\{X = x\}$  
\hspace*{2.3em} con $x \in D_X$, ossia:

\vspace{-2mm}
\begin{center}$\displaystyle \Omega = \bigcup_{x \in D_X} \{X = x\}$\end{center}

\hspace*{2.3em} perché ogni esito $\omega$ in $\Omega$ genera un valore $X(\omega)$ che appartiene al supporto.

\qquad - Essendo gli eventi $\{X = x\}$ a due a due disgiunti, è possibile applicare il terzo assioma di Kolmogorov:

\begin{center}$\displaystyle \mathbb{P}\Big( \bigcup_{x \in D_X} \{X = x\} \Big) = \sum_{x \in D_X} \mathbb{P}(X=x) = 1$\end{center}

\qquad - Infine, poiché l'unione copre interamente $\Omega$, per il primo assioma si ottiene:

\begin{center}$\displaystyle 1 = \mathbb{P}(\Omega) = \sum_{x \in D_X} \mathbb{P}(X=x)$\end{center}
``````

\hfill



### Funzione di probabilità

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Funzione di probabilità}
```

Data una variabile aleatoria discreta $X$, la sua *funzione di (massa di) probabilità* è una funzione di variabile reale che assegna ad ogni valore di $X$ la probabilità dell'evento elementare $\{X = x\}$.

- Come si vedrà successivamente, nel caso in cui $X$ sia continua, ogni singolo punto assume probabilità zero, e dunque la funzione di massa perde di significato; in tal caso si userà la funzione di densità.

\hfill
Formalmente, dato $X : \Omega \rightarrow \mathbb{R}$, la funzione di probabilità è la funzione $p_X: \mathbb{R} \rightarrow [0,1]$ definita da
$$
p_X(x) = \mathbb{P}(X = x) = \mathbb{P}(\{\omega \in \Omega \mid X(\omega) = x\}) \quad \forall x \in \mathbb{R}
$$
che associa ad ogni valore $x$ assunto da $X$ la probabilità che $X$ assuma esattamente quella specificazione.


\hfill
```{=latex}
%------------------------------------------------
% PARAMETRI DELLA DISTRIBUZIONE A 4 PUNTI
%------------------------------------------------
\def\pA{0.16}   % p1
\def\pB{0.30}   % p2
\def\pC{0.05}   % p3
\def\pD{0.23}


\pgfmathsetmacro{\Fone}{\pA}
\pgfmathsetmacro{\Ftwo}{\pA+\pB}
\pgfmathsetmacro{\Fthree}{\pA+\pB+\pC}

%------------------------------------------------
%   pmf a 4 punti (x1, x2, x3, x4)
%------------------------------------------------
\begin{minipage}{0.39\textwidth}
  \begin{tikzpicture}[>=stealth,line cap=round]
  \begin{axis}[pmfaxis,
    ylabel={$p_{X}$},
    ylabel style={at={(axis description cs:-0.08,1)},
                  anchor=south,rotate=-90},
    ytick={0,\pA,\pB,\pC,\pD},
    yticklabels={0,$p(x_1)$,$p(x_2)$,$p(x_3)$,$p(x_4)$},
    xlabel={$x$},
    xlabel style={at={(axis description cs:1,0)},
                  anchor=north west,yshift=-2pt},
    xtick={0,1,2,3},
    xticklabels={$x_{1}$,$x_{2}$,$x_{3}$,$x_{4}$},
    xmin=-0.4, xmax=3.7,
    ymin=0,  ymax=0.35,       % un po’ di margine sopra p_max = 0.30
    clip=false
  ]

    %--------------------------------------------
    %   asse x (linea di base)
    %--------------------------------------------
    \addplot[gray!30,very thick] coordinates {(-0.378,0) (3.6,0)};

    %--------------------------------------------
    %   barrette verticali
    %--------------------------------------------
    \addplot[black,thick] coordinates {(0,0) (0,\pA)};
    \addplot[black,thick] coordinates {(1,0) (1,\pB)};
    \addplot[black,thick] coordinates {(2,0) (2,\pC)};
    \addplot[black,thick] coordinates {(3,0) (3,\pD)};

    %--------------------------------------------
    %   punti pieni/vuoti
    %--------------------------------------------
    \addplot[gray!30,only marks,mark=*]
             coordinates {(0,\pA) (1,\pB) (2,\pC) (3,\pD)};
    \addplot[white,draw=gray!30,very thick,
             mark=*,mark options={scale=1.25,fill=white},
             only marks]
             coordinates {(0,0) (1,0) (2,0) (3,0)};

  \end{axis}
  \end{tikzpicture}
\end{minipage}
\begin{minipage}{0.58\textwidth}
Il diagramma a colonne a sinistra rappresenta la funzione di probabilità $p_X$ di una variabile discreta con dominio di supporto $\{ x_1, x_2, x_3, x_4 \}$. Si osserva che:
\vspace{2mm}

\begin{itemize}
    \item ogni colonna verticale rappresenta un valore specifico \\ della variabile, e l'altezza della colonna indica la probabilità che la variabile assuma quel valore.
\vspace{1mm}
    \item fra due colonne consecutive la probabilità è nulla, in quanto $X$ può assumere solo i valori specifici del supporto.
\end{itemize}
\end{minipage}
```


\vspace*{6mm}
Funzione indicatrice
: Sia $X : \Omega \rightarrow \mathbb{R}$ una variabile aleatoria discreta a valori reali con dominio di supporto  
$D_X = \{x \in \mathbb{R} \mid \mathbb{P}(X=x) > 0\}$. La funzione di massa di probabilità $p_X$ può essere espressa in forma compatta mediante la funzione indicatrice. Formalmente, si scrive

    \vspace{-4mm}
    $$
    p_X(x) = \mathbb{P}(X=x)\, I_{D_X}(x)
    $$
    dove $I_{D_X} : \mathbb{R} \rightarrow \{0,1\}$ è la funzione indicatrice dell'insieme $D_X$, definita come
    $$
    I_{D_X}(x)=
    \begin{cases}
    1 & \text{se } x \in D_X \\
    0 & \text{altrimenti}
    \end{cases}
    $$

    Nel caso in cui $X$ sia uniformemente distribuita su $D_X$, cioè se $\mathbb{P}(X=x) = c$ per ogni $x \in D_X$ (con $c$ costante tale che $\sum_{x \in D_X} c = 1$), la funzione di probabilità si semplifica a $p_X(x) = c \cdot I_{D_X}(x)$.


\hfill
#### Proprietà
La funzione di probabilità rispetta le seguenti proprietà:

- $\forall x \in \mathbb{R} \;\; p_X(x) \ge 0$: trattandosi di una probabilità, questa funzione non può assumere valori negativi

- $p_X(x) \not = 0$ solo per $x \in \mathbb{R} \land x\in D_X$

- per $x \not \in D_X$ si assume che $p_X(x) = 0\,$[^2]

[^2]: L’uso della funzione indicatrice $I_{D_X}(x)$ garantisce formalmente che la funzione di probabilità sia definita unicamente sui valori appartenenti al supporto $D_X$. Infatti, per ogni $x \notin D_X$ abbiamo $I_{D_X}(x) = 0$, e quindi $p_X(x) = \mathbb{P}(X=x) \cdot I_{D_X}(x) = 0$. Questo esplicita il fatto che ogni $x$ non preso in considerazione (ossia, per cui $\mathbb{P}(X=x) = 0$) viene escluso dalla definizione di $p_X$.


\hfill
Proposizione
: Come già dimostrato in precedenza, la somma delle probabilità su tutto il supporto di $X$ deve essere pari a 1. Di conseguenza, se $D_X$ è numerabile, scrivendo $p_X(x) = \mathbb{P}(X = x)$ si ottiene
\vspace{-1mm}
$$
\sum_{x \in D_X} p_X(x) = 1
$$

\hfill
#### Relazione tra funzione di ripartizione e di probabilità

Sia $F_X$ la funzione di ripartizione di $X$ e sia $p_X$ la sua funzione di probabilità. La prima rappresenta la somma cumulativa dei valori della seconda.

Per definizione si ha che $F_X(x) = \mathbb{P}(X \le x)$ e, per una variabile discreta con dominio di supporto numerabile, possiamo esprimere $F_X(x)$ come la somma delle probabilità associate a tutti i valori $y \in D_X$ tali che $y \le x$. In altre parole
$$
F_X(x) = \sum_{ y \le x} p_X(y)
$$
Questo significa che, per ogni valore $x$, la funzione $F_X(x)$ è data dal contributo cumulativo dei salti indotti da ciascun valore specifico di $X$ minore o uguale a $x$.

>**Approfondimento** In particolare, se $x_0$ è un punto in cui $X$ può assumere un valore, ossia $x_0 \in D_X$, allora il salto di $F_X$ in $x_0$ è proprio
>$$
>F_X(x_0) - \lim_{x\to x_0^-} F_X(x) = p_X(x_0)
>$$
>Indicando con $F_X(x^-)$ il limite sinistro della $F_X$ in $x$, si può riscrivere l'equazione precedente in
>$$
>p_X(x) = F_X(x) - F_X(x^-)
>$$
>Da ciò si deduce che se $X$ è una variabile aleatoria continua, tale valore è nullo in ogni punto poiché la sua funzione di ripartizione è continua, e di conseguenza $F_X(x) = F_X(x^-)$


\vspace{4mm}
```{=latex}
%------------------------------------------------
%  PROBABILITÀ (3 punti)
%------------------------------------------------
\def\pA{0.33}          % p(x1)
\def\pB{0.15}          % p(x2)
\pgfmathsetmacro{\pC}{1-\pA-\pB}   % p(x3) = 0.70

\pgfmathsetmacro{\Fone}{\pA}
\pgfmathsetmacro{\Ftwo}{\pA+\pB}

%------------------------------------------------
%  GRAFICI AFFIANCATI
%------------------------------------------------
\begin{center}
\begin{minipage}{0.46\textwidth}
\centering
\begin{tikzpicture}[>=stealth,line cap=round]
\begin{axis}[pmfaxis,
  ylabel={$p_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},
                  anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},
                  anchor=north west,yshift=-2pt},
  ytick={0,\pA,\pB,\pC,1},
  yticklabels={0,$p(x_1)$,$p(x_2)$,$p(x_3)$,1},
  xtick={0,1,2},
  xticklabels={$x_{1}$,$x_{2}$,$x_{3}$},
  xmin=-0.4, xmax=2.6,
  ymin=0,  ymax=1.15,      % margine sopra p_max = 0.70
  clip=false
]
  % asse x
  \addplot[gray!30,very thick] coordinates {(-0.4,0) (2.5,0)};
  % barrette
  \addplot[black,thick] coordinates {(0,0) (0,\pA)};
  \addplot[black,thick] coordinates {(1,0) (1,\pB)};
  \addplot[black,thick] coordinates {(2,0) (2,\pC)};
  % punti pieni / vuoti
  \addplot[gray!30,only marks,mark=*] coordinates {(0,\pA) (1,\pB) (2,\pC)};
  \addplot[white,draw=gray!30,very thick,
           mark=*,mark options={scale=1.25,fill=white},
           only marks] coordinates {(0,0) (1,0) (2,0)};
\end{axis}
\end{tikzpicture}
\end{minipage}
\begin{minipage}{0.46\textwidth}
\centering
\begin{tikzpicture}[>=stealth,line cap=round]
\begin{axis}[cdfaxis,
  ylabel={$F_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},
                  anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},
                  anchor=north west,yshift=-2pt},
  ytick={0,\Fone,\Ftwo,1},
  yticklabels={$0$,$F(x_{1})$,$F(x_{2})$,$1$},
  xtick={0,1,2},
  xticklabels={$x_{1}$,$x_{2}$,$x_{3}$},
  xmin=-0.4, xmax=2.6, ymin=0, ymax=1.15,
  clip=false
]
  % segmenti orizzontali
  \addplot[gray!30,very thick] coordinates {(-0.4,0) (0,0)};
  \addplot[gray!30,very thick] coordinates {(0,\Fone) (1,\Fone)};
  \addplot[gray!30,very thick] coordinates {(1,\Ftwo) (2,\Ftwo)};
  \addplot[gray!30,very thick] coordinates {(2,1) (2.6,1)};
  % segmenti verticali (salti = p_i)
  \addplot[black,thin] coordinates {(0,0) (0,\Fone)};
  \addplot[black,thin] coordinates {(1,\Fone) (1,\Ftwo)};
  \addplot[black,thin] coordinates {(2,\Ftwo) (2,1)};
  % punti pieni / vuoti
  \addplot[gray!30,only marks,mark=*] coordinates {(0,\Fone) (1,\Ftwo) (2,1)};
  \addplot[white,draw=gray!30,very thick,
           mark=*,mark options={scale=1.25,fill=white},
           only marks] coordinates {(0,0) (1,\Fone) (2,\Ftwo)};
\end{axis}
\end{tikzpicture}
\end{minipage}
\end{center}
```
Sopra si propongono i grafici di una funzione di probabilità $p_X$ e della corrispondente funzione di ripartizione $F_X$ di una variabile aleatoria discreta $X$ con dominio di supporto $\{ x_1, x_2, x_3 \}$, con:

- $p(x_1) = 0.33$
- $p(x_2) = 0.15$
- $p(x_3) = 0.52$

Si può notare come l'altezza di ogni colonna nel grafico della funzione di probabilità corrisponda al salto della funzione di ripartizione in quel punto. In altre parole, $F_X$ è la somma cumulativa delle barrette di $p_X$.


\hfill


\newpage
## Variabili aleatorie continue

Le variabili aleatorie continue sono variabili il cui dominio di supporto è un insieme non numerabile, tipicamente un intervallo di $\mathbb{R}$. In questo caso, la funzione di probabilità non è definita, poiché la probabilità di ogni singolo punto è zero. Si introduce allora la funzione di densità.

### Funzione di densità
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Funzione di densità}
```
Una variabile aleatoria si dice continua se esiste una funzione non negativa $f_X : \mathbb R\to\mathbb R^+$ tale che per ogni insieme misurabile $A \sube \mathbb{R}$ allora
$$
\mathbb P(X\in A)=\int_{A} f(x)\,dx
$$

La funzione $f_X$ prende il nome di *funzione di densità di probabilità*, o più semplicemente *densità*, di $X$.

Poiché $X$ deve assumere un qualche valore in $\mathbb{R}$ (ossia il codominio di $X$), la sua densità deve soddisfare:
$$
1 = \mathbb P (X \in \mathbb R) = \int_{- \infty}^{+ \infty} f_X(x) \, dx
$$
Quindi l'integrale della densità su tutto il suo dominio deve essere pari a 1. Questa rappresenta l'unica condizione necessaria affinché $f_X \ge 0$ possa essere considerata una densità di probabilità.

>```{=latex}
>% intervallo dell’area rigata
>\def\a{0.6}
>\def\b{2.3}
>
>\pgfplotsset{
>  densityaxis/.style={
>    width=6.5cm, height=4.8cm,
>    axis lines=left, axis line style={-stealth},
>    xmin=0, xmax=4, ymin=0, ymax=1.25,
>    xtick={\a,\b},
>    xticklabels={$a$,$b$},
>    ytick={0,1},
>    yticklabels={$0$,$1$},
>    tick style={black,thin}, clip=false
>  }
>}
>
>\begin{minipage}{0.45\textwidth}
>\begin{tikzpicture}[>=stealth,line cap=round]
>\begin{axis}[densityaxis,
>    axis on top=true,        %  ← NEW: curva sopra gli assi
>  set layers,
>  ylabel={$f_{X}(x) = e^{-x}$},
>  ylabel style={at={(axis description cs:0.08,1)},anchor=south,rotate=-90},
>  xlabel={$x$},
>  xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt}
>]
>
>
>  % area rigata fra a e b
>  \addplot[domain=\a:\b,
>           fill=gray!20,
>           pattern={Lines[angle=45,distance=3pt]}, pattern color=gray!35,
>           draw=none,samples=120]
>           {exp(-x)} \closedcycle;
>
>    % curva f(x)=e^{-x}, includendo esplicitamente il punto (0,1)
>    \addplot[
>      domain=0:4.5,
>      thick,
>      gray!60,
>      samples at={0,0.02,...,3.5}   % <— primo sample esattamente in 0
>    ] {exp(-x)};
>
>  % tratteggiate verticali
>  \addplot[gray!60,dashed] coordinates {(\a,0) (\a,{exp(-\a)})};
>  \addplot[gray!60,dashed] coordinates {(\b,0) (\b,{exp(-\b)})};
>
>  % freccia + testo dell’area
>  \draw[->,gray!50,thick] (axis cs:{(\a+\b)/2+0.1},{0.29})
>        -- ++(0,0.28)
>        node[above,gray!50,font=\footnotesize]
>        {$\mathbb P(a<X<b)$};
>
>\end{axis}
>\end{tikzpicture}
>\end{minipage}
>\begin{minipage}{0.53\textwidth}
>La figura a sinistra mostra un esempio di funzione di densità $f_X(x) = e^{-x}$, che è definita per ogni $x \ge 0$. Si osserva che la funzione di densità integra a 1 su $[0, +\infty)$, ossia 
>$$
>\displaystyle \int_{0}^{\infty} e^{-x}\,dx = [-e^{-x}]_0^{+\infty} = 1
>$$
>il che la rende una valida densità di probabilità quando normalizzata su questo intervallo.
>\end{minipage}
> \vspace{2mm}
> 
> Si può quindi assumere che la funzione di densità sia definita su tutto $\mathbb{R}$, ma che sia zero al di fuori dell'intervallo di interesse:
> $$
> f_X(x) = \begin{cases}
> e^{-x} & \text{se } x \ge 0 \\
> 0 & \text{se } x < 0
> \end{cases}
> $$
>```

\hfill
La probabilità viene normalmente calcolata su intervalli, e quindi ponendo $A = [a,b]$ si ha
$$
\mathbb{P}(a \le X \le b) = \int_a^b f_X(x) \, dx
$$

Ponendo in quest'ultima equazione $b = a$ si osserva come la probabilità che una variabile aleatoria continua assuma un qualunque valore specifico $a$ sia zero:
$$
\mathbb{P}(X = a) = \int_a^a f_X(x) \, dx = 0
$$
Per questo motivo non è rilevante che gli estremi dell'intervallo siano chiusi o aperti.

\hfill
\newpage
#### Relazione tra funzione di ripartizione e densità
Sia $F_X$ la funzione di ripartizione di $X$ e sia $f_X$ la sua densità. Queste due funzioni sono legate dalla seguente relazione:
$$
F_X(x) = \mathbb P(X \le x) = \mathbb P(X \in (-\infty, x]) = \int_{-\infty}^x f_X(t) \, dt
$$

Derivando entrambi i membri rispetto a $x$ si ottiene, per il teorema fondamentale del calcolo integrale, che
$$
\frac{d}{dx} F_X(x) = f_X(x)
$$
e quindi la funzione di ripartizione è la primitiva della densità.

\hfill
##### Proprietà
La funzione di ripartizione, oltre alle proprietà già viste quando è stata introdotta, possiede delle proprietà aggiuntive per $X$ continua:

- Continuità a sinistra: per ogni $\displaystyle x \in \mathbb{R} \; \lim_{y \to x^-} F_X(y) = F_X(x)$

- Essendo continua a destra e sinistra, la funzione di ripartizione è continua in ogni punto $x \in \mathbb{R}$. Non presenta quindi nessun salto o discontinuità.

\hfill
>```{=latex}
>%------------------------------------------------
>% Parametri e stili
>%------------------------------------------------
>\def\a{0.55}
>\def\b{1.7}
>\pgfplotsset{
>  densityaxis/.style={
>    width=6.5cm, height=4.8cm,
>    xmin=0, xmax=4.5, ymin=0, ymax=1.25,
>    axis x line=bottom,        % asse x in basso
>    axis y line=left,        % asse y in x=0
>    axis line style={-stealth},% frecce su entrambi
>    xtick={\a,\b}, xticklabels={$a$,$b$},
>    ytick={0,1}, yticklabels={$0$,$1$},
>    tick style={black,thin}, clip=false
>  },
>  cdfcontaxis/.style={
>    width=6.5cm, height=4.8cm,
>    xmin=0, xmax=4.5, ymin=0, ymax=1.25,
>    axis x line=bottom,    % asse x in basso
>    axis y line=left,    % asse y in x=0
>    axis line style={-stealth},
>    xtick={\a,\b}, xticklabels={$a$,$b$},
>    ytick={0,1-exp(-\a),1-exp(-\b),1},
>    yticklabels={$0$,$F(a)$,$F(b)$,$1$},
>    tick style={black,thin}, clip=false
>  }
>}
>
>\begin{center}
>%-------------- DENSITÀ ------------------------
>\begin{minipage}{0.43\textwidth}
>\centering
>\begin{tikzpicture}[>=stealth,line cap=round]
>\begin{axis}[densityaxis,
>  axis on top=true,
>  ylabel={$f_{X}(x) = e^{-x}$},
>  ylabel style={at={(axis description cs:0.08,1)},anchor=south,rotate=-90},
>  xlabel={$x$},
>  xlabel style={at={(axis description cs:1,0)},
>                anchor=north west,yshift=-2pt}
>]
>  % area sotto la curva
>  \addplot[domain=\a:\b,
>           fill=gray!20,
>           pattern={Lines[angle=45,distance=3pt]},
>           pattern color=gray!35,
>           draw=none,samples=120] {exp(-x)} \closedcycle;
>  % curva
>  \addplot[domain=0:4.0, thick, gray!60, samples=160] {exp(-x)};
>  % tratti verticali
>  \addplot[gray!60,dash pattern=on 1pt off 1pt] coordinates {(\a,0) (\a,{exp(-\a)})};
>  \addplot[gray!60,dash pattern=on 1pt off 1pt] coordinates {(\b,0) (\b,{exp(-\b)})};
>  % didascalia area
>  \draw[->,gray!50,thick]
>    (axis cs:{(\a+\b)/2+0.1},0.35) -- ++(0,0.3)
>    node[above,gray!50,font=\footnotesize] {$\mathbb P(a<X<b)$};
>\end{axis}
>\end{tikzpicture}
>\end{minipage}
>%-------------- CDF ----------------------------
>\begin{minipage}{0.43\textwidth}
>\centering
>\begin{tikzpicture}[>=stealth,line cap=round]
>  \begin{axis}[cdfcontaxis,
>    axis on top=true,
>    ylabel={$F_{X}(x) = 1 - e^{-x}$},
>    ylabel style={at={(axis description cs:0.14,1)},anchor=south,rotate=-90},
>    xlabel={$x$},
>    xlabel style={at={(axis description cs:1,0)},
>                  anchor=north west,yshift=-2pt},
>  ]
>    % asse x di base
>
>    % curva continua di CDF
>    \addplot[domain=0:4.0, thick, gray!60, samples=160]
>             {x<0 ? 0 : 1 - exp(-x)};
>
>    % tratteggiate verticali in a e b
>    \addplot[gray!60,dashed]
>             coordinates {(\a,0) (\a,{1-exp(-\a)})};
>    \addplot[gray!60,dashed]
>             coordinates {(\b,0) (\b,{1-exp(-\b)})};
>
>    % tratteggiate orizzontali a livello F(a) e F(b)
>    \addplot[gray!60,dashed]
>             coordinates {(0,{1-exp(-\a)}) (\a,{1-exp(-\a)})};
>    \addplot[gray!60,dashed]
>             coordinates {(0,{1-exp(-\b)}) (\b,{1-exp(-\b)})};
>    \addplot[gray!60,dashed]
>             coordinates {(0,1) (4.2,1)};
>
>    % evidenziazione differenza F(b)-F(a)
>    \draw[<->,gray!50,thick]
>      (axis cs:\b,{1-exp(-\a)}) -- (axis cs:\b,{1-exp(-\b)})
>      node[midway,right,gray!50,font=\footnotesize]
>      {$F(b)-F(a)$};
>
>  \end{axis}
>\end{tikzpicture}
>\end{minipage}
>\end{center}
>```
> Sopra sono riportati i grafici della funzione di densità $f_X(x) = e^{-x}$ e della corrispondente funzione di ripartizione $F_X(x) = 1 - e^{-x}$, che è definita per ogni $x \ge 0$. Infatti:
> $$
> F_X(x) = \mathbb P (X \le x) = \int_{-\infty}^x f_X(t) \,dt = \begin{cases}
> 0 & \text{se } x < 0 \\
> \displaystyle \int_0^x e^{-t} \,dt = 1 - e^{-x} & \text{se } x \ge 0
> \end{cases}
> $$
> 


\hfill

---

\vspace{2mm}
#### Legge di distribuzione

Quando si conosce la funzione di probabilità $p_X$, oppure la funzione di ripartizione $F_X$, di una variabile aleatoria $X$ qualsiasi, si hanno abbastanza informazioni per poter calcolare la probabilità di ogni evento che dipenda solo da tale variabile aleatoria. Si dice in questo caso che si conosce la *distribuzione* o *legge* della variabile aleatoria considerata.  
Affermare quindi che $X$ e $Y$ hanno la stessa distribuzione significa che le rispettive funzioni di ripartizioni sono identiche, $X \sim F_X \equiv F_Y \sim Y$, e quindi anche che $\mathbb{P}(X \in A) = \mathbb{P}(Y \in A)$ per ogni insieme di valori $A \sube \mathbb{R}$.





\newpage
## Variabili multivariate
Risulta necessario talvolta ridurre un esperimento casuale a più variabili aleatorie, in quanto l'oggetto di interesse sono proprio le relazioni presenti tra due o più grandezze numeriche. La coppia $(X, Y)$, con $X$ e $Y$ variabili aleatorie, è detta *variabile aleatoria bivariata*; generalizzando, una *variabile aleatoria multivariata* è un vettore aleatorio $X = (X_1, X_2, \dots, X_n)$, dove $X_i$ è una variabile aleatoria a valori reali.

Verranno ora presentate le definizioni e le proprietà delle variabili aleatorie bivariate, che possono essere però estese sul caso di variabili multivariate.

#### Funzione di ripartizione congiunta

Considerata una variabile aleatoria bivariata $(X, Y)$, la funzione di ripartizione congiunta è definita come
$$
F_{X,Y}(x,y) = \mathbb{P}(X \le x, Y \le y)
$$
dove la virgola denota l'intersezione tra i due eventi $\{X \le x\}$ e $\{Y \le y\}$.

\hfill
La conoscenza di questa funzione permette di calcolare la probabilità di tutti gli eventi che dipendono, singolarmente o congiuntamente, da $X$ e $Y$. La funzione di ripartizione di $X$ può essere ottenuta dalla funzione di ripartizione congiunta come
$$
F_X(x) = \lim_{y \to +\infty} F_{X,Y}(x,y) \;\; = \;\; \mathbb{P}(X \le x, Y \le +\infty) = F_{X,Y}(x,+\infty)
$$

Analogamente, la funzione di ripartizione di $Y$ è
$$
F_Y(y) = \lim_{x \to +\infty} F_{X,Y}(x,y) \;\; = \;\; \mathbb{P}(X \le +\infty, Y \le y) = F_{X,Y}(+\infty,y)
$$

Le funzioni di ripartizioni $F_X$ e $F_Y$ sono dette *marginali*. È importante notare che sebbene le funzioni di ripartizione marginali si possano sempre ricavare da quella congiunta, il viceversa è falso.

\hfill
#### Funzione di probabilità congiunta
Nel caso in cui $X$ e $Y$ siano variabili aleatorie discrete, la funzione di probabilità congiunta è definita come
$$
p_{X,Y}(x, y) = \mathbb{P}(X = x, Y = y) 
$$

Le funzioni di probabilità $p_X$ e $p_Y$ si possono ricavare da quella congiunta notando che, siccome $Y$ deve assumere uno dei valori $y$, l'evento $\{X = x\}$ può essere visto come l'unione al variare degli $y$ degli eventi $\{X = x, Y = y\}$, che sono mutualmente esclusivi. In formule:
$$
\{X = x\} = \bigcup_{y \in D_Y} \{X = x, Y = y\}
$$

Tramite il terzo assioma di Kolmogorov, si ha quindi
$$
p_X(x) = \mathbb{P}(X = x) = \sum_{y \in D_Y} \mathbb{P}(X = x, Y = y) = \sum_{y \in D_Y} p_{X,Y}(x,y)
$$

Analogamente, si può dimostrare che
$$
p_Y(y) = \sum_{x \in D_X} p_{X,Y}(x,y)
$$

Queste due funzioni di probabilità sono dette *marginali*. È importante notare che sebbene le funzioni di massa di probabilità marginali si possono sempre ricavare da quella congiunta, il viceversa è falso.

#### Funzione di densità congiunta
Due variabili aleatorie $X$ e $Y$ sono congiuntamente continue se esiste una funzione non negativa $f_{X,Y}(x,y)$, definita per tutti gli $x$ e $y$, avente la proprietà che per ogni sottoinsieme $C$ del piano cartesiano
$$
\mathbb{P}((X,Y) \in C) = \iint_{(x,y) \in C} f_{X,Y}(x,y) \, dx \, dy
$$

La funzione $f_{X,Y}$ prende il nome di *funzione di densità congiunta* di $X$ e $Y$.

\vspace{2.5mm}
> **Approfondimento** Se $A$ e $B$ sono sottoinsiemi qualsiasi di $\mathbb{R}$, e se si denota con $C = A \times B$ il loro prodotto cartesiano su $\mathbb{R}^2$, ovvero
> $$
> C = \{(x,y) \in \mathbb{R}^2 \mid x \in A, y \in B\}
> $$
> allora la densità congiunta $_{X,Y}$ soddisfa
> $$
> \mathbb{P}(X \in A, Y \in B) = \int_B \int_A f_{X,Y}(x,y) \, dx \, dy
> $$
> 
> Ponendo $A = (-\infty, a]$ e $B = (-\infty, b]$, si può riscrivere la funzione di ripartizione congiunta di $X$ e $Y$ come
> $$
> F_{X,Y}(a,b) = \mathbb{P}(X \le a, Y \le b) = \mathbb{P} (X \in A, Y \in B) = \int_{-\infty}^b \int_{-\infty}^a f_{X,Y}(x,y) \, dx \, dy
> $$
> da cui derivando, nelle due direzioni
> $$
> f_{X,Y}(a,b) = \dfrac{\partial^2 F_{X,Y}(a,b)}{\partial a \, \partial b}
> $$
> in tutti i punti in cui le derivate parziali sono definite.

\hfill
Le funzioni di densità $f_X$ e $f_Y$ si possono ricavare da quella congiunta, infatti per ogni insieme $A \sube \mathbb{R}$ si ha
$$
\int_A f_X(x) \, dx = \mathbb P (X \in A) = \mathbb P (X \in A, Y \in \mathbb{R}) = \int_A \int_{-\infty}^{+\infty} f_{X,Y}(x,y) \, dy \, dx
$$
Da questa equazione, dato che $A$ è un insieme arbitrario, si ricava che deve valere per forza l'uguaglianza degli integrandi:
$$
f_X(x) = \int_{-\infty}^{+\infty} f_{X,Y}(x,y) \, dy
$$

Analogamente, si può ricavare la funzione di densità di $Y$ come
$$
f_Y(y) = \int_{-\infty}^{+\infty} f_{X,Y}(x,y) \, dx
$$

Queste due funzioni di densità sono dette *marginali*. È importante notare che sebbene le densità marginali si possano sempre ricavare da quella congiunta, il viceversa è falso.



\newpage
### Variabili indipendenti
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Variabili indipendenti}
```
Due variabili aleatorie $X$ e $Y$ sono dette *indipendenti* se tutti gli eventi relativi alla prima sono indipendenti da tutti gli eventi relativi alla seconda.

Formalmente, due variabili aleatorie che riguardano lo stesso esperimento casuale sono indipendenti se e solo se, per ogni insieme $A,B \sube \mathbb{R}$, si ha 
$$
\mathbb{P}(X \in A, Y \in B) = \mathbb{P}(X \in A) \, \mathbb{P}(Y \in B)
$$
ovvero, se per ogni scelta di $A$ e $B$, gli eventi $\{X \in A\}$ e $\{Y \in B\}$ sono indipendenti. In caso contrario $X$ e $Y$ sono dette *dipendenti*.

#### Proprietà

Siano $X$ e $Y$ due variabili aleatorie indipendenti. Allora valgono le seguenti proprietà:

- $F_{X,Y}(x,y) = F_X(x) \, F_Y(y)$

- $f_{X,Y}(x,y) = f_X(x) \, f_Y(y)\;$ nel caso continuo

- $p_{X,Y}(x,y) = p_X(x) \, p_Y(y)\;$ nel caso discreto

    Dimostrazione

    1. $X,Y$ indipendenti $\;\; \Rightarrow \;\; p_{X,Y}(x,y) = p_X(x) \, p_Y(y) \quad \forall x, y$
        \vspace{-2mm}
        \begin{flalign*}
        \text{Si fissino } x, y: \quad p_{X,Y}(x,y) 
        & = \mathbb{P}(X=x, Y=y) = \mathbb{P}(X \in \underset{:=A}{\{x\}}, Y \in \underset{:= B}{\{y\}}) \\
        & = \mathbb{P}(X \in A, Y \in B) \overset{\text{(1)}}{=} \mathbb{P}(X \in A) \, \mathbb{P}(Y \in B) \\
        & = \mathbb{P}(X = x) \, \mathbb{P}(Y = y) = p_X(x) \, p_Y(y)
        &&\end{flalign*}
        \begin{small}\text{(1): per ipotesi di indipendenza}\end{small}

    \vspace{1mm}
    2. $p_{X, Y}(x,y) = p_X(x) \, p_Y(y) \quad \forall x, y \;\; \Rightarrow \;\; X, Y$ indipendenti
        \vspace{-2mm}
        \begin{flalign*}
        \text{Si fissino } A, B \sube \mathbb{R}: \quad \mathbb{P}(X \in A, Y \in B) 
        & = \sum_{x \in A, y \in B}\mathbb{P}(X = x, Y = y) = \sum_{x \in A} \sum_{y \in B} p_{X,Y}(x,y) \\ 
        & = \sum_{x \in A} \sum_{y \in B} p_X(x) \, p_Y(y) = \sum_{x \in A} p_X(x) \sum_{y \in B} p_Y(y) \\ 
        & = \mathbb{P}(X \in A) \, \mathbb{P}(Y \in B) \\
        &&\end{flalign*}

        \vspace{-8mm}
        Di conseguenza $X$ e $Y$ sono indipendenti.

    \vspace{-6mm}
    \begin{flalign*}
    \hspace*{2.5mm}\text{Si è dimostrata perciò la tesi in entrambi i versi.}
    &&\end{flalign*}


\hfill
##### Estensione dell'indipendenza
È possibile estendere l'indipendenza a più variabili aleatorie. In questo caso, si dice che $X_1, X_2, \dots, X_n$ sono indipendenti se
$$
\forall A_1, \dots, A_n \sube \mathbb{R} \quad \mathbb{P}\Big( \bigcap_{i=1}^n X_i \in A_i \Big) = \prod_{i=1}^n \mathbb{P}(X_i \in A_i)
$$


\newpage
## Valore atteso

#### Valore atteso di una variabile discreta
Sia $X$ una variabile aleatoria discreta che può assumere i valori $D_X = \{x_1, \dots, x_n, \dots \}$, il valore atteso di $X$, che si indica con $\mathbb{E}[X]$, è il numero$\,$[^3]
$$
\mathbb{E}[X] = \sum_{x \in D_X} x\, \mathbb{P}(X = x) = \sum_{x \in D_X} x\, p_X(x) \tag{7.5.1}
$$
Pertanto, il valore atteso rappresenta la media pesata delle specificazioni di $X$, usando come pesi le probabilità che tali valori vengano assunti da $X$. Perciò $\mathbb{E}[X]$ è un indice di centralità della distribuzione di $X$.


Analogamente alla media campionaria, il valore atteso può non corrispondere a una specificazione della variabile aleatoria $X$. Inoltre $\mathbb{E}[X]$ presenta la stessa unità di misura delle specificazioni.


\vspace{3mm}
Funzione indicatrice di un evento
: La funzione indicatrice di un evento $A \sube \Omega$ è definita come una funzione $I_A: \Omega \to \{0,1\}$ tale che

    \vspace{-3mm}
    $$
    I_A(\omega) =
    \begin{cases}
    1 & \text{sse \(A\) si verifica, cioè se } \omega \in A \\
    0 & \text{altrimenti}
    \end{cases}
    $$

    Utilizzando la definizione di valore atteso, si trova che
    $$
    \mathbb{E}[I_A] = 1\, \mathbb{P}(I_A = 1) + 0\, \mathbb{P}(I_A = 0) = 1 \, \mathbb{P}(A) + 0 \, \mathbb{P}(\overline{A}) = \mathbb{P}(A)
    $$


\vspace{3mm}
#### Valore atteso di una variabile continua
Sia $X$ una variabile aleatoria continua con densità $f_X$. Il valore atteso di $X$ è definito come$\,$\footnotemark[\value{footnote}]
$$
\mathbb{E}[X] = \int_{-\infty}^{+\infty} x\, f_X(x) \, dx \tag{7.5.2}
$$


[^3]: Si osserva che $\mathbb{E}[X]$ è definito solo se la serie $(7.5.1)$ o l'integrale $(7.5.2)$ convergono in valore assoluto, ovvero deve valere

    \vspace{-2mm}
    $$
    \sum_{x \in D_X} |x|\, p_X(x) < \infty \quad \text{oppure} \quad \int_{-\infty}^{+\infty} |x|\, f_X(x) \, dx < \infty
    $$
    \hangindent=2em In caso contrario si dice che $X$ non ha valore atteso. Questa questione di esistenza e buona definizione non verrà più trattata, ma si assumerà che il valore atteso sia sempre definito, nonostante la questione comunque si ponga e risulti necessario verificare la convergenza caso per caso.

\vspace{1mm}
### Proprietà
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Proprietà}
```

##### Proposizione
Il valore atteso di una funzione reale $g$ di una variabile aleatoria $X$ è definito come

$$
\mathbb{E}[g(X)] = \begin{cases} 
\displaystyle ~ \sum_{x \in D_X} g(x)\, p_{X}(x) & \; \text{per $X$ discreta con funzione di probabilità $p_X$} \\[2em]
\displaystyle ~ \int_{-\infty}^{+\infty} g(x)\, f_{X}(x) \, dx & \; \text{per $X$ continua con funzione di densità $f_X$}
\end{cases} \tag{7.5.3}
$$

Si consideri infatti una variabile aleatoria $X$ di cui si conosce la distribuzione. Anziché calcolare il valore atteso di $X$, può essere conveniente calcolare il valore atteso di una funzione $g(X)$, dove $g$ è una funzione $g: \mathbb{R} \to \mathbb{R}$. Si nota che $g(X)$ è anche essa una variabile aleatoria, e quindi è possibile calcolarne la distribuzione in un qualche modo; dopo averla ottenuta si può calcolare $\mathbb{E}[g(X)]$ con la sua definizione usuale.


\hfill
##### Proposizione
Per ogni coppia di costanti reali $a$ e $b$, si ha $\mathbb{E}[aX + b] = a\, \mathbb{E}[X] + b$.

Dimostrazione:

\qquad Verrà dimostrato per le variabili aleatorie discrete, ma il ragionamento è analogo per quelle continue.

\qquad $\,\, \displaystyle \mathbb{E}[aX + b] = \sum_{x \in D_X} (ax + b)\, p_X(x) = a \sum_{x \in D_X} x\, p_X(x) + b \sum_{x \in D_X} p_X(x) = a\, \mathbb{E}[X] + b$

Il valore atteso è quindi un operatore lineare, proprio come la media campionaria.

Si presentano due casi:

- se $a = 0$, si ha $\mathbb{E}[b] = b$ e quindi il valore atteso di una costante è la costante stessa. Una costante è infatti una variabile aleatoria degenere che assume un unico valore con probabilità 1.

- se $b=0$ si ottiene che $\mathbb{E}[aX] = a\, \mathbb{E}[X]$. Di conseguenza il valore atteso scala rispetto alle costanti moltiplicative.


\vspace{3mm}
##### Proposizione
Il valore atteso è lineare rispetto alla somma di variabili aleatorie: $\mathbb{E}[X+Y] = \mathbb{E}[X] + \mathbb{E}[Y]$.

Dimostrazione:

\hangindent=2em \qquad È possibile estendere la formula $(7.5.3)$ in una variante in due dimensioni: se $X$ e $Y$ sono variabili aleatorie e $g$ è una qualunque funzione di due variabili, allora vale
$$
\mathbb{E}[g(X,Y)] = \begin{cases} 
\displaystyle ~ \sum_{x \in D_X} \sum_{y \in D_Y} g(x,y)\, p_{X,Y}(x,y) & \text{nel discreto} \\[2em]
\displaystyle ~ \int_{-\infty}^{+\infty} \int_{-\infty}^{+\infty} g(x,y)\, f_{X,Y}(x,y) \, dx \, dy & \text{nel continuo}
\end{cases}
$$

\hangindent=2em \qquad Si consideri la funzione $g(x,y) = x + y$ e si applichi la formula precedente. Verrà presentata la dimostrazione per il caso discreto, ma il ragionamento è analogo nel caso continuo:
\begin{align*}
\mathbb{E}[X + Y] = & \sum_{x \in D_X} \sum_{y \in D_Y} (x + y)\, p_{X,Y}(x,y) = \sum_{x \in D_X} \sum_{y \in D_Y} x\, p_{X,Y}(x,y) + \sum_{x \in D_X} \sum_{y \in D_Y} y\, p_{X,Y}(x,y) \\[0.5em]
= & \sum_{x \in D_X} x\, \left( \sum_{y \in D_Y} p_{X,Y}(x,y) \right) + \sum_{y \in D_Y} y\, \left( \sum_{x \in D_X} p_{X,Y}(x,y) \right) \\[0.5em]
\overset{(1)}{=} & \sum_{x \in D_X} x\, p_X(x) + \sum_{y \in D_Y} y\, p_Y(y) = \mathbb{E}[X] + \mathbb{E}[Y]
\end{align*}
\vspace{-2mm}
\hangindent=2em \qquad \begin{align*}\begin{small}\text{(1):}\end{small} & \begin{small}\text{ le sommatorie all'interno delle parentesi tonde rappresentano rispettivamente le funzioni di massa di}\end{small} \\ & \begin{small}\text{probabilità marginali di $X$ e $Y$.}\end{small}\end{align*}

Estensione della linearità
: Applicando ricorsivamente questa equazione si può estendere la linearità del valore atteso a un numero finito di variabili aleatorie:
\vspace{0.5mm}
$$
\mathbb{E}[X_1 + X_2 + \dots + X_n] = \mathbb{E}[X_1] + \mathbb{E}[X_2] + \dots + \mathbb{E}[X_n]
$$
\vspace{-5mm}

Formalmente, se $X_1, X_2, \dots, X_n$ sono variabili aleatorie, si ha
$$
\mathbb{E}\left[\, \sum_{i=1}^n X_i\right] = \sum_{i=1}^n \mathbb{E}[X_i] = \begin{cases}
\displaystyle \sum_{i=1}^n \sum_{x \in D_{X_i}} x\, p_{X_i}(x) & \text{nel discreto} \\
\displaystyle \sum_{i=1}^n \int_{-\infty}^{+\infty} x\, f_{X_i}(x) \, dx & \text{nel continuo}
\end{cases}
$$

##### Proposizione
Se $X$ e $Y$ sono variabili aleatorie indipendenti, allora $\mathbb{E}[XY] = \mathbb{E}[X] \, \mathbb{E}[Y]$.

Dimostrazione:

\hangindent=2em \qquad Verrà dimostrato per le variabili aleatorie discrete, ma il ragionamento è analogo per quelle continue.

\hangindent=2em \qquad Si consideri la funzione $g(x,y) = xy$ e si applichi la formula $(7.5.3)$:
\begin{align*}
\mathbb{E}[XY] = & \sum_{x \in D_X} \sum_{y \in D_Y} xy\, p_{X,Y}(x,y) \overset{(1)}{=} \sum_{x \in D_X}  \sum_{y \in D_Y} xy\, p_{X}(x)\, p_Y(y) \\[0.5em]
= & \sum_{x \in D_X} x\, p_X(x)\, \sum_{y \in D_Y} y\, p_Y(y) = \mathbb{E}[X] \,\mathbb{E}[Y]
\end{align*}
\vspace{-4.5mm}
\begin{small}\qquad\, \text{(1): per ipotesi di indipendenza}\end{small}


\vspace{3mm}
##### Teorema
Sia $X \ge 0$ una variabile aleatoria qualsiasi e non negativa, allora
$$
\mathbb{E}[X] = \int_{0}^{+\infty} [1 - F_X(x)] \, dx
$$

\vspace{-4mm}
Dimostrazione:

\qquad Verrà dimostrato per le variabili aleatorie discrete, ma il ragionamento è analogo per quelle continue.

\hangindent=2em \qquad Siano $x_1, x_2, \dots, x_n$ le specificazioni non nulle assunte da $X$ e siano $F_X(x_1), F_X(x_2), \dots, F_X(x_n)$ i valori assunti dalla funzione di ripartizione in corrispondenza di tali specificazioni. La funzione di ripartizione è definita come la somma cumulativa delle probabilità associate a ciascun valore di $X$, e quindi il salto della funzione di ripartizione in corrispondenza di $x_i$ è dato da
$$
\Delta_i = F_X(x_i) - F_X(x_{i-1}) = \mathbb{P}(X \le x_i) - \mathbb{P}(X \le x_{i-1}) = p_X(x_i) \quad \forall i = 1, \dots, n
$$
Si osserva che ciascun salto $\Delta_i$, se moltiplicato per la corrispondente specificazione $x_i$, contribuisce al valore atteso $\mathbb{E}[X]$; sommando i contributi di tutti i salti, si ottiene pertanto proprio il valore atteso:
$$
\mathbb{E}[X] = \sum_{i=1}^n x_i \, p_X(x_i) = \sum_{i=1}^n x_i \, \Delta_i
$$

```{=latex}
\begin{minipage}{0.45\textwidth}
    \vspace{-6mm}
    \centering
    \begin{tikzpicture}[xscale=1.47, yscale=3.15]

  %--- Parametri generici
  \def\xone{1}     
  \def\xtwo{2}     
  \def\xthree{3}   
  \def\yone{0.3}   
  \def\ytwo{0.7}   

  %--- Ombreggiature
  \fill[pattern=crosshatch dots,pattern color=gray!70]   (0,0)          rectangle (\xone,\yone);
  \fill[pattern=horizontal lines,pattern color=gray!70] (0,\yone)      rectangle (\xtwo,\ytwo);
  \fill[pattern=north east lines,pattern color=gray!70] (0,\ytwo)      rectangle (\xthree,1);

  %--- Assi
  \draw[->] (0,0) -- (3.8,0) node[below,yshift=-0.5mm,xshift=0.5mm] {$x$};
  \draw[->] (0,0) -- (0,1.2) node[above] {$F_X(x)$};

  %--- Ticche su y
  \node[left,yshift=-7pt,xshift=2px] at (0,0) {0};
  \draw (-0.04,1) -- (0.04,1) node[left] {1};
  \draw (-0.04,\yone) -- (0.04,\yone) node[left,xshift=-2pt] {\small $F_X(x_1)$};
  \draw (-0.04,\ytwo) -- (0.04,\ytwo) node[left,xshift=-2pt] {\small $F_X(x_2)$};

  %--- Ticche su x e tratteggiate verticali
  \foreach \x/\i in {\xone/1,\xtwo/2,\xthree/3} {
    \draw (\x,0.04) -- (\x,-0.04) node[below] {$x_{\i}$};
    \draw[dashed] (\x,0) -- (\x,1);
  }

  %--- Funzione di ripartizione
  \draw[very thick]
    (0,0) -- (\xone,0)
    (\xone,\yone) -- (\xtwo,\yone)
    (\xtwo,\ytwo) -- (\xthree,\ytwo)
    (\xthree,1) -- (3.6,1);
  \draw[thick]
    (\xone,0)     -- (\xone,\yone)
    (\xtwo,\yone) -- (\xtwo,\ytwo)
    (\xthree,\ytwo) -- (\xthree,1);

  %--- Etichette A, B, C
  \node[fill=white,inner sep=2pt] at ({\xone/2},{\yone/2})                {$A$};
  \node[fill=white,inner sep=2pt] at ({(\xtwo)/2},{\yone+(\ytwo-\yone)/2}) {$B$};
  \node[fill=white,inner sep=2pt] at ({(\xthree)/2},{\ytwo+(1-\ytwo)/2})   {$C$};

    %--- Graffe Δ_i compatte e spesse
  \draw[decorate, decoration={brace, amplitude=3pt, raise=1pt}, line width=0.7pt]
    (\xone+0.02,\yone-0.02) -- (\xone+0.02,0.02)
    node[midway,right,xshift=4pt] {\small $\Delta_1$};
  \draw[decorate, decoration={brace, amplitude=3pt, raise=1pt}, line width=0.7pt]
    (\xtwo+0.02,\ytwo-0.02) -- (\xtwo+0.02,\yone+0.02)
    node[midway,right,xshift=4pt] {\small $\Delta_2$};
  \draw[decorate, decoration={brace, amplitude=3pt, raise=1pt}, line width=0.7pt]
    (\xthree+0.02,1-0.02) -- (\xthree+0.02,\ytwo+0.02)
    node[midway,right,xshift=4pt] {\small $\Delta_3$};

\end{tikzpicture}
\end{minipage}
\begin{minipage}{0.54\textwidth}
Si consideri ora il grafico della funzione di ripartizione $F_X(x)$ presentato a sinistra: in questo caso si assumono per semplicità solo tre specificazioni. Per quanto detto precedentemente, il valore atteso di $X$ è dato dalla somma dei contributi dei salti della funzione di ripartizione, che sono rappresentati dalle aree $A, B$ e $C$. Ma la somma di queste aree corrisponde proprio all'area sopra la curva della funzione di ripartizione, che è pari a
$$
\int_{0}^{+\infty} [1 - F_X(x)] \, dx
$$
Si è quindi dimostrato che il valore atteso di una variabile aleatoria discreta non negativa corrisponde all'integrale presentato, provando quindi la tesi.
\end{minipage}
```


\newpage
##### Osservazione
$\mathbb{E}[(X-c)^2] \ge \mathbb{E}[(X-\mu)^2]$

Vi è un'interessante proprietà della media che emerge quando si vuole predire con il minore errore possibile il valore che verrà assunto da una variabile aleatoria. Si supponga di voler predire il valore di $X$: se si sceglie un numero reale $c$ e si dice che $X$ sarà uguale a $c$, il quadrato dell'errore che si commetterà sarà $(X - c)^2$. Si dimostra di seguito che la media dell'errore al quadrato (detto *errore quadratico medio*) è minima quando $c$ coincide con il valore atteso di $X$. Infatti, posto $\mu = \mathbb{E}[X]$, si ha
\begin{align*}
\mathbb{E}[(X - c)^2] & = \mathbb{E}[(X - \mu + \mu -c)^2] = \mathbb{E}[(X - \mu)^2 + 2(X - \mu)(\mu - c) + (\mu - c)^2] \\[0.5em]
& = \mathbb{E}[(X - \mu)^2] + 2(\mu - c)\, \mathbb{E}[X - \mu] + (\mu - c)^2 \\[0.5em]
& \overset{(1)}{=} \mathbb{E}[(X - \mu)^2] + (\mu - c)^2 \\[0.5em]
& \ge \mathbb{E}[(X - \mu)^2] 
\end{align*}

$\begin{small}\qquad\, \text{(1): infatti } \mathbb{E}[X - \mu] = \mathbb{E}[X] - \mu = 0. \end{small}$

Perciò la migliore previsione di $X$, in termini di minimizzazione dell'errore quadratico medio, è proprio il suo valore atteso.


\hfill
## Varianza
La varianza misura quanto i valori di una variabile aleatoria si dispergano intorno alla media. Siccome i valori di $X$ sono distribuiti attorno al suo valore atteso, un approccio per misurare la loro variabilità potrebbe essere quantificare la loro distanza da $\mathbb{E}[X]$, ad esempio calcolando quanto valga $\mathbb{E}[|X - \mu|]$. Tuttavia, il valore assoluto comporta alcuni problemi di calcolo, e si predilige pertanto l'elevamento al quadrato.

Sia $X$ una variabile aleatoria e sia il suo valore atteso $\mu = \mathbb{E}[X]$. La varianza di $X$, che si denota con $\text{Var}(X)$ oppure $\sigma^2$, è (se esiste) la quantità:
$$
\text{Var}(X) = \mathbb{E}[(X - \mu)^2]
$$
Si osserva che ha il quadrato dell'unità di misura della variabile aleatoria $X$.


\vspace{3.2mm}
Teorema
: Sia $X$ una variabile aleatoria, allora $\text{Var}(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2$.

Dimostrazione:

\qquad $\text{Var}(X) = \mathbb{E}[(X - \mu)^2] = \mathbb{E}[X^2 - 2\mu X + \mu^2] = \mathbb{E}[X^2] - 2\mu\, \mathbb{E}[X] + \mu^2 = \mathbb{E}[X^2] - 2\mu^2 + \mu^2 = \mathbb{E}[X^2] - \mu^2$


\hfill
Sia $I_A$ la funzione indicatrice di un evento $A \sube \Omega$. Notando che $I_A^2 = I_A$ per idempotenza (infatti i valori possibili di $I_A$ sono solo 0 e 1, che elevati al quadrato rimangono invariati), si ha:
$$
\text{Var}(I_A) = \mathbb{E}[I_A^2] - \mathbb{E}[I_A]^2 = \mathbb{E}[I_A] - \mathbb{E}[I_A]^2 = \mathbb{P}(A) - \mathbb{P}(A)^2 = \mathbb{P}(A)(1 - \mathbb{P}(A)) = \mathbb{P}(A)\, \mathbb{P}(\overline{A})
$$

\vspace{1mm}
Deviazione standard
: A partire dalla varianza, è possibile definire la deviazione standard di una variabile aleatoria $X$ come

    \vspace{-5mm}
    $$
    \sigma_X = \sqrt{\text{Var}(X)} = \sqrt{\mathbb{E}[(X - \mu)^2]} = \sqrt{\mathbb{E}[X^2] - \mathbb{E}[X]^2}
    $$
    La deviazione standard possiede la stessa unità di misura della variabile aleatoria presa in considerazione.


\hfill
### Proprietà
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Proprietà}
```

\hfill
Proposizione
: Per ogni coppia di costanti reali $a$ e $b$, si ha $\text{Var}(aX + b) = a^2\, \text{Var}(X)$.

Dimostrazione:

\qquad $\text{Var}(aX + b) = \mathbb{E}[(aX + b - (a\mu+b))^2] = \mathbb{E}[(aX - a\mu)^2] = \mathbb{E}[(a(X - \mu))^2] = a^2\, \mathbb{E}[(X - \mu)^2] = a^2\, \text{Var}(X)$

La varianza non è quindi un operatore lineare, proprio come la varianza campionaria.
Si presentano due casi:

- se $a=0$, si ha $\text{Var}(b) = 0$ e quindi la varianza di una costante è zero. Infatti, una costante è una variabile aleatoria degenere che assume un unico valore con probabilità 1.
- se $b=0$, si ottiene che $\text{Var}(aX) = a^2\, \text{Var}(X)$. Di conseguenza la varianza scala al quadrato rispetto alle costanti moltiplicative.


\hfill
\paragraph{Linearità\,\protect\footnote{%
    Per poter studiare la linearità della varianza, è necessario prima conoscere la covarianza e, in particolar modo, come questa sia nulla in caso di indipendenza tra variabili aleatorie. Perciò, si rimanda alla sezione successiva per la definizione di covarianza e si ritorni qui dopo averla studiata.
}}
Se il valore atteso è lineare rispetto alla somma di variabili aleatorie, in generale non si può dire lo stesso per la varianza. Infatti, ad esempio
$$
\text{Var}(X + X) = \text{Var}(2X) = 4\, \text{Var}(X) \ne \text{Var}(X) + \text{Var}(X)
$$


##### Proposizione
Si considerino due variabili aleatorie qualsiasi $X$ e $Y$. La varianza della loro somma è data da
$$
\text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) + 2\, \text{Cov}(X, Y)
$$

\vspace{-4mm}
Dimostrazione:
\begin{align*}
\text{Var}(X + Y) & = \mathbb{E}[(X+Y)^2] - \mathbb{E}[X + Y]^2 = \mathbb{E}[X^2 + 2XY + Y^2] - (\mathbb{E}[X] + \mathbb{E}[Y])^2 \\[0.5em]
& = \mathbb{E}[X^2] + 2\mathbb{E}[XY] + \mathbb{E}[Y^2] - (\mathbb{E}[X]^2 + 2\,\mathbb{E}[X]\, \mathbb{E}[Y] + \mathbb{E}[Y]^2) \\[0.5em]
& = \mathbb{E}[X^2] - \mathbb{E}[X]^2 + \mathbb{E}[Y^2] - \mathbb{E}[Y]^2 + 2\,\mathbb{E}[XY] - 2\,\mathbb{E}[X]\, \mathbb{E}[Y] \\[0.5em]
& = \text{Var}(X) + \text{Var}(Y) + 2\, \text{Cov}(X, Y) \\
\end{align*}

\vspace{-5.5mm}
Utilizzando questa formula sul caso precedente, si ottiene infatti
$$
\text{Var}(X+X) = \text{Var}(X) + \text{Var}(X) + 2 \text{Cov}(X,X) = 2\, \text{Var}(X) + 2\, \text{Var}(X) = 4\, \text{Var}(X)
$$

\vspace{1mm}
Questa formula può essere estesa a un numero finito di variabili aleatorie, ottenendo che, se $X_1, X_2, \dots, X_n$ sono variabili aleatorie, allora
$$
\text{Var}\left(\sum_{i=1}^n X_i\right) = \sum_{i=1}^n \text{Var}(X_i) +  \sum_{i=1}^n \sum_{\substack{j=1\\ j\neq i}}^n \mathrm{Cov}(X_i, X_j)
$$

##### Proposizione
Se $X$ e $Y$ sono variabili aleatorie indipendenti, allora $\text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y)$.

Dimostrazione:

\qquad $\text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y) + 2\, \text{Cov}(X, Y) \overset{(1)}{=} \text{Var}(X) + \text{Var}(Y) + 2\cdot 0 = \text{Var}(X) + \text{Var}(Y)$

$\begin{small}\qquad\, \text{(1): per ipotesi di indipendenza } \end{small}$

\hfill


## Covarianza
Si considerino due variabili aleatorie $X$ e $Y$ di valore atteso $\mu_X$ e $\mu_Y$ rispettivamente. La loro *covarianza*, che si indica con $\text{Cov}(X,Y)$, è definita come la quantità
$$
\text{Cov}(X,Y) = \mathbb{E}[(X - \mu_X)(Y - \mu_Y)]
$$

\vspace{1mm}
##### Teorema
Siano $X$ e $Y$ due variabili aleatorie, allora $\text{Cov}(X,Y) = \mathbb{E}[XY] - \mathbb{E}[X]\, \mathbb{E}[Y]$.

Dimostrazione:
\begin{align*}
\text{Cov}(X,Y) & = \mathbb{E}[(X - \mu_X)(Y - \mu_Y)] = \mathbb{E}[XY - \mu_X Y - \mu_Y X + \mu_X \mu_Y] \\[0.3em]
& = \mathbb{E}[XY] - \mu_X \mathbb{E}[Y] - \mu_Y \mathbb{E}[X] + \mu_X \mu_Y = \mathbb{E}[XY] - \mu_X \mu_Y - \cancel{\mu_Y \mu_X} + \cancel{\mu_X \mu_Y} \\[0.3em]
& = \mathbb{E}[XY] - \mathbb{E}[X] \mathbb{E}[Y]
\end{align*}


\vspace{1mm}
### Proprietà
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Proprietà}
```

Dalla definizione di covarianza si deducono le seguenti proprietà:

- $\text{Cov}(X,Y) = \text{Cov}(Y,X)\;\;$ proprietà di simmetria
- $\text{Cov}(X,X) = \text{Var}(X)$
- $\text{Cov}(X+b, Y) = \text{Cov}(X,Y)$ = $\text{Cov}(X, Y+b)$
- $\text{Cov}(aX, Y) = a\, \text{Cov}(X,Y)$ = $\text{Cov}(X, aY)$

    Dimostrazione:

    \qquad $\text{Cov}(aX, Y) = \mathbb{E}[(aX - a\mu_X)(Y - \mu_Y)] = \mathbb{E}[a (X - \mu_X)(Y - \mu_Y)] = a\, \text{Cov}(X,Y)$

\vspace{3.5mm}
##### Lemma
Siano $X$,$Y$ e $Z$ tre variabili aleatorie, allora $\text{Cov}(X+Y,Z) = \text{Cov}(X,Z) + \text{Cov}(Y,Z)$.

Dimostrazione:
\begin{align*}
\text{Cov}(X+Y,Z) & = \mathbb{E}[(X+Y)Z] - \mathbb{E}[X+Y]\, \mathbb{E}[Z] = \mathbb{E}[XZ + YZ] - (\mathbb{E}[X] + \mathbb{E}[Y])\, \mathbb{E}[Z] \\[0.3em]
& = \mathbb{E}[XZ] + \mathbb{E}[YZ] - \mathbb{E}[X]\, \mathbb{E}[Z] - \mathbb{E}[Y]\, \mathbb{E}[Z] = \text{Cov}(X,Z) + \text{Cov}(Y,Z)
\end{align*}

Questo lemma può essere generalizzato a più di due variabili aleatorie, ottenendo che, se $X_1, \dots, X_n$ sono variabili aleatorie, allora
$$
\text{Cov}\left(\sum_{i=1}^n X_i, Y\right) = \sum_{i=1}^n \text{Cov}(X_i, Y)
$$

\vspace{1mm}
##### Proposizione
Siano $X_1, \dots, X_n$ e $Y_1, \dots, Y_n$ variabili aleatorie qualsiasi, allora
$$
\text{Cov}\left(\sum_{i=1}^n X_i, \sum_{j=1}^n Y_j\right) = \sum_{i=1}^n \sum_{j=1}^n \text{Cov}(X_i, Y_j)
$$

\hfill
### Indipendenza
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Indipendenza}
```

##### Teorema
Siano $X$ e $Y$ due variabili aleatorie indipendenti, allora $\text{Cov}(X,Y) = 0$.

Dimostrazione:

\qquad $\text{Cov}(X,Y) = \mathbb{E}[XY] - \mathbb{E}[X]\, \mathbb{E}[Y] \overset{(1)}{=} \mathbb{E}[X]\, \mathbb{E}[Y] - \mathbb{E}[X]\, \mathbb{E}[Y] = 0$

$\begin{small}\qquad\, \text{(1): per ipotesi di indipendenza } \end{small}$


\hfill
Se due variabili aleatorie non sono indipendenti, la loro covarianza è un importante indicatore della relazione che sussiste tra loro. Si consideri la situazione in cui $X$ e $Y$ sono le funzioni indicatrici di due eventi $A, B \sube \mathcal{F}$:
$$
X = I_A = \begin{cases}
1 & \text{sse \(A\) si verifica} \\[0.5em]
0 & \text{altrimenti}
\end{cases} \\
\qquad\qquad Y = I_B = \begin{cases}
1 & \text{sse \(B\) si verifica} \\[0.5em]
0 & \text{altrimenti}
\end{cases}
$$
Si ricorda che $\mathbb{E}[X] = \mathbb{P}(A)$ e $\mathbb{E}[Y] = \mathbb{P}(B)$. Si osserva che anche $XY$ è una funzione indicatrice:
$$
XY = I_{A \cap B} = \begin{cases}
1 & \text{sse } X = 1 \text{ e } Y = 1 \\[0.5em]
0 & \text{altrimenti}
\end{cases}
$$

Sapendo che $\mathbb{E}[XY] = \mathbb{P}(X=1, Y=1) = \mathbb{P}(A \cap B)$, si ottiene che
$$
\text{Cov}(X,Y) = \mathbb{E}[XY] - \mathbb{E}[X]\, \mathbb{E}[Y] = \mathbb{P}(X=1, Y=1) - \mathbb{P}(X=1)\, \mathbb{P}(Y=1)
$$

da cui si deduce che
\begin{align*}
\text{Cov}(X, Y) > 0 & \iff \mathbb{P}(X=1, Y=1) > \mathbb{P}(X=1)\, \mathbb{P}(Y=1) \\[0.5em]
& \iff \dfrac{\mathbb{P}(X=1, Y=1)}{\mathbb{P}(Y=1)} > \mathbb{P}(X=1) \\[0.5em]
& \iff \mathbb{P}(X=1 | Y=1) > \mathbb{P}(X=1)
\end{align*}

Perciò la covarianza di $X$ e $Y$ è positiva se condizionando a $\{Y=1\}$ aumenta la probabilità di $X=1$. 

\hfill
Indice di correlazione lineare

: In generale si può dimostrare che un valore positivo di $\text{Cov}(X,Y)$ indica che $X$ e $Y$ tendenzialmente assumono valori grandi o piccoli contemporaneamente. La forza della relazione tra $X$ e $Y$ è misurata propriamente dal *coefficiente di correlazione lineare*, un numero puro che tiene conto anche delle deviazioni standard di $X$ e $Y$. Viene indicato con $\text{Corr}(X,Y)$ e definito come:
$$
\text{Corr}(X,Y) = \dfrac{\text{Cov}(X,Y)}{\sigma_X \sigma_Y} = \dfrac{\text{Cov}(X,Y)}{\sqrt{\text{Var}(X)\,\text{Var}(Y)}}
$$

Si può dimostrare che questa quantità è sempre compresa tra -1 e +1. Valgono le seguenti affermazioni:

- $\text{Corr}(X,Y) = 1$ se $X$ e $Y$ sono perfettamente correlati positivamente, cioè se esiste una relazione lineare crescente tra $X$ e $Y$.

- $\text{Corr}(X,Y) = -1$ se $X$ e $Y$ sono perfettamente correlati negativamente, cioè se esiste una relazione lineare decrescente tra $X$ e $Y$.

- $\text{Corr}(X,Y) = 0$ se $X$ e $Y$ sono incorrelati, cioè se non esiste alcuna relazione lineare tra $X$ e $Y$. Ciò non implica che $X$ e $Y$ siano indipendenti, in quanto potrebbero esistere relazioni non lineari che questo coefficiente non è in grado di cogliere.


\newpage
## Quantili
Il concetto di quantile può essere esteso anche nel contesto delle variabili aleatorie. Il quantile $x_{\alpha}$ di livello $\alpha \in [0,1]$ è definito come il valore tale che
\vspace{-1.5mm}
$$
\mathbb{P}(X \le x_{\alpha}) = \alpha = F_X(x_{\alpha})
$$

\vspace{-3.5mm}
Quando $\alpha = 1/2$, il quantile corrisponde alla mediana della distribuzione di $X$.

Variabili discrete
: Se $X$ è discreta, non è garantito che esista un valore $x$ tale che $F_X(x)=\alpha$ per ogni $\alpha\in[0,1]$. Questo perché $F_X$ salta a gradini e può non assumere esattamente il valore $\alpha$.

Variabili continue
: Se $X$ è continua, la funzione di ripartizione è continua e strettamente crescente. In questo caso l’inversa

    \vspace{-7mm}
    $$
    x_{\alpha} = F_X^{-1}(\alpha) \qquad \forall \alpha\in[0,1]
    $$
    è sempre ben definita e fornisce l’unico quantile di livello $\alpha$, poiché
    $$
    \vspace{-1mm}
    \mathbb{P}(X \le x_{\alpha})
    =F_X\bigl(F_X^{-1}(\alpha)\bigr)
    =\alpha
    $$

\vspace{-4mm}
#### Q-Q Plot
Nella statistica descrittiva, il $Q$-$Q$ plot è un grafico che confronta i quantili di due campioni diversi per verificare se questi seguano la stessa distribuzione (e se quindi possano provenire dalla stessa popolazione).

Questo stesso grafico può essere introdotto per le variabili aleatorie. Se disponiamo di un campione e della distribuzione teorica $F$ di una popolazione, possiamo costruire un $Q$–$Q$ plot confrontando i quantili empirici del campione con quelli teorici di $F$. Se i punti giacciono lungo la bisettrice $y = x$, allora il campione può essere considerato come proveniente dalla popolazione considerata.

Il $Q$–$Q$ plot è spesso usato per valutare la normalità di un campione stimando media e deviazione standard dai dati stessi quando i parametri della popolazione non sono noti.


\vspace{4mm}
## Disuguaglianze

L'importanza delle disuguaglianze di Markov e Chebyshev, che verranno presentate di seguito, sta nel fatto che permettono di limitare le probabilità di eventi rari che riguardano variabili aleatorie di cui si conosce solo il valore atteso oppure il valore atteso e la varianza. Naturalmente, quando la distribuzione è nota, è possibile calcolare queste probabilità esattamente e non vi è quindi la necessità di ridursi alle disuguaglianze.

### Disuguaglianza di Markov
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Disuguaglianza di Markov}
```
Sia $X \ge 0$ una variabile aleatoria qualsiasi a specificazioni non negative, allora
$$
\mathbb{P}(X \ge a) \le \dfrac{\mathbb{E}[X]}{a} \quad \forall a > 0
$$

\vspace{-3mm}
**Dimostrazione**:

\hangindent=2em \qquad Si mostra la dimostrazione per il caso discreto, ma il ragionamento è analogo nel caso continuo. 
\begin{align*}
\mathbb{E}[X] & = \sum_{x \in D_X} x\, \mathbb{P}(X=x) = \sum_{x < a} x\, \mathbb{P}(X=x) + \sum_{x \ge a} x\, \mathbb{P}(X=x) \\[0.5em]
& \overset{(1)}{\ge} \sum_{x \ge a} x\, \mathbb{P}(X=x) \overset{(2)}{\ge} \sum_{x \ge a} a\, \mathbb{P}(X=x) = a\, \underbrace{\sum_{x \ge a} \mathbb{P}(X=x)}_{\text{eventi disgiunti}} \overset{K3}{=} a\, \mathbb{P}(X \ge a)
\end{align*}
\vspace{-8mm}
\begin{small}\qquad\, \text{(1): perché il primo addendo è per ipotesi $\ge 0$}\\ 
\hspace*{2.17em} \text{(2): perché $x \ge a$ nella sommatoria}\end{small}


\hangindent=2em \qquad Si è quindi dimostrato che $\;\mathbb{E}[X] \ge a\, \mathbb{P}(X \ge a) \; \Rightarrow \; \mathbb{P}(X \ge a) \le \dfrac{\mathbb{E}[X]}{a},\;$ provando di fatto la tesi.

Si osserva che è possibile utilizzare questa disuguaglianza anche nel verso opposto, ossia
$$
\mathbb{P}(X < a) = 1 - \mathbb{P}(X \ge a) \ge 1 - \dfrac{\mathbb{E}[X]}{a} \quad \forall a > 0
$$

\hfill
### Disuguaglianza di Chebyshev
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Disuguaglianza di Chebyshev}
```

Sia $X$ una variabile aleatoria qualsiasi con media $\mu$ e varianza $\sigma^2$, allora
$$
\mathbb{P}(|X - \mu| \ge r) \le \dfrac{\sigma^2}{r^2} \quad \forall r > 0
$$

**Dimostrazione**:

\hangindent=2em \qquad Si osservi che gli eventi $\{|X - \mu| \ge r\}$ e $\{(|X - \mu|)^2 \ge r^2\}$ si implicano a vicenda e sono quindi equiprobabili:
$$
\mathbb{P}(|X - \mu| \ge r) = \mathbb{P}((X - \mu)^2 \ge r^2)
$$

\hangindent=2em \qquad Si consideri perciò la variabile aleatoria $Y = (X - \mu)^2$. Essendo le sue specificazioni non negative, è possibile applicarle la disuguaglianza di Markov con $a = r^2$:
\begin{align*}
& \mathbb{P}(Y \ge a) \le \dfrac{\mathbb{E}[Y]}{a} \quad \forall a > 0 \\[0.5em]
& \Rightarrow \mathbb{P}((X - \mu)^2 \ge r^2) \le \dfrac{\mathbb{E}[(X - \mu)^2]}{r^2} = \dfrac{\sigma^2}{r^2}
\end{align*}
La disuguaglianza finale implica a sua volta che $\mathbb{P}(|X - \mu| \ge r) \le \dfrac{\sigma^2}{r^2}$, provando di fatto la tesi.

\hfill
Si osserva che è possibile utilizzare questa disuguaglianza anche nel verso opposto, ossia
$$
\mathbb{P}(|X - \mu| < r) = 1 - \mathbb{P}(|X - \mu| \ge r) \ge 1 - \dfrac{\sigma^2}{r^2} \quad \forall r > 0
$$

Inoltre, se nella disuguaglianza di Chebyshev si pone $r = k \sigma$, essa assume la seguente forma:
$$
\mathbb{P}(|X - \mu| \ge k \sigma) \le \dfrac{1}{k^2} \quad \forall k > 0
$$
In altri termini, la probabilità che una variabile aleatoria differisca dalla sua media per più di $k$ volte la deviazione standard è al più $\dfrac{1}{k^2}$.

\newpage
# Modelli di distribuzione
In statistica un modello di distribuzione fornisce una descrizione teorica del comportamento di una variabile aleatoria $X$ definita su uno spazio campionario $\Omega$. Mediante una funzione di massa (quando $X$ è discreta) o di densità (quando $X$ è continua), esso specifica la legge di probabilità che rende conto della frequenza con cui $X$ assume i valori nel suo supporto. Adottare un modello significa dunque sostituire l’osservazione empirica di uno o più campioni con un quadro stocastico rigoroso, fondato su ipotesi strutturate che consentono di estendere l’analisi oltre la singola specificazione.

Alla base di questa impostazione vi sono tre passaggi fondamentali: 

1. si definisce $X$ come funzione misurabile che mappa ogni evento elementare $\omega\in\Omega$ in un valore reale; 
2. in secondo luogo si introduce la misura di probabilità $\mathbb P_X$ indotta da $X$, che può essere rappresentata tramite la funzione di ripartizione $F_X$, la funzione di massa di probabilità o la funzione di densità; 
3. infine si sfruttano tali strumenti per calcolare quantità caratteristiche (media, varianza, quantili) e per valutare probabilità di eventi, ponendo così le basi sia per procedure di inferenza statistica e test di ipotesi, sia per previsioni e simulazioni del fenomeno in esame.

Per ogni modello la legge di probabilità è governata da uno o più parametri raccolti in un vettore $\theta$. Questi parametri quantificano aspetti essenziali del fenomeno (ad esempio la probabilità di successo $p$ nella Bernoulli, il numero di prove $n$ e la stessa $p$ nella binomiale, ecc) e ne determinano completamente la forma: fissato $\theta$, la funzione di massa (o di densità) è univocamente definita. In pratica, quando si dispone di dati osservati, il problema centrale diventa stimare $\theta$ in modo da adattare al meglio il modello alla realtà – lavoro di cui si occupa la statistica inferenziale.

Per ciascun modello di distribuzione analizzeremo l’esperimento sottostante e la variabile aleatoria associata; ne descriveremo il supporto, la funzione di ripartizione e la funzione di massa o di densità di probabilità; calcoleremo valore atteso e varianza; infine, ne illustreremo le proprietà principali.

\vspace{4mm}
## Modelli discreti
Quando il fenomeno osservato può assumere solo un insieme numerabile di valori, si parla di distribuzioni discrete. Ciascun modello discreto è descritto da una funzione di massa di probabilità che assegna a ogni possibile valore $x$ la probabilità $\mathbb P(X=x)$.

### Modello di Bernoulli
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Modello di Bernoulli}
```
Si supponga che venga realizzato un esperimento di Bernoulli, ossia un esperimento che può avere solo due esiti possibili, positivo e negativo. Si definisce una variabile aleatoria $X$ in modo tale che $X = 1$ nel primo caso e $X = 0$ nel secondo: il supporto è quindi $D_X = \{0, 1\}$.

Per identificare univocamente una distribuzione basta conoscerne la funzione di massa di probabilità, che in questo caso è definita come
\begin{align*}
p_X(x) = \begin{cases}
p & \text{se } x=1 \\[0.5em]
1-p & \text{se } x=0
\end{cases}
\end{align*}
dove con $p$ si indica la probabilità che l'esperimento registri un successo. Deve essere ovviamente $0 \le p \le 1$.

Una variabile aleatoria $X$ si dice di Bernoulli con parametro $p \in [0,1]$ e si indica con $X \sim B(p)$ se la sua funzione di massa di probabilità è definita come sopra. In altri termini, $X$ si dice bernoulliana se può assumere solo i valori $0$ e $1$.

\vspace{3mm}
È possibile definire più formalmente la funzione di massa di probabilità come
$$
p_X(x) = p^x (1-p)^{1-x}\, I_{\{0,1\}}(x)
$$

Per essere una funzione di massa di probabilità, $p_X(x)$ deve soddisfare le seguenti condizioni:

- $p_X(x) \ge 0$ per ogni $x \in \mathbb{R}$
- $\sum_{x \in D_X} p_X(x) = 1$

La prima condizione è soddisfatta per ogni $x \in \mathbb{R}$, mentre la seconda condizione è verificata come segue:
\begin{align*}
\sum_{x \in D_X} p_X(x) & = p^1 (1-p)^{1-1} + p^0 (1-p)^{1-0} = p + (1-p) = 1
\end{align*}


La funzione di ripartizione di una variabile aleatoria bernoulliana è definita come
$$
F_X(x) = (1-p) \, I_{[0,1)}(x) + \, I_{[1,+\infty)}(x) = \begin{cases}
0 & \text{se } x < 0 \\[0.5em]
1-p & \text{se } 0 \le x < 1 \\[0.5em]
1 & \text{se } x \ge 1
\end{cases}
$$

```{=latex}
\def\p{0.75}                 % probabilità di successo
\pgfmathsetmacro{\q}{1-\p}

%------------------------------------------------
% STILI: ora registrati in /pgfplots/…
%------------------------------------------------
\pgfplotsset{
  pmfaxis/.style={
    width=6.5cm, height=4.8cm,
    axis lines=left, axis line style={-stealth},
    xmin=-0.25, xmax=1.25, ymin=0, ymax=1.15,
    xtick={0,1}, xticklabels={$0$,$1$},
    tick style={black,thin}, clip=false
  },
  cdfaxis/.style={
    width=6.5cm, height=4.8cm,
    axis lines=left, axis line style={-stealth},
    xmin=-0.25, xmax=1.25, ymin=0, ymax=1.15,
    xtick={0,1}, xticklabels={$0$,$1$},
    tick style={black,thin}, clip=false
  }
}

\begin{center}
\begin{tikzpicture}[>=stealth,line cap=round]
%---------------------- PANNELLO 1: pmf ----------------------
\begin{axis}[pmfaxis,
  ylabel={$p_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south, rotate=-90},
  ytick={\q,\p,1}, yticklabels={$1{-}p$,$p$,1},
  xlabel={$x$},
  xlabel style={
    at={(axis description cs:1,0)},    % fine asse x
    anchor=north west,                 % aggancio al nord-ovest dell’etichetta
    yshift=-2pt                        % un po' più in basso
  }
]
  % asse x
  \addplot[gray!30,very thick] coordinates {(-0.25,0) (1.20,0)};
  % stanghette e puntini
  \addplot[black,thick] coordinates {(0,0) (0,\q)};
  \addplot[black,thick] coordinates {(1,0) (1,\p)};
  \addplot[gray!30,only marks,mark=*] coordinates {(0,\q) (1,\p)};
  \addplot[white,draw=gray!30,very thick,
           mark=*,mark options={scale=1.25,fill=white},
           only marks] coordinates {(0,0) (1,0)};
\end{axis}

%---------------------- PANNELLO 2: cdf ----------------------
\begin{axis}[cdfaxis,
  at={(current bounding box.east)}, anchor=west, xshift=1.4cm,
  ylabel={$F_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south, rotate=-90},
  ytick={\q,1}, yticklabels={$1{-}p$,$1$},
  yticklabel style={yshift=-1.5pt},    % abbassa il “1”
  xlabel={$x$},
  xlabel style={
    at={(axis description cs:1,0)},
    anchor=north west,
    yshift=-2pt
  }
]
  % area tratteggiata = p
  \addplot[pattern={Lines[angle=45,distance=6pt]},
           pattern color=gray!35,draw=none]
           coordinates {(0,\q) (1,\q) (1,1) (0,1) (0,\q)};
  % segmenti orizzontali + verticali
  \addplot[gray!30,very thick] coordinates {(-0.25,0) (0,0)};
  \addplot[gray!30,very thick] coordinates {(0,\q) (1,\q)};
  \addplot[gray!30,very thick] coordinates {(1,1) (1.25,1)};
  \addplot[black,thin] coordinates {(0,0) (0,\q)};
  \addplot[black,thin] coordinates {(1,0) (1,1)};
  % punti pieni/vuoti
  \addplot[gray!30,only marks,mark=*] coordinates {(0,\q) (1,1)};
  \addplot[white,draw=gray!30,very thick,
           mark=*,mark options={scale=1.25,fill=white},
           only marks] coordinates {(0,0) (1,\q)};
  % freccia centrata
  \draw[->,gray!50,thick] (axis cs:0.75,{\q+0.5*\p})
        -- (axis cs:1.25,{\q+0.5*\p})
        node[right,font=\footnotesize] {$p$};
\end{axis}

\end{tikzpicture}
\\[0.1mm]
{\small
    Funzioni di massa e di ripartizione della variabile aleatoria $X \sim B(0.75)$
}
\end{center}
```
Nel grafico della funzione di massa di probabilità compaiono solo due barre, quella in $x=1$ alta $p$ e quella in $x=0$ alta $1-p$. La funzione di ripartizione riproduce questi valori con due salti: il primo salto in $x=0$ raggiunge il valore $1-p$, mentre il secondo salto in $x=1$ raggiunge il valore 1; l'area tratteggiata segnala il salto di ampiezza $p$.

\vspace{3mm}
Il suo valore atteso è dato da 
$$
\mathbb{E}[X] = 1\cdot p + 0\cdot (1-p) = p
$$
ed è quindi pari alla probabilità che la variabile aleatoria assuma il valore 1.

\vspace{2mm}
Sfruttando la proprietà di idempotenza della funzione indicatrice, si ha che la varianza di $X$ è data da
\vspace{-3mm}
$$
\text{Var}(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2 \overset{(1)}{=} \mathbb{E}[X] - \mathbb{E}[X]^2 = p - p^2 = p(1-p) \begin{small}\qquad\text{(1): per idempotenza}\end{small}
$$

\vspace{-4mm}
```{=latex}
\vspace{2mm}
\begin{minipage}{0.35\textwidth}
\begin{tikzpicture}[>=stealth,line cap=round]
  \begin{axis}[
      width=6cm, height=4cm,
      domain=0:1, samples=250,
      xlabel={$p$},
      ylabel={$\operatorname{Var}(X)$},
      ylabel style={at={(axis description cs:0,1.02)},anchor=south, rotate=-90},
      xlabel style={
        at={(axis description cs:1,0)},    % fine asse x
        anchor=north west,                 % aggancio al nord-ovest dell’etichetta
        yshift=-2pt                        % un po' più in basso
      },
      axis line style={-stealth},
      axis lines=left,
      xmin=0, xmax=1.15,
      ymin=0, ymax=0.29,
      xtick={0,0.5,1},
      ytick={0.25},
      yticklabels={$\tfrac{1}{4}$},
      xticklabels={0,$1/2$,1},
      tick style={draw=none},
      clip=false
    ]
    \addplot[gray!40,very thick]{x*(1-x)};
    \addplot[gray!40,only marks,mark=*] coordinates {(0.5,0.25)};
    \addplot[gray,dashed] coordinates {(0.5,0) (0.5,0.25)};
    \addplot[gray,dashed] coordinates {(0,0.25) (0.5,0.25)};
    \node[above right,font=\tiny] at (axis cs:0.5,0.25) {$\bigl(\tfrac12,\tfrac14\bigr)$};
  \end{axis}
\end{tikzpicture}
\end{minipage}
\begin{minipage}{0.62\textwidth}
\vspace{-3mm}
Si osserva che nel caso si scelga $p=0$ oppure $p=1$, la variabile aleatoria assume il valore 0 o 1 con probabilità 1, rispettivamente. In questo caso si ha una variabile aleatoria degenere e la varianza è nulla. La varianza inoltre raggiunge il valore massimo $\frac{1}{4}$ quando $p=\frac{1}{2}$, in cui caso la variabile aleatoria assume i valori 0 e 1 con probabilità $\frac{1}{2}$ ciascuna.
\end{minipage}
```


\hfill
\newpage
### Modello binomiale
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Modello binomiale}
```
Si supponga di realizzare $n \in \mathbb{N}$ ripetizioni indipendenti di un esperimento bernoulliano di parametro $p$. Se $X$ denota il numero totale di successi, allora $X$ si dice variabile aleatoria binomiale con parametri $n$ e $p$ e si indica con $X \sim B(n,p)$.

Formalmente, dati $n \in \mathbb{N}$ e $X_1, \dots, X_n \sim B(p)$ variabili aleatorie indipendenti, si definisce una variabile aleatoria $X$ binomiale come
$$
X = \sum_{i=1}^n X_i \sim B(n,p)
$$

dove $X_i$ è la funzione indicatrice del successo dell'$i$-esimo esperimento:
$$
X_i = \begin{cases}
1 & \text{se la prova $i$-esima ha successo} \\[0.5em]
0 & \text{altrimenti}
\end{cases}
$$

Il dominio di supporto è quindi $D_X = \{0, 1, \dots, n\}$. La funzione di massa di probabilità per una variabile aleatoria binomiale di parametri $(n,p)$ è data da
$$
p_X(x) = \binom{n}{x} p^x (1-p)^{n-x} \, I_{\{0,\dots,n\}}(x)
$$
dove il coefficiente binomiale
$$
\binom{n}{x} = \dfrac{n!}{x!(n-x)!}
$$

rappresenta il numero di combinazioni differenti che si possono ottenere scegliendo $x$ successi tra $n$ prove.

> La correttezza dell'equazione sopra può essere verificata fissando una sequenza di esiti con $i$ successi e $n-i$ fallimenti. La probabilità che si verifichi questa sequenza è $p^i (1-p)^{n-i}$ per l'indipendenza delle ripetizioni:
> \begin{align*}
> & \mathbb{P}(X_1=1, \dots, X_i=1, X_{i+1}=0, \dots, X_n=0) \\[1mm]
> = ~ & \mathbb{P}(X_1=1) \cdots \mathbb{P}(X_{i}=1)\, \mathbb{P}(X_{i+1}=0) \cdots \mathbb{P}(X_n=0) = p^i (1-p)^{n-i}
> \end{align*}
> L'equazione segue quindi dal contare quante sono le diverse sequenze di esiti con questa  
> caratteristica. Esse sono $\binom{n}{i}$ perché corrispondono a tutti i modi in cui si possono scegliere gli $i$ esperimenti che hanno dato esito positivo sugli $n$ in totale.


\vspace{2mm}
La correttezza della funzione di massa di probabilità è garantita dalle seguenti condizioni:

- $p_X(x) \ge 0$ per ogni $x \in \mathbb{R}$
- $\sum_{x \in D_X} p_X(x) = 1$

La prima condizione è soddisfatta per ogni $x \in \mathbb{R}$, mentre la seconda condizione è verificata come segue:
\begin{align*}
\sum_{x \in D_X} p_X(x) & = \sum_{x=0}^n \binom{n}{x} p^x (1-p)^{n-x} \overset{(1)}{=} (p + (1-p))^n = 1
\end{align*}

\vspace{-5mm}
$\begin{small}\qquad\, \displaystyle \text{(1): per la formula delle potenze del binomio } (x+y)^n = \sum_{i=0}^n \binom{n}{i} x^i \, y^{n-i}\end{small}$

\vspace{4mm}
La funzione di ripartizione di una variabile aleatoria binomiale è definita come
$$
F_X(x) = \mathbb{P}(X \le \floor{x}) = \left( \, \sum_{i=0}^{\floor{x}} p_X(i) \right) I_{[0,n)}(x) + I_{[n,+\infty)}(x)
$$

```{=latex}
% ---- incolla qui i tre blocchi generati dallo script ------------
\def\PMFCOORDSA  { (0,0.000000) (1,0.000000) (2,0.000000) (3,0.000000) (4,0.000000) (5,0.000001) (6,0.000003) (7,0.000017
) (8,0.000070) (9,0.000249) (10,0.000771) (11,0.002103) (12,0.005081) (13,0.010944) (14,0.021107) (15,0.036585) (16,0.05
7164) (17,0.080702) (18,0.103119) (19,0.119401) (20,0.125371) (21,0.119401) (22,0.103119) (23,0.080702) (24,0.057164) (2
5,0.036585) (26,0.021107) (27,0.010944) (28,0.005081) (29,0.002103) (30,0.000771) (31,0.000249) (32,0.000070) (33,0.0000
17) (34,0.000003) (35,0.000001) (36,0.000000) (37,0.000000) (38,0.000000) (39,0.000000) (40,0.000000) }
\def\CDFTOPA     { (0,0.000000) (1,0.000000) (2,0.000000) (3,0.000000) (4,0.000000) (5,0.000001) (6,0.000004) (7,0.000021
) (8,0.000091) (9,0.000340) (10,0.001111) (11,0.003213) (12,0.008295) (13,0.019239) (14,0.040345) (15,0.076930) (16,0.13
4094) (17,0.214795) (18,0.317914) (19,0.437315) (20,0.562685) (21,0.682086) (22,0.785205) (23,0.865906) (24,0.923070) (2
5,0.959655) (26,0.980761) (27,0.991705) (28,0.996787) (29,0.998889) (30,0.999660) (31,0.999909) (32,0.999979) (33,0.9999
96) (34,0.999999) (35,1.000000) (36,1.000000) (37,1.000000) (38,1.000000) (39,1.000000) (40,1.000000) }

\def\PMFCOORDS  { (0,0.000001) (1,0.000011) (2,0.000091) (3,0.000495) (4,0.001963) (5,0.006057) (6,0.015143) (7,0.03152
2) (8,0.055726) (9,0.084916) (10,0.112817) (11,0.131864) (12,0.136574) (13,0.126068) (14,0.104199) (15,0.077405) (16,0.0
51834) (17,0.031362) (18,0.017174) (19,0.008523) (20,0.003835) (21,0.001565) (22,0.000579) (23,0.000194) (24,0.000059) (
25,0.000016) (26,0.000004) (27,0.000001) (28,0.000000) (29,0.000000) (30,0.000000) (31,0.000000) (32,0.000000) (33,0.000
000) (34,0.000000) (35,0.000000) (36,0.000000) (37,0.000000) (38,0.000000) (39,0.000000) (40,0.000000) }
\def\CDFTOP     { (0,0.000001) (1,0.000012) (2,0.000103) (3,0.000598) (4,0.002561) (5,0.008618) (6,0.023761) (7,0.05528
3) (8,0.111009) (9,0.195925) (10,0.308743) (11,0.440607) (12,0.577181) (13,0.703249) (14,0.807448) (15,0.884853) (16,0.9
36687) (17,0.968049) (18,0.985223) (19,0.993745) (20,0.997581) (21,0.999146) (22,0.999725) (23,0.999920) (24,0.999979) (
25,0.999995) (26,0.999999) (27,1.000000) (28,1.000000) (29,1.000000) (30,1.000000) (31,1.000000) (32,1.000000) (33,1.000
000) (34,1.000000) (35,1.000000) (36,1.000000) (37,1.000000) (38,1.000000) (39,1.000000) (40,1.000000) }

\def\PMFCOORDSB  { (0,0.000001) (1,0.000019) (2,0.000181) (3,0.001087) (4,0.004621) (5,0.014786) (6,0.036964) (7,0.07392
9) (8,0.120134) (9,0.160179) (10,0.176197) (11,0.160179) (12,0.120134) (13,0.073929) (14,0.036964) (15,0.014786) (16,0.0
04621) (17,0.001087) (18,0.000181) (19,0.000019) (20,0.000001) }
\def\CDFTOPB     { (0,0.000001) (1,0.000020) (2,0.000201) (3,0.001288) (4,0.005909) (5,0.020695) (6,0.057659) (7,0.13158
8) (8,0.251722) (9,0.411901) (10,0.588099) (11,0.748278) (12,0.868412) (13,0.942341) (14,0.979305) (15,0.994091) (16,0.9
98712) (17,0.999799) (18,0.999980) (19,0.999999) (20,1.000000) }


% ----------------------------------------------------------------

%------------------------------------------------
% STILI: ora registrati in /pgfplots/…
%------------------------------------------------
\pgfplotsset{
  pmfaxis/.style={
    width=7.3cm, height=5.5cm,
    axis lines=left, axis line style={-stealth},
    xmin=-0.85, xmax=44.5, ymin=-0.015, ymax=0.28,
    tick style={black,thin}, clip=false
  },
  cdfaxis/.style={
    width=7.3cm, height=5.5cm,
    axis lines=left, axis line style={-stealth},
    xmin=-0.85, xmax=44.5, ymin=-0.05, ymax=1.15,
    tick style={black,thin}, clip=false
  }
}
\begin{center}
\begin{tikzpicture}[>=stealth,line cap=round]

% ---------- PMF --------------------------------------------------
\begin{axis}[pmfaxis,
  ylabel={$p_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
  legend style={
      at={(0.70,0.98)},            % in alto a sinistra (0,0 = SW, 1,1 = NE)
      anchor=north west,
      draw=none,                   % niente bordo
      fill=none,                   % niente riquadro di sfondo
      font=\small
  },
  legend cell align=left           % etichette allineate a sx
]
  % serie 1: n=20, p=0.3  (grigio chiaro)
  \addplot[only marks,mark=*,gray!20] coordinates \PMFCOORDS;
  \addlegendentry{$B(40,0.3)$}

  % serie 2: n=20, p=0.5  (grigio medio)
  \addplot[only marks,mark=*,gray!70] coordinates \PMFCOORDSA;
  \addlegendentry{$B(40,0.5)$}

  % serie 3: n=10, p=0.5  (nero)
  \addplot[only marks,mark=*,black]  coordinates \PMFCOORDSB;
  \addlegendentry{$B(20,0.5)$}
\end{axis}

% ---------- CDF --------------------------------------------------
\begin{axis}[cdfaxis,
  at={(current bounding box.east)}, anchor=west, xshift=1.4cm,
  ylabel={$F_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south, rotate=-90},
  yticklabel style={yshift=-1.5pt},    % abbassa il “1”
  xlabel={$x$},
  xlabel style={
    at={(axis description cs:1,0)},
    anchor=north west,
    yshift=-2pt
  }
]
  % puntini pieni (sopra)
  \addplot[only marks,mark=*,gray!20] coordinates \CDFTOP;
  \addplot[only marks,mark=*,gray!70] coordinates \CDFTOPA;
  \addplot[only marks,mark=*,black] coordinates \CDFTOPB;


\end{axis}

\end{tikzpicture}
\\[0.2mm]
{\small
    Funzioni di massa e di ripartizione di tre variabili aleatorie $X \sim B(n,p)$.
}
\end{center}
\vspace{1mm}
```

Nei diagrammi binomiali la probabilità si concentra attorno a un punto che dipende da $p$: riducendo $p$ l’insieme dei valori più probabili scivola verso 0, aumentandolo scivola verso $n$; esattamente a metà ($p=0.5$) la curva risulta simmetrica rispetto al suo centro, mentre per valori diversi la coda più distante dal centro diventa più pronunciata. Il parametro $n$, invece, incide sulla larghezza complessiva della distribuzione: al crescere del numero di prove l’intervallo dove si trovano quasi tutti i risultati rimane proporzionalmente più stretto rispetto all’intero asse orizzontale, e il profilo assume una forma sempre più “campanulare”. In poche righe: $p$ stabilisce dove si colloca la massa di probabilità e quanta simmetria abbia il grafico, $n$ stabilisce quanto questa massa sia concentrata o dispersa.


\vspace{3mm}
Per definizione di variabile aleatoria binomiale, essa è la somma di $n$ variabili aleatorie bernoulliane, ognuna delle quali ha valore atteso $p$. Sfruttando la linearità del valore atteso, si ottiene
$$
\mathbb{E}[X] = \mathbb{E}\left[\,\sum_{i=1}^n X_i\right] = \sum_{i=1}^n \mathbb{E}[X_i] = \sum_{i=1}^n p = n p
$$
Ragionamento analogo si può fare per la varianza, notando che è possibile sfruttare l'indipendenza tra le variabili bernoulliane $X_i$ per evitare il termine di covarianza:
$$
\text{Var}(X) = \text{Var}\left(\,\sum_{i=1}^n X_i\right) = \sum_{i=1}^n \text{Var}(X_i) = \sum_{i=1}^n p(1-p) = n p \,(1-p)
$$

Come nel modello di Bernoulli, anche in questo caso la varianza assume il grafico di una parabola. La varianza aumenta sia quando $p$ tende a $1/2$, ma anche all'aumentare di $n$.

#### Riproducibilità

Si considerino due variabili aleatorie $X \sim B(n,p)$ e $Y \sim B(m,p)$ indipendenti tra loro. Queste due variabili non seguono la stessa distribuzione, ma sono correlate in quanto seguono lo stesso modello di distribuzione e, in aggiunta, condividono lo stesso parametro $p$.

La somma di due variabili aleatorie binomiali con lo stesso parametro $p$ è una variabile aleatoria binomiale con parametri $n+m$ e $p$:
$$
X + Y = \sum_{i=1}^n X_i + \sum_{i=1}^m Y_i = \sum_{i=1}^{n+m} Z_i \; \sim B(n+m,p)
$$

Si osserva che $\forall i = 1, \dots, n \quad Z_i = X_i$ e $\forall i = 1, \dots, m \quad Z_{n+i} = Y_i$.

Si dice perciò che questo modello gode della proprietà di riproducibilità tra variabili binomiali con lo stesso parametro $p$.

\hfill
### Modello uniforme discreto
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Modello uniforme discreto}
```

Questo modello si presenta quando l'esperimento casuale può restituire $n$ esiti distinti, ciascuno dei quali ha la stessa probabilità di verificarsi. Una variabile aleatoria $X$ che codifica tale esperimento si dice uniforme discreta con parametro $n$ e si indica con $X \sim U(n)$.

Il suo dominio di supporto è quindi $D_X = \{1, \dots, n\}$ e $\forall i \in D_X$ si ha che $\mathbb{P}(X=i) = 1/n$.

La funzione di massa di probabilità è definita come
\vspace{-0.5mm}
$$
p_X(x) = \dfrac{1}{n} \, I_{\{1,\dots,n\}}(x)
$$

La correttezza della funzione di massa di probabilità è banale, in quanto
\vspace{-0.5mm}
$$
\sum_{x \in D_X} p_X(x) = \sum_{i=1}^n \dfrac{1}{n} = 1
$$

La funzione di ripartizione di una variabile aleatoria uniforme discreta è definita come
\vspace{-0.5mm}
$$
F_X(x) = \mathbb{P}(X \le x) = \sum_{i \le x} p_X(i) = \sum_{i=1}^{\floor{x}} p_X(i) = \sum_{i=1}^{\floor{x}} \dfrac{1}{n} = \dfrac{\floor{x}}{n} \, I_{[1,n)}(x) + I_{[n,+\infty)}(x)
$$


```{=latex}
\vspace{1mm}
%------------------------------------------------
%   UNIFORME DISCRETA SU {1,…,n}
%   (qui n = 7 solo per far girare i cicli)
%------------------------------------------------
\def\numpts{7}                       % ← cambia se serve un n diverso
\pgfmathsetmacro{\invn}{1/\numpts}   % 1/n

%------------------------------------------------
%   GRAFICI AFFIANCATI • STILI IDENTICI
%------------------------------------------------
\begin{center}
\begin{tikzpicture}[>=stealth,line cap=round]
  \begin{axis}[pmfaxis,
    width=7cm, height=5cm,
    ylabel={$p_{X}$},
    ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
    xlabel={$x$},
    xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
    ytick={0,\invn},
    yticklabels={$0$,$\dfrac1n$},
    xtick={1,2,4,5,6,7},
    xticklabels={$1$,$2$,$\dots$,,$n{-}1$,$n$},
    xmin=0.4, xmax=\numpts+0.9,
    ymin=0, ymax=2*\invn,
    clip=false
  ]
      % asse x
      \addplot[gray!30,very thick]
               coordinates {(0.45,0) (\numpts+0.7,0)};

      % barrette uniformi
      \foreach \k in {1,...,\numpts}{
          \addplot[black,thick]  coordinates {(\k,0) (\k,\invn)};
          % puntino pieno
          \addplot[gray!30,only marks,mark=*] coordinates {(\k,\invn)};
          % puntino vuoto alla base
          \addplot[white,draw=gray!30,very thick,
                   mark=*,mark options={scale=1.25,fill=white},
                   only marks] coordinates {(\k,0)};
      }
  \end{axis}

  \begin{axis}[cdfaxis,
    width=7cm, height=5cm,
    at={(current bounding box.east)}, anchor=west, xshift=1.6cm,
    ylabel={$F_{X}$},
    ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
    xlabel={$x$},
    xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
    ytick={0,\invn,2*\invn,4*\invn,6*\invn,1},
    yticklabels={$0$,$1/n$,$2/n$,$\dots$,$(n{-}1)/n$,$1$},
    xtick={1,2,4,6,7},
    xticklabels={$1$,$2$,$\dots$,$n{-}1$,$n$},
    xmin=0.4, xmax=\numpts+1,
    ymin=0, ymax=1.15,
    clip=false
  ]
      % segmento iniziale a F(0)=0
      \addplot[gray!30,very thick] coordinates {(0.5,0) (1,0)};

      \addplot[black,very thin,dashed] coordinates {(0.66,1) (7,1)};
      \addplot[black,very thin,dashed] coordinates {(7,0.05) (7,1)};

      % costruisci la scala: orizzontale + salto di 1/n
      \pgfmathsetmacro{\cumprob}{0}
      \foreach \k in {1,...,\numpts}{
          \pgfmathsetmacro{\cumnext}{\cumprob + \invn}

          % salto verticale
          \addplot[black,thin] coordinates {(\k,\cumprob) (\k,\cumnext)};

          % tratto orizzontale (chiuso–aperto)
          \pgfmathsetmacro{\xnext}{\k + ( (\k<\numpts) ? 1 : 0.6 )}
          \addplot[gray!30,very thick] coordinates {(\k,\cumnext) (\xnext,\cumnext)};

          % puntini pieno/vuoto
          \addplot[gray!30,only marks,mark=*]   coordinates {(\k,\cumnext)};
          \addplot[white,draw=gray!30,very thick,
                   mark=*,mark options={scale=1.25,fill=white},
                   only marks] coordinates {(\k,\cumprob)};

          \xdef\cumprob{\cumnext}
      }
  \end{axis}
\end{tikzpicture}

\vspace{-2mm}
{\small
    Funzioni di massa e di ripartizione della variabile aleatoria $X \sim U(n)$
}
\end{center}
\vspace{1mm}
```
Nel grafico della funzione di massa di probabilità l’uniformità si traduce in $n$ segmenti verticali di identica altezza $1/n$; l’insieme delle barre forma pertanto un profilo costante, privo di qualsiasi tendenza monotona.
La funzione di ripartizione mostra gradini di ampiezza orizzontale unitaria e altezza invariata $1/n$; la somma di tali incrementi genera una scalinata lineare che cresce con pendenza costante, raggiungendo il valore $1$ in corrispondenza dell’ultimo punto $x=n$.


\vspace{2mm}
Il valore atteso è dato da
\begin{align*}
\mathbb{E}[X] & = \sum_{x=1}^n x\, p_X(x) = \sum_{x=1}^n \dfrac{x}{n} = \dfrac{1}{n} \sum_{x=1}^n x = \dfrac{1}{n}\, \dfrac{n(n+1)}{2} = \dfrac{n+1}{2}
\end{align*}

La varianza invece si calcola come
\begin{align*}
\mathbb{E}[X^2] & = \sum_{x=1}^n x^2\, p_X(x) = \sum_{x=1}^n \dfrac{x^2}{n} = \dfrac{1}{n} \sum_{x=1}^n x^2 = \dfrac{1}{n}\, \dfrac{n(n+1)(2n+1)}{6} = \dfrac{(n+1)(2n+1)}{6} \\[1.5em]
\text{Var}(X) & = \mathbb{E}[X^2] - \mathbb{E}[X]^2 = \dfrac{(n+1)(2n+1)}{6} - \dfrac{(n+1)^2}{4} = (n+1) \left( \dfrac{2n+1}{6} - \dfrac{n+1}{4} \right)\\[0.5em]
&  = (n+1) \left( \dfrac{4n + 2 - 3n - 3}{12} \right) = \dfrac{(n+1)(n-1)}{12} = \dfrac{(n^2-1)}{12}
\end{align*}


\newpage
### Modello geometrico
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Modello geometrico}
```
Si supponga di realizzare un esperimento di Bernoulli con parametro $p$ e di contare il numero di prove necessarie affinché si verifichi il primo successo. La variabile aleatoria $X$ che codifica questo esperimento si dice geometrica con parametro $p$ e si indica con $X \sim G(p)$.

Formalmente, date $X_1, X_2, \dots$ variabili aleatorie indipendenti e identicamente distribuite (i.i.d.) di Bernoulli con parametro $p$, si pone

\vspace{-7mm}
$$
T = \min\{\,i\ge 1 \mid X_i = 1\}
\qquad
X = T-1 \;\sim\; G(p)
$$
dove $T$ è l’istante del primo successo e $X$ conta i fallimenti che lo precedono.

Si osserva che se $p=1$ allora $X=0$ con probabilità 1, mentre se $p=0$ allora $X \to +\infty$ con probabilità 1. In entrambi i casi la variabile aleatoria è degenere. Si considera per tale motivo $p \in (0,1)$.

\vspace{3mm}
#### Funzione di massa di probabilità
Il dominio di supporto è $D_X = \mathbb{N} \cup \{0\}$. La funzione di massa di probabilità è definita come
$$
p_X(x) = p\,(1-p)^x \, I_{\mathbb{N} \cup \{0\}}(x)
$$

Infatti calcolare $p_X(x) = \mathbb{P}(X=x)$ equivale a calcolare la probabilità che i primi $x$ esperimenti siano falliti e che il $(x+1)$-esimo sia un successo, ossia:
$$
\mathbb{P}(X=x) = \mathbb{P}\left(\,\bigcap_{i=0}^x X_i = 0, X_{x+1} = 1\right) \overset{(1)}{=} \prod_{i=0}^x \mathbb{P}(X_i = 0) \, \mathbb{P}(X_{x+1} = 1) = \prod_{i=0}^x (1-p) \, p = p\,(1-p)^x
$$
$\begin{small}\qquad\text{(1): per indipendenza}\end{small}$

La correttezza della funzione di massa di probabilità è così dimostrata:
\begin{align*}
\sum_{x = 0}^{+\infty} = \sum_{x = 0}^{+\infty} p(1-p)^x & = p \sum_{x = 0}^{+\infty} (1-p)^x \overset{(1)}{=} p \, \dfrac{1}{1-(1-p)} = p \, \dfrac{1}{p} = 1
\end{align*}

\vspace{-2mm}
$\begin{small}
  \qquad \displaystyle
  \text{(1): per la formula della somma geometrica: }
  \sum_{i=0}^{+\infty} \alpha^i
  \text{ converge a }
  \dfrac{1}{1 - \alpha}
  \text{ per }-1 < \alpha < 1.
  \text{ Nel nostro caso }\\[1mm]
  \hspace*{3.9em} \alpha = 1-p, \text{ che è una probabilità ed è quindi compresa tra 0 e 1.}
\end{small}$


\vspace{3mm}
#### Funzione di ripartizione
Prima di calcolare la funzione di ripartizione, si osservi che
\begin{align*}
\mathbb{P}(X > n) & = \sum_{x=n+1}^{+\infty} p_X(x) = \sum_{x=n+1}^{+\infty} p\,(1-p)^x = p\, (1-p)^{n+1} \sum_{x=n+1}^{+\infty} (1-p)^{x-(n+1)}\\[0.5em]
&  \overset{(1)}{=} p\, (1-p)^{n+1} \sum_{y=0}^{+\infty} (1-p)^y  \overset{(2)}{=} p\, (1-p)^{n+1} \, \dfrac{1}{1-(1-p)} = p\, (1-p)^{n+1}\, \dfrac{1}{p} = (1-p)^{n+1}
\end{align*}

$\begin{small}
  \qquad\text{(1): ponendo } y = x - (n+1)\\[1mm]
  \hspace*{2em} \text{(2): per la formula della serie geometrica}
\end{small}$

\vspace{2mm}
Ora è possibile calcolare la funzione di ripartizione:
\begin{align*}
F_X(n) 
  &= \mathbb{P}(X \le n)
     = 1 - \mathbb{P}(X > n)
     = \left[ 1 - (1-p)^{n+1} \right] \, I_{\mathbb{N} \cup \{0\}}(n)
  \qquad\, \text{per valori interi}\\[0.5em]
F_X(x) 
  &= \mathbb{P}(X \le x)
     = \mathbb{P}(X \le \lfloor x\rfloor)
     = \left[ 1 - (1-p)^{\lfloor x\rfloor+1} \right] \, I_{[0, +\infty)}(x)
  \qquad \text{per valori reali}
\end{align*}


```{=latex}
%------------------------------------------------
%  STILI USATI PIÙ VOLTE
%------------------------------------------------
\pgfplotsset{
  pmfaxis/.style={
    width=7cm,height=5cm,
    axis lines=left, axis line style={-stealth},
    xmin=0.5, xmax=11,
    ymin=0,   ymax=0.4,
    tick style={black,thin}, clip=false
  },
  cdfaxis/.style={
    width=7cm,height=5cm,
    axis lines=left, axis line style={-stealth},
    xmin=0.5, xmax=11,
    ymin=0,   ymax=1.15,
    tick style={black,thin}, clip=false
  }
}

%------------------------------------------------
%  PARAMETRI DEL MODELLO GEOMETRICO
%------------------------------------------------
\def\p{0.4}                           % probabilità di successo
\pgfmathsetmacro{\q}{1-\p}             % 1-p
\def\maxk{10}                          % quanti valori mostrare (1..maxk)

%--- valori già calcolati per gli assi (evita errori "ill-formatted") ----
\pgfmathsetmacro{\PtwoTick}{\p*\q}           % p(1-p)
\pgfmathsetmacro{\FoneTick}{1-\q}            % 1-q
\pgfmathsetmacro{\FtwoTick}{1-pow(\q,2)}     % 1-q^2

%------------------------------------------------
\begin{center}
\begin{tikzpicture}[>=stealth,line cap=round]

%================================================
%  PMF
%================================================
\begin{axis}[pmfaxis,
  ylabel={$p_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
  ytick={0,\p,\PtwoTick},
  yticklabels={$0$,$p$,$p(1-p)$},
  xtick={0,...,\maxk},
  xmin=0.4, xmax=\maxk+1,
  ymin=0,   ymax={\p*1.25},
  clip=false
]
  % linea di base
  \addplot[gray!30,very thick] coordinates {(0.47,0) (\maxk+0.7,0)};

  % barrette + puntini
  \foreach \k in {1,...,\maxk}{
      \pgfmathtruncatemacro{\exp}{\k-1}
      \pgfmathsetmacro{\pmf}{\p * pow(\q,\exp)}
      \addplot[black,thin] coordinates {(\k,-0.01) (\k,\pmf)};
      % \addplot[white,draw=gray!30,very thick,
      %          mark=*,mark options={scale=1.25,fill=white},
      %          only marks] coordinates {(\k,0)};
      \addplot[gray!30,only marks,mark=*] coordinates {(\k,\pmf)};
  }

\end{axis}

%================================================
%  CDF
%================================================
\begin{axis}[cdfaxis,
  at={(current bounding box.east)}, anchor=west, xshift=1.4cm,
  ylabel={$F_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
  ytick={0,\FoneTick,\FtwoTick,1},
  yticklabels={$0$,$1-q$,$1-q^{2}$,$1$},
  xtick={0,...,\maxk},
  xmin=0.4, xmax=\maxk+1.5,
  ymin=0,   ymax=1.15,
  clip=false
]
  % tratto iniziale F(0)=0
  \addplot[gray!30,very thick] coordinates {(0.5,0) (1,0)};

  \addplot[black,very thin,dashed] coordinates {(0.66,1) (\maxk,1)};
  \addplot[black,very thin,dashed] coordinates {(\maxk,0.05) (\maxk,1)};


  % gradini e puntini
  \pgfmathsetmacro{\cumprob}{0}
  \foreach \k in {1,...,\maxk}{
      \pgfmathtruncatemacro{\expnext}{\k}
      \pgfmathsetmacro{\cumnext}{1 - pow(\q,\expnext)}

      % salto verticale
      \addplot[black,thin] coordinates {(\k,\cumprob+0.008) (\k,\cumnext)};

      % segmento orizzontale
      \pgfmathsetmacro{\xnext}{\k + ( (\k<\maxk) ? 1 : 0.6 )}
      \addplot[gray!30,very thick] coordinates {(\k,\cumnext) (\xnext,\cumnext)};

      % punti pieno / vuoto
      % \addplot[white,draw=gray!30,very thick,
      %          mark=*,mark options={scale=1.25,fill=white},
      %          only marks] coordinates {(\k,\cumprob)};
      \addplot[gray!30,only marks,mark=*] coordinates {(\k,\cumnext)};

      \xdef\cumprob{\cumnext}
  }

\end{axis}

\end{tikzpicture}

{\small Funzioni di massa e di ripartizione della variabile
\(X\sim\mathrm{G}(0.4)\) con $q=1{-}p=0.6$.
}
\end{center}
\vspace{1mm}
```
Il grafico della funzione di massa di probabilità presenta un decadimento esponenziale, ed è tanto più ripido quanto più è grande il valore di $p$. Quando la probabilità di successo è elevata, la porzione di probabilità che permane dopo ciascun tentativo, ossia quella associata al fattore $(1-p)$, si riduce sensibilmente: le colonne si contraggono rapidamente e la quasi totalità della massa si concentra nei primissimi valori. Di riflesso, nella funzione di ripartizione i gradini iniziali assorbono quasi tutta la probabilità, così la curva cresce in maniera brusca e si assesta vicino a 1 già dopo pochi incrementi di $x$.



##### Assenza di memoria
L'assenza di memoria è una proprietà di cui gode il modello geometrico, ed è l'unico a possederla tra i vari modelli discreti. Si consideri $X \sim G(p)$ e si provi a calcolare $\mathbb{P}(X > s+t \mid X \ge s)$, ovvero la probabilità condizionata di ottenere un successo dopo $s+t$ prove, sapendo che ne sono già state effettuate $s$ senza successo. Si ha:
\begin{gather*}
\mathbb{P}(X \ge n) = \mathbb{P}(X > n-1) = (1-p)^n \qquad \forall n \in \mathbb{N} \cup 0\\[0.5em]
\mathbb{P}(X \ge s+t \mid X \ge s)  = \dfrac{\mathbb{P}(X \ge s+j, X \ge s)}{\mathbb{P}(X \ge s)} = \dfrac{\mathbb{P}(X \ge s+j)}{\mathbb{P}(X \ge s)} = \dfrac{(1-p)^{s+j}}{(1-p)^s} = (1-p)^t = \mathbb{P}(X \ge t)
\end{gather*}

Si ottiene quindi che $\mathbb{P}(X > s+t \mid X \ge s) = \mathbb{P}(X > t)$, ossia la probabilità di ottenere un successo dopo $s+t$ prove, sapendo che ne sono già state effettuate $s$ senza successo, è uguale alla probabilità di ottenere un successo dopo $t$ prove. In altre parole, il numero di prove necessarie per ottenere il primo successo non dipende da quante prove siano già state effettuate.

\vspace{2mm}
#### Valore atteso e varianza

Prima di calcolare il valore atteso, si osservi che
\begin{align*}
\sum_{i=0}^{+\infty} i \alpha^i & = \alpha \sum_{i=0}^{+\infty} i \alpha^{i-1} \overset{(1)}{=} \alpha \sum_{i=1}^{+\infty} \dfrac{d}{d\alpha} \alpha^i = \alpha \dfrac{d}{d\alpha} \left[\, \sum_{i=0}^{+\infty} \alpha^i \,\right]
\overset{(2)}{=} \alpha \dfrac{d}{d\alpha} \left( \dfrac{1}{1-\alpha} \right) \overset{(3)}{=} \alpha \dfrac{1}{(1-\alpha)^2} = \dfrac{\alpha}{(1-\alpha)^2}
\end{align*}
$\begin{small}
  \qquad\text{(1): } \displaystyle \dfrac{d}{dx} x^i = i\, x^{i-1}\\[1mm]
  \hspace*{2em} \text{(2): per la formula della serie geometrica, considerando } |\alpha| < 1\\[1mm]
  \hspace*{2em} \text{(3): } \displaystyle \dfrac{d}{dx} \dfrac{1}{x} = -\dfrac{1}{x^2}
\end{small}$

\vspace{3mm}
Ora è possibile calcolare il valore atteso:
\begin{align*}
\mathbb{E}[X] & = \sum_{x = 0}^{+\infty} x\, p_X(x) = \sum_{x = 0}^{+\infty} x\, p(1-p)^x = p \sum_{x = 0}^{+\infty} x (1-p)^x
\overset{(1)}{=} p \dfrac{1-p}{[1-(1-p)]^2} = p \dfrac{1-p}{p^2} = \dfrac{1-p}{p}
\end{align*}
$\begin{small}
  \qquad\text{(1): per l'osservazione appena fatta, che si può utilizzare in quanto $0 < 1-p < 1$ e quindi la serie converge}
\end{small}$


La varianza è data da:
\begin{align*}
\mathbb{E}[X^2] & = \sum_{x = 0}^{+\infty} x^2\, p (1-p)^x = p(1-p) \sum_{x = 0}^{+\infty} x^2 (1-p)^{x-1} \overset{(1)}{=} p(1-p) \sum_{x = 0}^{+\infty} \dfrac{d}{dp} \left[-x(1-p)^x\right] \\[0.5em]
& = p(1-p) \dfrac{d}{dp} \left[\, \sum_{x = 0}^{+\infty} -x (1-p)^x \, \right] = - p(1-p) \dfrac{d}{dp} \left[\, \sum_{x = 0}^{+\infty} x (1-p)^x \, \right] \overset{(2)}{=} -p(1-p) \dfrac{d}{dp} \left( \dfrac{1-p}{p^2} \right) \\[0.5em]
& = - \cancel{p} (1-p) \dfrac{-p^2 -2p(1-p)}{p^{\cancel{4} 3}} = -(1-p) \dfrac{-p -2(1-p)}{p^2} = (1-p) \dfrac{p + 2 -2p}{p^2} = \dfrac{(1-p)(2-p)}{p^2}
\end{align*}

$\begin{small}
  \qquad\text{(1): } \displaystyle \dfrac{d}{dx} x(1-p)^x = - x^2 (1-p)^{x-1} \;\;\Rightarrow \;\;
  \displaystyle \dfrac{d}{dx} [-x (1-p)^x] = x^2 (1-p)^{x-1} \\[1mm]
  \hspace*{2em} \text{(2): per l'osservazione fatta in precedenza}
\end{small}$

\vspace{-4mm}
\begin{align*}
\text{Var}(X) & = \mathbb{E}[X^2] - \mathbb{E}[X]^2 = \dfrac{(1-p)(2-p)}{p^2} - \left(\dfrac{1-p}{p}\right)^2 = \dfrac{(1-p)(2-p) - (1-p)^2}{p^2}\\[0.5em]
& = \dfrac{(1-p)(2- \cancel p - 1 + \cancel p)}{p^2} = \dfrac{1-p}{p^2}
\end{align*}


\hfill
### Modello di Poisson
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Modello di Poisson}
```


La distribuzione di Poisson nasce come modello per il conteggio di eventi rari che si verificano in un intervallo di tempo o in una regione di spazio (es. numero di refusi in un libro, chiamate al centralino in un minuto).

Dal punto di vista teorico si ottiene come caso limite della distribuzione binomiale: sia $\{X_n\}_{n\ge 1}$ una successione di variabili aleatorie con $X_n \sim \mathrm{B}(n,p_n)$, dove all'interno di ogni esperimento le $n$ prove bernoulliane sono indipendenti e hanno tutte la stessa probabilità di successo $p_n$. Se esiste $\lambda>0$ tale che
$$
\lim_{n\to\infty} n\,p_n = \lambda,
$$
allora $X_n$ converge in distribuzione a una variabile $X$ di Poisson con parametro $\lambda$:
$$
X_n \xrightarrow{\,d\,} \mathrm{P}(\lambda).
$$
Pertanto, quando $n$ è molto grande e $p$ è molto piccolo in modo che $n p = \lambda$ rimanga finito, la binomiale $B(n,p)$ è ben approssimata dalla $\mathrm{P}(\lambda)$.

\vspace{2mm}
#### Funzioni di massa di probabilità e di ripartizione
A differenza della binomiale, il dominio di supporto è $D_X = \mathbb{N} \cup \{0\}$, e non ha quindi una specificazione massima. La funzione di massa di probabilità è definita come
$$
p_X(i) = \dfrac{\lambda^i}{i!}\, e^{-\lambda} \, I_{\mathbb{N} \cup \{0\}}(i)
$$

Infatti per calcolare $p_X(i) = \mathbb{P}(X=i)$ si considera, per definizione di variabile aleatoria di Poisson, la funzione di massa di probabilità come il limite della funzione di massa di probabilità della binomiale $X_n$:
$$
p_X(i) = \lim_{n\to\infty} \mathbb{P}(X_n=i) = \lim_{n\to\infty} \binom{n}{i}\, p^i\, (1-p)^{n-i}
$$

\newpage
Prima di sviluppare il limite, si osservi che:

- $\dbinom{n}{i} = \dfrac{n!}{i!\,(n-i)!} = \dfrac{n\,(n-1)\cdots(n-i+1)}{i!} \,$ dove i fattori al numeratore sono $i$ in totale
- $p = \dfrac{\lambda}{n}\,$ per il vincolo $n p = \lambda$

Sostituendo quanto riportato sopra si ottiene
\begin{align*}
p_X(i) & = \lim_{n\to\infty} \dfrac{n(n-1)\cdots(n-i+1)}{i!} \, \dfrac{\lambda^i}{n^i} \, \left(1-\dfrac{\lambda}{n}\right)^{n-i}
= \dfrac{\lambda^i}{i!} \lim_{n\to\infty} \dfrac{n(n-1)\cdots(n-i+1)}{n^i} \, \left( 1 - \dfrac{\lambda}{n} \right)^{n-i} \\[1mm]
& \overset{(1)}{=} \dfrac{\lambda^i}{i!} \, \lim_{n\to\infty} \dfrac{n}{n} \,\dfrac{n-1}{n} \cdots \dfrac{n-i+1}{n} \, \left( 1 - \dfrac{\lambda}{n} \right)^{n-i}
= \dfrac{\lambda^i}{i!} \lim_{n\to\infty} \left[\, \prod_{k=0}^{i-1} \left( \dfrac{n-k}{n} \right) \right] \, \left( 1 - \dfrac{\lambda}{n} \right)^n \, \left( 1 - \dfrac{\lambda}{n} \right)^{-i}\\[1mm]
& \overset{(2)}{=} \dfrac{\lambda^i}{i!} \cdot 1 \cdot e^{-\lambda} \cdot 1 
= \dfrac{\lambda^i}{i!} \, e^{-\lambda}
\end{align*}
\begin{small}
  \qquad\text{(1): il primo termine del limite è scomposto in $i$ fattori }

  \qquad\text{(2): per il limite notevole } $\displaystyle \lim_{n\to\infty} \left(1 - \dfrac{\alpha}{n}\right)^n = e^{-\alpha}$
\end{small}


\vspace{3mm}
La correttezza della funzione di massa di probabilità è verificata come segue:
$$
\sum_{i=0}^{+\infty} p_X(i) = \sum_{i=0}^{+\infty} \dfrac{\lambda^i}{i!} e^{-\lambda} = e^{-\lambda} \sum_{i=0}^{+\infty} \dfrac{\lambda^i}{i!} \overset{(1)}{=} e^{-\lambda} e^{\lambda} = 1
$$
\vspace{-3mm}
\begin{small}
  \qquad\text{(1): per lo sviluppo in serie di Taylor centrato in $0$ di $e^{\lambda}$ si ha } $\displaystyle e^{\lambda} = \sum_{i=0}^{+\infty} \dfrac{\lambda^i}{i!}$
\end{small}


\vspace{3mm}
La funzione di ripartizione di una variabile aleatoria di Poisson è definita come
$$
F_X(x) = \mathbb{P}(X \le \floor{x}) = \left(\, \sum_{i=0}^{\floor{x}} p_X(i) \right) I_{[0,+\infty)}(x)
$$

```{=latex}
\def\PMFCOORDS  { (0,0.000045) (1,0.000454) (2,0.002270) (3,0.007567) (4,0.018917) (5,0.037833) (6,0.063055) (7,0.090079
) (8,0.112599) (9,0.125110) (10,0.125110) (11,0.113736) (12,0.094780) (13,0.072908) (14,0.052077) (15,0.034718) (16,0.02
1699) (17,0.012764) (18,0.007091) (19,0.003732) (20,0.001866) }
\def\CDFTOP     { (0,0.000045) (1,0.000499) (2,0.002769) (3,0.010336) (4,0.029253) (5,0.067086) (6,0.130141) (7,0.220221
) (8,0.332820) (9,0.457930) (10,0.583040) (11,0.696776) (12,0.791556) (13,0.864464) (14,0.916542) (15,0.951260) (16,0.97
2958) (17,0.985722) (18,0.992813) (19,0.996546) (20,0.998412) }


\def\PMFCOORDSA  { (0,0.018316) (1,0.073263) (2,0.146525) (3,0.195367) (4,0.195367) (5,0.156293) (6,0.104196) (7,0.05954
0) (8,0.029770) (9,0.013231) (10,0.005292) (11,0.001925) (12,0.000642) (13,0.000197) (14,0.000056) (15,0.000015) (16,0.0
00004) (17,0.000001) (18,0.000000) (19,0.000000) (20,0.000000) }
\def\CDFTOPA     { (0,0.018316) (1,0.091578) (2,0.238103) (3,0.433470) (4,0.628837) (5,0.785130) (6,0.889326) (7,0.94886
6) (8,0.978637) (9,0.991868) (10,0.997160) (11,0.999085) (12,0.999726) (13,0.999924) (14,0.999980) (15,0.999995) (16,0.9
99999) (17,1.000000) (18,1.000000) (19,1.000000) (20,1.000000) }

\def\PMFCOORDSB  { (0,0.367879) (1,0.367879) (2,0.183940) (3,0.061313) (4,0.015328) (5,0.003066) (6,0.000511) (7,0.00007
3) (8,0.000009) (9,0.000001) (10,0.000000) (11,0.000000) (12,0.000000) (13,0.000000) (14,0.000000) (15,0.000000) (16,0.0
00000) (17,0.000000) (18,0.000000) (19,0.000000) (20,0.000000) }
\def\CDFTOPB     { (0,0.367879) (1,0.735759) (2,0.919699) (3,0.981012) (4,0.996340) (5,0.999406) (6,0.999917) (7,0.99999
0) (8,0.999999) (9,1.000000) (10,1.000000) (11,1.000000) (12,1.000000) (13,1.000000) (14,1.000000) (15,1.000000) (16,1.0
00000) (17,1.000000) (18,1.000000) (19,1.000000) (20,1.000000) }

% ----------------------------------------------------------------


%------------------------------------------------
% STILI: ora registrati in /pgfplots/…
%------------------------------------------------
\pgfplotsset{
  pmfaxis/.style={
    width=7.3cm, height=5.5cm,
    axis lines=left, axis line style={-stealth},
    xmin=-1.2, xmax=22.0, ymin=-0.028, ymax=0.45,
    tick style={black,thin}, clip=false
  },
  cdfaxis/.style={
    width=7.3cm, height=5.5cm,
    axis lines=left, axis line style={-stealth},
    xmin=-1.2, xmax=22.0, ymin=-0.075, ymax=1.15,
    tick style={black,thin}, clip=false
  }
}
\begin{center}
\begin{tikzpicture}[>=stealth,line cap=round]

% ---------- PMF --------------------------------------------------
\begin{axis}[pmfaxis,
  ylabel={$p_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
  legend style={
      at={(0.80,0.98)},            % in alto a sinistra (0,0 = SW, 1,1 = NE)
      anchor=north west,
      draw=none,                   % niente bordo
      fill=none,                   % niente riquadro di sfondo
      font=\small
  },
  legend cell align=left           % etichette allineate a sx
]
  % serie 3: n=10, p=0.5  (nero)
  \addplot[only marks,mark=*,black]  coordinates \PMFCOORDSB;
  \addlegendentry{$P(1)$}

  % serie 2: n=20, p=0.5  (grigio medio)
  \addplot[only marks,mark=*,gray!70] coordinates \PMFCOORDSA;
  \addlegendentry{$P(4)$}

  % serie 1: n=20, p=0.3  (grigio chiaro)
  \addplot[only marks,mark=*,gray!20] coordinates \PMFCOORDS;
  \addlegendentry{$P(10)$}


\end{axis}

% ---------- CDF --------------------------------------------------
\begin{axis}[cdfaxis,
  at={(current bounding box.east)}, anchor=west, xshift=1.4cm,
  ylabel={$F_{X}$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south, rotate=-90},
  yticklabel style={yshift=-1.5pt},    % abbassa il “1”
  xlabel={$x$},
  xlabel style={
    at={(axis description cs:1,0)},
    anchor=north west,
    yshift=-2pt
  }
]

  % puntini pieni (sopra)
  \addplot[only marks,mark=*,black] coordinates \CDFTOPB;
  \addplot[only marks,mark=*,gray!70] coordinates \CDFTOPA;
  \addplot[only marks,mark=*,gray!20] coordinates \CDFTOP;

\end{axis}

\end{tikzpicture}
\\[0.2mm]
{\small
    Funzioni di massa e di ripartizione di tre variabili aleatorie $X \sim P(\lambda)$.
}
\end{center}
\vspace{1mm}
```

Si osserva che la funzione di massa di probabilità è definita per ogni $i \in \mathbb{N} \cup \{0\}$, e che il suo grafico presenta un andamento crescente fino a un certo punto, per poi decrescere esponenzialmente fino a tendere a 0. È anche possibile che essa decresca subito nel caso in cui $\lambda \le 1$.


> **Approfondimento** Per vedere l'andamento della funzione di massa di probabilità al variare del parametro $\lambda$, bisogna considerare il rapporto consecutivo tra i due termini della successione:
$$
\dfrac{p_X(i+1)}{p_X(i)} = \frac{\lambda^{i+1}}{(i+1)!} e^{-\lambda} \cdot \frac{i!}{\lambda^i e^{-\lambda}} = \frac{\lambda}{i+1}
$$
> Si osserva quindi che la funzione cresce o decresce nel seguente modo:
$$
\dfrac{p(i+1)}{p(i)} \;\;
\begin{cases}
{>}\,1 &\Longleftrightarrow\;\; i<\lambda-1,\\[4pt]
<1 &\Longleftrightarrow\;\; i>\lambda-1.
\end{cases}
$$
> Si conclude quindi che la funzione di massa di probabilità è crescente per $i \le \floor{\lambda}$ e decrescente per $i>\floor{\lambda}$. Il massimo viene raggiunto per $i=\floor{\lambda}$ o $i=\floor{\lambda}+1$ a seconda che $\lambda$ sia intero o meno.
> Nel caso in cui $\lambda \le 1$, poiché già per i=0 vale $\lambda<1$, il massimo è in $i=0$ e la funzione decresce subito. Si osserva che per $\lambda = 1$ le prime due specificazioni hanno la stessa probabilità.


\hspace{2mm}
#### Valore atteso e varianza
Il valore atteso di una variabile aleatoria di Poisson è dato da
\begin{align*}
\mathbb{E}[X] & = \sum_{i=0}^{+\infty} i\, p_X(i) = \sum_{i=0}^{+\infty} i\, \dfrac{\lambda^i}{i!} e^{-\lambda} \overset{(1)}{=} e^{-\lambda} \sum_{i=1}^{+\infty} i\, \dfrac{\lambda^i}{i!} = e^{-\lambda} \sum_{i=1}^{+\infty} \dfrac{\lambda^i}{(i-1)!} \\[0.5em]
& = \lambda \, e^{-\lambda} \sum_{i=1}^{+\infty} \dfrac{\lambda^{i-1}}{(i-1)!} \overset{(2)}{=} \lambda \, e^{-\lambda} \sum_{j=0}^{+\infty} \dfrac{\lambda^j}{j!} \overset{(3)}{=} \lambda \, e^{-\lambda} e^{\lambda} = \lambda
\end{align*}
\begin{small}
  \qquad\text{(1): la sommatoria parte da 1 in quanto per $i=0$ il termine è nullo}\\[1mm]
  \hspace*{2em}\text{(2): ponendo } $j = i - 1$ \\[0mm]
  \hspace*{2em}\text{(3): per lo sviluppo in serie di Taylor centrato in $0$ di $e^{\lambda}$ si ha } $\displaystyle e^{\lambda} = \sum_{j=0}^{+\infty} \dfrac{\lambda^j}{j!}$
\end{small}

La varianza è data da:
\begin{align*}
\mathbb{E}[X^2] & = \sum_{i=0}^{+\infty} i^2\, p_X(i) 
    \overset{(1)}{=} \sum_{i=1}^{+\infty} i^2\, \dfrac{\lambda^i}{i!} e^{-\lambda} 
    = \sum_{i=1}^{+\infty} i\, \dfrac{\lambda^i}{(i-1)!} e^{-\lambda} 
    = \lambda \sum_{i=1}^{+\infty} i\, \dfrac{\lambda^{i-1}}{(i-1)!} e^{-\lambda} \\[0.5em]
& = \lambda \sum_{i=1}^{+\infty} \left[ ((i-1) +1) \dfrac{\lambda^{i-1}}{(i-1)!} e^{-\lambda} \right]
    = \lambda \left[\, \sum_{i=1}^{+\infty} (i-1) \dfrac{\lambda^{i-1}}{(i-1)!} e^{-\lambda} + \sum_{i=1}^{+\infty} \dfrac{\lambda^{i-1}}{(i-1)!} e^{-\lambda} \right] \\[0.5em]
& \overset{(2)}{=} \lambda \left[\, \sum_{j=0}^{+\infty} j \dfrac{\lambda^j}{j!} e^{-\lambda} + \sum_{j=0}^{+\infty} \dfrac{\lambda^j}{j!} e^{-\lambda} \right] 
    \overset{(3)}{=} \lambda \left[ \,\mathbb{E}[X] + 1 \, \right] 
    = \lambda (\lambda + 1) = \lambda^2 + \lambda
\end{align*}
\begin{small}
  \qquad\text{(1): la sommatoria parte da 1 in quanto per $i=0$ il termine è nullo}\\[1mm]
  \hspace*{2em}\text{(2): ponendo } $j = i - 1$\\[1mm]
  \hspace*{2em}\text{(3): il primo termine della sommatoria corrisponde al valore atteso di $X$, mentre il secondo è la somma di tutte } \\ 
    \hspace*{3.7em}  \text{le specificazioni, e converge, come già dimostrato, a 1.}
\end{small}

\vspace{-2mm}
$$
\text{Var}(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2 = \lambda^2 + \lambda - \lambda^2 = \lambda
$$

Quindi sia il valore atteso che la varianza delle variabili aleatorie di Poisson sono uguali al parametro $\lambda$. 


Come già visto in precedenza, le variabili aleatorie di Poisson possono essere utilizzate come approssimazione di una binomiale di parametri $(n,p)$ quando $n$ è molto grande e $p$ molto piccolo. In altri termini, il totale dei successi in un gran numero $n$ di ripetizioni indipendenti di un esperimento che ha una piccola probabilità di riuscita $p$, è una variabile aleatoria con distribuzione approssimativamente di Poisson, con parametro $\lambda = n p$.


##### Riproducibilità
La distribuzione di Poisson è riproducibile, ovvero la somma di due poissoniane indipendenti è ancora una poissoniana. Si abbiano infatti due variabili aleatorie $X \sim P(\lambda_1)$ e $Y \sim P(\lambda_2)$, indipendenti tra loro, la loro somma è ancora una variabile aleatoria di Poisson: $X + Y \sim P(\lambda_1 + \lambda_2)$.



\hfill
### Modello ipergeometrico
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Modello ipergeometrico}
```
Il modello ipergeometrico descrive il numero di “successi” ottenuti estraendo senza reinserimento $n$ elementi da una popolazione finita di cardinalità $N+M$, dove

- $N$ è il numero di elementi del primo tipo (successi),
- $M$ è il numero di elementi del secondo tipo (insuccessi).

La variabile aleatoria $X$ che codifica questo esperimento si dice ipergeometrica con parametri $(N,M,n)$ e si scrive $X \sim H(N,M,n)$.

\vspace{2mm}
Definizione formale
: Sia $A$ l’insieme con $|A| = N+M$, contenente $N$ successi e $M$ insuccessi. Si estraggono senza reinserimento $n \le N+M$ elementi e si pone
    $$
    X = \text{numero di successi osservati},
    $$
    allora $X \sim H(N,M,n)$.

\vspace{2mm}
Si può pensare una variabile ipergeometrica come una somma di variabili bernoulliane. Si denotino con $Y_1, \dots, Y_n$ le etichette (successo o insuccesso) degli $n$ oggetti estratti, in ordine. Si definiscono gli indicatori
$$
X_i = I_{\{Y_i=\text{successo}\}}
     = \begin{cases}
         1 &\text{se il $i$-esimo estratto è un successo}\\
         0 &\text{altrimenti}
       \end{cases}
$$
dove ogni $X_i \sim B(p)$, e si pone
$$
X = \sum_{i=1}^{n} X_i.
$$
Poiché contiamo precisamente i successi nei $n$ estratti, otteniamo la stessa $X$ di sopra e
$$
X \sim H(N, M, n).
$$
Si osserva che le varie $X_i$ non sono indipendenti tra loro, il che differenzia il modello ipergeometrico da quello binomiale. Infatti, se si estrae un successo, il numero di successi rimanenti diminuisce e quindi anche la probabilità di estrarre un successo alla prova successiva.


\vspace{3mm}
#### Funzione di massa di probabilità e di ripartizione
Il dominio di supporto è $D_X=\{\,x\in\mathbb N\cup\{0\}\mid\max(0,n-M)\le x\le\min(n,N)\}$, infatti il numero di successi:

- non può essere maggiore né di quelli estratti $n$ né di quelli presenti $N$

- non può essere minore di $n-M$, in quanto se si estraggono $n$ elementi e $M$ sono insuccessi, gli altri $n-M$ devono essere successi. Nel caso in cui $M$ fosse maggiore di $n$, il numero di successi non può essere minore di 0.

La funzione di massa di probabilità è definita utilizzando la regola classica della probabilità:
\begin{align*}
p_X(i) &= \mathbb{P}(X=i)
       = \dfrac{\dbinom{N}{i}\,\dbinom{M}{n-i}}{\dbinom{N+M}{n}}\,
         I_{D_X}(i) \,\footnotemark
\end{align*}
\footnotetext{Per $i\notin D_X$ l’indicatrice azzera il termine, perciò non si calcola mai $\binom{a}{b}$ con $b<0$ o $b>a$, che sarebbe privo di significato.}
Infatti si effettuano le seguenti osservazioni:

- $p_X(i)$ rappresenta la probabilità di estrarre un sottoinsieme di $i$ oggetti da $N+M$ oggetti totali

- $\dbinom{N}{i}$ è il numero di modi in cui si possono scegliere $i$ successi da un insieme di $N$ successi

- $\dbinom{M}{n-i}$ è il numero di modi in cui si possono scegliere $n-i$ insuccessi da un insieme di $M$ insuccessi

- $\dbinom{N+M}{n}$ è il numero totale di modi di scegliere $n$ oggetti da un insieme di $N+M$ oggetti

\vspace{3mm}
La funzione di ripartizione di una variabile aleatoria ipergeometrica è definita come
$$
F_X(x) = \mathbb{P}(X \le \floor{x}) = \sum_{i=0}^{\floor{x}} p_X(i)
$$


#### Valore atteso
Per calcolare il valore atteso, si ricorda che una variabile aleatoria $X \sim H(N,M,n)$ può essere vista come la somma di $n$ variabili aleatorie di Bernoulli $X_i \sim B(p)$, dove queste non sono indipendenti tra loro:
$$
X = \sum_{i=1}^{n} X_i
$$
Il valore atteso di ciascun $X_i$ può essere calcolato tramite la regola classica delle probabilità, assumendo di non sapere nulla sulle estrazioni precedenti:
$$
\mathbb{E}[X_i] = \mathbb{P}(X_i=1) = \dfrac{N}{N+M} \; := p
$$
Sfruttando la linearità del valore atteso, si ottiene
$$
\mathbb{E}[X] = \mathbb{E}\left[ \; \sum_{i=1}^n X_i \right] = \sum_{i=1}^n \mathbb{E}[X_i] = \sum_{i=1}^n \dfrac{N}{N+M} = n \dfrac{N}{N+M} \; := n p
$$

#### Varianza
Per quanto riguarda la varianza, si adotta lo stesso approccio, calcolando prima la varianza di ciascun $X_i$:
$$
\text{Var}(X_i) = \mathbb{P}(X_i = 1)\, \mathbb{P}(X_i = 0) = \mathbb{E}[X_i] (1 - \mathbb{E}[X_i]) = \dfrac{N}{N+M} \dfrac{M}{N+M} = \dfrac{N M}{(N+M)^2}
$$
Essendo però le variabili $X_i$ dipendenti, non si può calcolare la varianza della somma come la somma delle varianze. Si deve quindi calcolare anche il termine di covarianza:
$$
\text{Var}(X) = \text{Var} \left( \,\sum_{i=1}^n X_i \right) = \sum_{i=1}^n \text{Var}(X_i) + \sum_{i=1}^n \sum_{\substack{j=1\\ j\neq i}}^n \mathrm{Cov}(X_i, X_j)
$$

La covarianza tra due variabili aleatorie $X_i$ e $X_j$ è definita come
$$
\mathrm{Cov}(X_i, X_j) = \mathbb{E}[X_i X_j] - \mathbb{E}[X_i] \mathbb{E}[X_j]
$$
Si noti che la variabile aleatoria $X_i X_j$ è ancora una bernoulliana:
$$
X_i X_j = \begin{cases}
  1 &\text{se } X_i = 1 \land X_j = 1\\
  0 &\text{altrimenti}
\end{cases}
$$
Di conseguenza si può calcolare il suo valore atteso come
$$
\mathbb{E}[X_i X_j] = \mathbb{P}(X_i = 1, X_j = 1) 
    \overset{(1)}{=} \mathbb{P}(X_i = 1 \mid X_j = 1)\, \mathbb{P}(X_j = 1)
    \overset{(2)}{=} \dfrac{N-1}{N+M-1} \, \dfrac{N}{N+M}
$$
\vspace{-6mm}
\begin{small}
  \qquad\text{(1): regola di fattorizzazione} \\
  \hspace*{2em}\text{(2): in $\mathbb{P}(X_i = 1 \mid X_j = 1)$ se $X_j = 1$, il numero di successi rimanenti è $N-1$ e il numero totale di oggetti rimanenti} \\
  \hspace*{3.7em} \text{è $N+M-1$. Applicando la regola classica della probabilità, si ottiene il risultato.}
\end{small}

\vspace{3mm}
Ora è possibile calcolare la covarianza:
\begin{align*}
\mathrm{Cov}(X_i, X_j) & = \dfrac{N-1}{N+M-1}\, \dfrac{N}{N+M} - \left(\dfrac{N}{N+M}\right)^2
    = \dfrac{N}{N+M} \left( \dfrac{N-1}{N+M-1} - \dfrac{N}{N+M} \right) \\[0.5em]
    & = \dfrac{N}{N+M} \, \dfrac{(N-1)(N+M) - N(N+M-1)}{(N+M-1)(N+M)}
    = \dfrac{N}{N+M} \, \dfrac{\cancel{N^2} + \cancel{NM} - \cancel{N} - M - \cancel{N^2} - \cancel{NM} + \cancel{N}}{(N+M-1)(N+M)} \\[0.5em]
    & = - \dfrac{N}{N+M} \, \dfrac{M}{(N+M-1)(N+M)} = - \dfrac{N M}{(N+M)^2(N+M-1)}
\end{align*}

Si osservi che la covarianza è negativa, in quanto se si estrae un successo, il numero di successi rimanenti diminuisce e quindi anche la probabilità di estrarre un successo alla prova successiva.

\vspace{3mm}
Ora si conoscono tutti i termini per calcolare la varianza:
\begin{align*}
\text{Var}(X) & = \sum_{i=1}^n \dfrac{N M}{(N+M)^2} - \sum_{i=1}^n \sum_{\substack{j=1\\ j\neq i}}^n \dfrac{N M}{(N+M)^2(N+M-1)}
    \overset{(1)}{=} \dfrac{n N M}{(N+M)^2} - \dfrac{n(n-1) N M}{(N+M)^2(N+M-1)} \\[0.5em]
    & = \dfrac{n N M}{(N+M)^2} \left( 1 - \dfrac{n-1}{N+M-1} \right) = n \dfrac{N}{N + M} \, \dfrac{M}{N+M} \, \left( 1 - \dfrac{n-1}{N+M-1} \right) \\[0.5em]
    & = n p\, (1-p) \left( 1 - \dfrac{n-1}{N+M-1} \right)
\end{align*}

\begin{small}
    \qquad\text{(1): la prima sommatoria svolge $n$ passi, mentre la seconda sommatoria svolge $n\,(n-1)$ passi, in quanto per} \\
    \hspace*{3.7em} \text{ogni $i$ ci sono $n-1$ scelte per $j$.}
\end{small}

\hfill
Si nota come nella varianza del modello ipergeometrico compaia quella del binomiale se si fissa $p$. Inoltre, se si fa tendere $N+M$ all'infinito, si ha che la varianza tende a $np\, (1-p)$, che è proprio la varianza del modello binomiale di parametri $(n,p)$. Intuitivamente, se si estrae un oggetto da una popolazione molto grande, il suo contributo alla probabilità di successo è trascurabile, e quindi la distribuzione ipergeometrica si avvicina a quella binomiale.



\newpage
## Modelli continui
Quando il fenomeno osservato può assumere valori in un intervallo non numerabile, si parla di distribuzioni continue. Ciascun modello continuo è descritto da una funzione di densità di probabilità che assegna a ogni intervallo di valori $[a,b]$ la probabilità che la variabile aleatoria assuma un valore in quell'intervallo.

### Modello uniforme continuo
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Modello uniforme continuo}
```
Questo modello si presenta quando l’esperimento casuale può restituire un qualsiasi valore reale nell’intervallo $[a,b]$, e ogni sottointervallo di uguale lunghezza ha la stessa probabilità di verificarsi. Una variabile aleatoria $X$ che codifica tale esperimento si dice uniforme continua su $[a,b]$ e si indica con $X \sim U(a,b)$.

Inoltre, questo stesso modello può essere ottenuto come il limite di un modello discreto, in cui si considerano i valori di $X$ come i punti di un intervallo continuo (e quindi con $n \to +\infty$).

Il dominio di supporto è $D_X = [a,b]$, e la funzione di densità di probabilità è definita come
$$
f_X(x) = \dfrac{1}{b-a} \, I_{[a,b]}(x)
$$

È facile verificare che la funzione di densità di probabilità sia corretta, in quanto
$$
\int_{-\infty}^{+\infty} f_X(x) \, dx = \dfrac{1}{b-a} \int_a^b dx = \dfrac{1}{b-a} (b-a) = 1
$$

La funzione di ripartizione è definita come
$$
F_X(x) = \int_{-\infty}^{x} f_X(t) \, dt = \int_{a}^{x} \dfrac{1}{b-a} \, dt = \dfrac{1}{b-a} \int_a^x dt \;=\; \dfrac{x-a}{b-a} \, I_{[a,b]}(x) + I_{(b,+\infty)}(x)
$$

Utilizzando il teorema fondamentale del calcolo integrale, è possibile calcolare la funzione di densità di probabilità a partire dalla funzione di ripartizione:
$$
F_X'(x) = \dfrac{d}{dx} \dfrac{x-a}{b-a} = \dfrac{1}{b-a} = f_X(x)
$$

```{=latex}
\vspace{2mm}
%------------------------------------------------
%  STILI USATI PIÙ VOLTE (pmfaxis, cdfaxis)
%------------------------------------------------
\pgfplotsset{
  pmfaxis/.style={
    width=7cm, height=5cm,
    axis lines=left, axis line style={-stealth},
    xmin=0.4, xmax=10,
    ymin=0,   ymax=2*\invn,
    tick style={black,thin}, clip=false
  },
  cdfaxis/.style={
    width=7cm, height=5cm,
    axis lines=left, axis line style={-stealth},
    xmin=0.4, xmax=10,
    ymin=0,   ymax=1,
    tick style={black,thin}, clip=false
  }
}

%------------------------------------------------
%  UNIFORME CONTINUA SU [a,b]
%------------------------------------------------
\def\a{4}                     % estremo sinistro dell'intervallo
\def\b{7}                     % estremo destro dell'intervallo
\def\c{4.75}
\def\d{6.25}
\pgfmathsetmacro{\den}{1/(\b-\a)}  % densità costante = 1/(b-a)

%------------------------------------------------
\begin{center}
\begin{tikzpicture}[>=stealth,line cap=round]

% ---------- PDF (analogo a “pmf”) ----------
\begin{axis}[pmfaxis,
  ylabel={$f_{X}(x)$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
  ytick={0,\den,0.8}, yticklabels={$0$,$\dfrac1{b-a}$,1},
  xtick={\a,\c,\d,\b},
  xticklabels={$a$,$c$,$d$,$b$},
  xmin=\a-1, xmax=\b+1,
  ymin=0, ymax=0.9,
  clip=false
]
  % linea di base x-axis
  \addplot[gray!30,very thick] coordinates {(\a-0.95,0) (\a,0)};
  \addplot[gray!30,very thick] coordinates {(\b,0) (\b+0.85,0)};

  % segmento verticale a x=a
  % \addplot[black,thin] coordinates {(\a,0) (\a,\den)};
  % segmento verticale a x=b
  % \addplot[black,thin] coordinates {(\b,0) (\b,\den)};

  % tratto tratteggiato obliquo tra c e d
  \addplot[
    pattern={Lines[angle=45,distance=3pt]},
    pattern color=gray!35,
    draw=none
  ] coordinates {(\c,0) (\c,\den) (\d,\den) (\d,0)};

  \addplot[black,thin] coordinates {(\c,0) (\c,\den)};
  \addplot[black,thin] coordinates {(\d,0) (\d,\den)};
  \addplot[black,thin] coordinates {(\c,0) (\d,0)};

  % tratto orizzontale costante f(x)=1/(b-a)
  \addplot[gray!30,very thick] coordinates {(\a,\den) (\b,\den)};

  % marcatori pieni (a,1/(b-a)) e (b,1/(b-a))
  \addplot[gray!30,only marks,mark=*] coordinates {(\a,\den) (\b,\den)};
  % marcatori vuoti alla base (a,0) e (b,0)
  \addplot[white,draw=gray!30,very thick,
           mark=*,mark options={scale=1.25,fill=white},
           only marks] coordinates {(\a,0) (\b,0)};
\end{axis}

% ---------- CDF ----------
\begin{axis}[cdfaxis,
  at={(current bounding box.east)}, anchor=west, xshift=1.6cm,
  ylabel={$F_{X}(x)$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
  ytick={0,0.5,1}, yticklabels={$0$,$\tfrac{1}{2}$,$1$},
  xtick={\a,(\a+\b)/2,\b},
  xticklabels={$a$,$\tfrac{a+b}{2}$,$b$},
  xmin=\a-1, xmax=\b+1,
  ymin=0, ymax=1.15,
  clip=false
]
  % tratto orizzontale a F(x)=0 fino a x=a
  \addplot[gray!30,very thick] coordinates {(\a-0.95,0) (\a,0)};
  % linea crescente da (a,0) a (b,1)
  \addplot[gray!30,very thick] coordinates {(\a,0) (\b,1)};
  % tratto orizzontale a F(x)=1 da x=b in poi
  \addplot[gray!30,very thick] coordinates {(\b,1) (\b+0.85,1)};

  % marcatori pieni / vuoti in corrispondenza degli angoli
  % a: F(a)=0 (marcatore vuoto)
  \addplot[white,draw=gray!30,very thick,
           mark=*,mark options={scale=1.25,fill=white},
           only marks] coordinates {(\a,0)};
  % b: F(b)=1 (marcatore pieno)
  \addplot[gray!30,only marks,mark=*] coordinates {(\b,1)};

  \addplot[black,very thin,dashed] coordinates {(\a-1.05,1) (\b,1)};
  \addplot[black,very thin,dashed] coordinates {(\b,0.05) (\b,1)};
  \addplot[black,very thin,dashed] coordinates {(\a-1.05,0.5) ((\a+\b)/2,0.5)};
  \addplot[black,very thin,dashed] coordinates {((\a+\b)/2,0.05) ((\a+\b)/2,0.5)};
\end{axis}

\end{tikzpicture}

\vspace{-2mm}
{\small
  Funzioni di densità e di ripartizione della variabile aleatoria \(X \sim U(a,b)\).
}
\end{center}
\vspace{2mm}
```

Il grafico della densità evidenzia il carattere uniforme della distribuzione su $[a,b]$: all'esterno di questo intervallo la funzione si annulla, mentre al suo interno rimane costante e uguale a $\frac{1}{b-a}$. La funzione di ripartizione, invece, cresce linearmente da 0 a 1 nell'intervallo $[a,b]$, e si mantiene costante al di fuori di questo intervallo.

\newpage
La probabilità che una variabile aleatoria $X \sim U(a,b)$ assuma un valore in un intervallo $[c,d]$ contenuto in $[a,b]$ è pari al rapporto tra le lunghezze dei due intervalli. Infatti, per $[c,d] \subseteq [a,b]$ si ha
$$
\mathbb{P}(c \le X \le d) = \int_c^d f_X(x) \, dx = \int_c^d \dfrac{1}{b-a} \, dx = \dfrac{1}{b-a} (d-c) = \dfrac{d-c}{b-a}
$$

\vspace{3mm}
Il valore atteso è dato da
\begin{align*}
\mathbb{E}[X] & = \int_{-\infty}^{+\infty} x f_X(x) \, dx = \int_a^b x\, \dfrac{1}{b-a} \, dx
    = \dfrac{1}{b-a} \int_a^b x \, dx = \dfrac{1}{b-a} \left[ \dfrac{x^2}{2} \right]_a^b \\[0.5em]
& = \dfrac{1}{b-a} \left( \dfrac{b^2}{2} - \dfrac{a^2}{2} \right) = \dfrac{b^2 - a^2}{2(b-a)} = \dfrac{(b-a)(b+a)}{2(b-a)} = \dfrac{b+a}{2}
\end{align*}

La varianza è data da
\begin{align*}
\mathbb{E}[X^2] & = \int_{-\infty}^{+\infty} x^2 f_X(x) \, dx = \int_a^b x^2\, \dfrac{1}{b-a} \, dx
    = \dfrac{1}{b-a} \int_a^b x^2 \, dx = \dfrac{1}{b-a} \left[ \dfrac{x^3}{3} \right]_a^b \\[0.5em]
& = \dfrac{1}{b-a} \left( \dfrac{b^3}{3} - \dfrac{a^3}{3} \right) = \dfrac{1}{b-a} \cdot \dfrac{b^3 - a^3}{3} = \dfrac{(b-a)(b^2 + ab + a^2)}{3(b-a)} = \dfrac{b^2 + ab + a^2}{3}
\end{align*}
\begin{align*}
\text{Var}(X) & = \mathbb{E}[X^2] - \mathbb{E}[X]^2 = \dfrac{b^2 + ab + a^2}{3} - \left( \dfrac{b+a}{2} \right)^2 \\[0.5em]
& = \dfrac{b^2 + ab + a^2}{3} - \dfrac{b^2 + 2ab + a^2}{4} = \dfrac{4b^2 + 4ab + 4a^2 - 3b^2 - 6ab - 3a^2}{12} \\[0.5em]
& = \dfrac{b^2 - 2ab + a^2}{12} = \dfrac{(b-a)^2}{12}
\end{align*}


\hfill
### Modello esponenziale
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Modello esponenziale}
```
Si consideri un fenomeno aleatorio in cui si osserva il tempo di attesa prima che si verifichi un certo evento casuale. Una variabile aleatoria $X$ che codifica il tempo trascorso fino al primo evento si dice esponenziale con parametro $\lambda > 0$ e si indica con $X \sim E(\lambda)$.

Per essere più precisi, si consideri un processo di Poisson omogeneo di intensità $\lambda$, per cui il numero di eventi che si verificano in un intervallo di tempo $[0,t]$ segue una distribuzione di Poisson con parametro $\lambda t$. La variabile aleatoria $X$ rappresenta il tempo di attesa tra due eventi successivi in questo processo.

Questo modello trova applicazioni in diversi contesti, come ad esempio il tempo che trascorre fino al verificarsi di un terremoto o di un guasto in un sistema, oppure per descrivere il tempo di vita di dispositivi elettronici o di una particella radioattiva prima che decada.


#### Funzione di densità e di ripartizione
Il dominio di supporto è $D_X = [0,+\infty)$, in quanto il tempo di attesa non può essere negativo. La funzione di densità di probabilità è definita come
$$
f_X(x) = \lambda e^{-\lambda x} \, I_{[0,+\infty)}(x)
$$

È facile verificare che la funzione di densità di probabilità sia corretta, in quanto
\begin{align*}
\int_{-\infty}^{+\infty} f_X(x) \, dx = \int_0^{+\infty} \lambda e^{-\lambda x} \, dx
    \overset{(1)}{=} \int_0^{+\infty} e^{-u} \, du
    = \left[ -e^{-u} \right]_0^{+\infty} = 0 - (-e^0) = 1
\end{align*}
\begin{small}
  \qquad\text{(1): ponendo} $u = \lambda x$, \text{quindi} $du = \lambda \, dx$.
\end{small}
\newpage
La funzione di ripartizione di una variabile aleatoria esponenziale è definita come
\begin{align*}
F_X(x) & = \int_{-\infty}^{x} f_X(t) \, dt = \int_0^{x} \lambda e^{-\lambda t} \, dt
    \overset{(1)}{=} \int_0^{\lambda x} e^{-u} \, du = \left[ -e^{-u} \right]_0^{\lambda x} \\[0.4em]
& = -e^{-\lambda x} - (-e^0) = \left( 1 - e^{-\lambda x} \right) \, I_{[0,+\infty)}(x)
\end{align*}
\vspace{-7mm}
\begin{small}
  \qquad\text{(1): ponendo} $u = \lambda t$, \text{quindi} $du = \lambda \, dt$.
\end{small}


\hfill
```{=latex}
%------------------------------------------------
%  STILI PER ESPONENZIALE
%------------------------------------------------
\pgfplotsset{
  pdfaxis/.style={
    width=7.3cm, height=5.1cm,
    axis lines=left, axis line style={-stealth},
    xmin=-0.015, xmax=3.2,
    ymin=-0.00, ymax=11.5,   % λ=10 ⇒ max ≈10
    tick style={black,thin}, clip=false,
    ytick={0,1,4,10},
    xtick={1,2,3},
  },
  cdfaxis/.style={
    width=7.3cm, height=5.1cm,
    axis lines=left, axis line style={-stealth},
    xmin=-0.015, xmax=3.7,
    ymin=-0.00, ymax=1.15,
    tick style={black,thin}, clip=false,
    ytick={0,1,4,10},
    xtick={1,2,3},
  }
}

\vspace{-2mm}
\begin{center}
\begin{tikzpicture}[>=stealth,line cap=round]

% ---------- PDF --------------------------------------------------
\begin{axis}[pdfaxis,
  ylabel={$f_{X}(x)$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
  legend style={
      at={(0.72,0.98)}, anchor=north west,
      draw=none, fill=none, font=\small
  },
  legend cell align=left
]

  % λ = 10  (nero)
  \addplot[very thick,black,domain=0:2.98,samples=180]
           {10*exp(-10*x)};
  \addlegendentry{$E(10)$}

  % λ = 4   (grigio medio)
  \addplot[very thick,gray!70,domain=0:2.98,samples=180]
           {4*exp(-4*x)};
  \addlegendentry{$E(4)$}

  % λ = 1   (grigio chiaro)
  \addplot[very thick,gray!20,domain=0:2.98,samples=180]
           {exp(-x)};
  \addlegendentry{$E(1)$}

\end{axis}

% ---------- CDF --------------------------------------------------
\begin{axis}[cdfaxis,
  at={(current bounding box.east)}, anchor=west, xshift=1.4cm,
  ylabel={$F_{X}(x)$},
  ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
  xlabel={$x$},
  xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt}
]

  % λ = 10  (nero)
  \addplot[very thick,black,domain=0:3.4,samples=180]
           {1 - exp(-10*x)};

  % λ = 4   (grigio medio)
  \addplot[very thick,gray!70,domain=0:3.4,samples=180]
           {1 - exp(-4*x)};

  % λ = 1   (grigio chiaro)
  \addplot[very thick,gray!20,domain=0:3.4,samples=180]
           {1 - exp(-x)};

\end{axis}

\end{tikzpicture}

\vspace{-2mm}
{\small
    Funzione di densità e di ripartizione di tre variabili aleatorie esponenziali
    \(X\sim E(\lambda)\).
}
\end{center}
\vspace{1.0mm}
```

Nei grafici si nota che la densità assume il valore massimo $f_X(0) = \lambda$ in $x=0$ e poi descresce esponenzialmente verso 0. Il parametro $\lambda$ governa la rapidità di questo declino: al crescere di $\lambda$ la densità decresce più rapidamente, concentrando la probabilità in prossimità di 0 e abbassando di conseguenza il valore atteso; valori di $\lambda$ più piccoli producono un decadimento più lento, estendendo la distribuzione verso destra e aumentando il valore atteso. Analogamente, la funzione di ripartizione cresce da 0 a 1 con andamento concavo: curve con $\lambda$ elevato salgono più rapidamente, mentre con $\lambda$ ridotto la crescita è più graduale.


\vspace{2mm}
#### Valore atteso e varianza

Il valore atteso è dato da
\begin{align*}
\mathbb{E}[X] & = \int_{-\infty}^{+\infty} x f_X(x) \, dx = \int_0^{+\infty} x\, \lambda e^{-\lambda x} \, dx
    \overset{(1)}{=} \left[ -x e^{-\lambda \,x} \right]_0^{+\infty} + \int_0^{+\infty} e^{-\lambda x} \, dx \\[0.5em]
    & = 0 - 0 + \dfrac{1}{\lambda}\, \int_0^{+\infty} \lambda\, e^{-\lambda x} \, dx \overset{(2)}{=} \dfrac{1}{\lambda}
\end{align*}
\begin{small}
  \qquad\text{(1): per integrazione per parti } $\displaystyle \int_a^b f(x) g'(x) \, dx = \left[ f(x) g(x) \right]_a^b - \int_a^b f'(x) g(x) \,dx$. \text{ Nel nostro caso si ha}\\[1mm]
  \hspace*{3.8em} $f(x) = x$, $g'(x) = \lambda e^{-\lambda x}$, quindi $g(x) = -e^{-\lambda x}$, $f'(x) = 1$.\\[2mm]
  \hspace*{1.8em} \text{(2): l'integrale corrisponde all'integrale della densità di probabilità, che vale 1.}
\end{small}

\vspace{2mm}
La varianza è data da
\begin{align*}
\mathbb{E}[X^2] & = \int_{-\infty}^{+\infty} x^2 f_X(x) \, dx = \int_0^{+\infty} x^2\, \lambda e^{-\lambda x} \, dx
    \overset{(1)}{=} \left[ -x^2 \, e^{-\lambda x} \right]_0^{+\infty} + \int_0^{+\infty} 2x \, e^{-\lambda x} \, dx \\[0.2em]
    & = 0 - 0 + \dfrac{2}{\lambda} \, \int_0^{+\infty} x\, \lambda e^{-\lambda x} \, dx \overset{(2)}{=} \dfrac{2}{\lambda} \, \dfrac{1}{\lambda} = \dfrac{2}{\lambda^2} \\[0.8em]
\text{Var}(X) & = \mathbb{E}[X^2] - \mathbb{E}[X]^2 = \dfrac{2}{\lambda^2} - \dfrac{1}{\lambda^2} = \dfrac{1}{\lambda^2}
\qquad \Rightarrow \quad \sigma_X = \dfrac{1}{\lambda}
\end{align*}
\vspace{-3.5mm}
\begin{small}
  \qquad\text{(1): per integrazione per parti. Nel nostro caso si ha $f(x) = x^2$, $g'(x) = \lambda e^{-\lambda x}$, quindi $g(x) = -e^{-\lambda x}$, $f'(x) = 2x$}.\\[1mm]
  \hspace*{1.8em} \text{(2): l'integrale è il valore atteso di $X$, che abbiamo già calcolato.}
\end{small}
\newpage
Si osservi che il valore atteso e la deviazione standard di una variabile aleatoria esponenziale sono entrambi inversamente proporzionali al parametro $\lambda$. Questo significa che al crescere di $\lambda$ il tempo di attesa medio diminuisce, e la variabilità del tempo di attesa si riduce, rendendo gli eventi meno incerti.


#### Proprietà
\vspace{-3mm}
##### Assenza di memoria 
La proprietà centrale della distribuzione esponenziale è l'assenza di memoria, ed è l'unica distribuzione continua con questa proprietà. Si consideri $X \sim E(\lambda)$ e si calcoli $\mathbb{P}(X > s + t \mid X > s)$ per qualsiasi $s, t \ge 0$, ovvero la probabilità condizionata di attendere ancora $t$ unità di tempo, dato che si è già atteso $s$ unità di tempo. Si ha
\begin{gather*}
\mathbb{P}(X > x) =  1 - \mathbb{P}(X \le x) = 1 - (1-e^{-\lambda x}) = e^{-\lambda x} \qquad \forall x \ge 0 \\[0.5em]
\mathbb{P}(X > s + t \mid X > s)  = \dfrac{\mathbb{P}(X > s+t, X > s)}{\mathbb{P}(X > s)} = \dfrac{\mathbb{P}(X > s+t)}{\mathbb{P}(X > s)} = \dfrac{e^{-\lambda(s+t)}}{e^{-\lambda s}} = e^{-\lambda t} = \mathbb{P}(X > t)
\end{gather*}

Si ottiene quindi che $\mathbb{P}(X > s + t \mid X > s) = \mathbb{P}(X > t)$, ossia la probabilità di attendere ancora $t$ unità di tempo, sapendo che ne sono già trascorse $s$, è la stessa di quella di attendere $t$ unità di tempo senza alcuna informazione. Questo implica che il processo non ha memoria del passato, e quindi la distribuzione esponenziale è detta priva di memoria.

\vspace{2mm}
##### Proposizione
Siano $X_1, \dots, X_n$ variabili aleatorie esponenziali e indipendenti di parametri $\lambda_1, \dots, \lambda_n$ rispettivamente. Allora la variabile aleatoria $Y = \min(X_1, \dots, X_n)$ è esponenziale con parametro $\displaystyle \lambda = \sum_{i=1}^n \lambda_i$.

Dimostrazione:

\qquad Bisogna dimostrare che $\mathbb{P}(Y \le x) = 1 - \exp\{-x \sum_{i=1}^n \lambda_i\}\,$[^6], ovvero che $\mathbb{P}(Y > x) = \exp\{-x \sum_{i=1}^n \lambda_i\}$.

[^6]: La notazione $\exp\left\{-x \sum_{i=1}^n \lambda_i\right\}$ è equivalente a $e^{-x \sum_{i=1}^n \lambda_i}$.

\hangindent=2em\qquad Siccome il minore di un insieme di numeri è più grande di $x$ se e solo se ciascuno dei numeri in questione è maggiore di $x$, si ha
\begin{align*}
\mathbb{P}(Y > x) & = \mathbb{P}(\min(X_1, \dots, X_n) > x) = \mathbb{P}(X_1 > x, \dots, X_n > x) \\[0.5em]
    & \overset{(1)}{=} \prod_{i=1}^n \mathbb{P}(X_i > x) = \prod_{i=1}^n (1 - F_{X_i}(x)) = \prod_{i=1}^n e^{-\lambda_i x} = e^{-\sum_{i=1}^n \lambda_i x}
\end{align*}
\begin{small}
  \vspace{-2mm}
  \qquad\qquad\text{(1): per indipendenza delle variabili aleatorie.}
\end{small}
\vspace{1mm}
Un sistema in serie è un dispositivo che richiede che tutti i suoi componenti funzionino correttamente per essere operativo. Si consideri un sistema di $n$ componenti in serie, tutti indipendenti e ciascuno con tempo di vita esponenziale, e si denotano con $\lambda_1, \dots, \lambda_n$ i rispettivi parametri. Il tempo di vita del sistema è dato dal minimo dei tempi di vita dei singoli componenti, ed è perciò esponenziale con parametro $\lambda = \sum_{i=1}^n \lambda_i$.

\vspace{3mm}
##### Proposizione
Sia $X \sim E(\lambda)$ una variabile aleatoria esponenziale e si consideri un valore $c > 0$. Allora la variabile aleatoria $Y = c X$ è esponenziale con parametro $\lambda' = \dfrac{\lambda}{c}$.

Dimostrazione:

\qquad Per dimostrarlo è necessario scrivere la funzione di ripartizione di $Y$ in funzione di quella di $X$:
\begin{align*}
F_Y(x) & = \mathbb{P}(Y \le x) = \mathbb{P}(c X \le x) = \mathbb{P}(X \le \frac{x}{c}) = F_X\left(\frac{x}{c}\right) 
 = 1 - e^{-\lambda \frac{x}{c}} = 1 - e^{-\frac{\lambda}{c} x}
\end{align*}


\newpage
### Modello normale
```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Modello normale}
```
Il modello normale è uno dei modelli più importanti in statistica e venne introdotto per approssimare le probabilità associate a variabili aleatorie binomiali quando il parametro $n$ è grande. Questo modello è poi incluso in un enunciato di teoria della probabilità noto come *teorema del limite centrale*. Quest'ultimo fornisce la giustificazione teorica di un fatto evidente dall'esperienza empirica, ovvero che molti fenomeni casuali seguono una legge approssimativamente normale.

#### Funzione di densità
Una variabile aleatoria $X$ si dice normale oppure gaussiana di parametri$\,$[^7] $\mu \in \mathbb{R}$ e $\sigma > 0$, e si indica con $X \sim N(\mu, \sigma)$, se la sua funzione di densità di probabilità è definita come$\,$[^8]
$$
f_X(x) = \dfrac{1}{\sigma \sqrt{2\pi}} \exp \left\{ -\frac{(x - \mu)^2}{2\sigma^2} \right\} \qquad \forall x \in \mathbb{R}
$$
Il supporto è $D_X = \mathbb{R}$. Il parametro $\mu$ definisce la centralità della distribuzione mentre $\sigma$ la dispersione.

[^8]: La notazione $\exp\{\dots\}$ indica l'esponenziale di base $e$ elevato all'argomento tra parentesi graffe, ovvero $\exp\{x\} = e^x$.

\vspace{3mm}
Si effettua ora lo studio della funzione di densità:

- Dominio: $\mathbb{R}$, codominio: $D_X = \mathbb{R}^{+}$.

- Limiti: $\displaystyle \lim_{x \to -\infty} f_X(x) = \lim_{x \to +\infty} f_X(x) = 0$.

- Asintoti: orizzontale in $y=0$.

- Simmetrie: la funzione è simmetrica rispetto a $x = \mu$, in quanto $f_X(\mu + x) = f_X(\mu - x)$. Questo vuol dire che la funzione è pari.

- Derivata prima: $\displaystyle f_X'(x) = \dfrac{1}{\sigma^3 \sqrt{2\pi}} \exp \left\{ - \dfrac{(x - \mu)^2}{2 \sigma^2} \right\} (\mu - x)$

- Monotonia: la funzione è crescente per $x < \mu$ e decrescente per $x > \mu$. Ha un massimo in $x = \mu$, dove assume valore $f_X(\mu) = \dfrac{1}{\sigma \sqrt{2\pi}} \approx 0.399/\sigma$.

- Derivata seconda: $\displaystyle f_X''(x) = \dfrac{1}{\sigma^3 \sqrt{2\pi}} \exp \left\{ - \dfrac{(x - \mu)^2}{2 \sigma^2} \right\} \left( \dfrac{(x - \mu)^2}{\sigma^2} - 1 \right)$

- Concavità: la funzione è convessa per $x < \mu - \sigma \,\land\, x > \mu + \sigma$, mentre è concava verso il basso per $\mu - \sigma < x < \mu + \sigma$. Ha i punti di flesso in $x = \mu \pm \sigma$.


[^7]: In queste dispense si utilizza la deviazione standard $\sigma$ come secondo parametro, mentre in altri testi si usa la varianza $\sigma^2$.

\hfill
La funzione di densità della distribuzione normale è valida in quanto assume valori maggiori di 0 e integra a 1:
$$
\int_{-\infty}^{+\infty} f_X(x) \, dx = \int_{-\infty}^{+\infty} \dfrac{1}{\sigma \sqrt{2\pi}} \exp \left\{ -\frac{(x - \mu)^2}{2\sigma^2} \right\} \, dx = 1
$$

\vspace{3mm}
Il valore atteso di una variabile aleatoria normale è dato dal suo parametro $\mu$:
$$
\mathbb{E}[X] = \mu
$$
La varianza è data dal suo parametro $\sigma$ elevato al quadrato:
$$
\text{Var}(X) = \sigma^2
\quad \Rightarrow \quad \sigma_X = \sigma
$$

\newpage
Un risultato molto importante riguardo questo tipo di variabili aleatorie è che se $X$ è normale e $Y$ è una trasformazione lineare di $X$, allora $Y$ è a sua volta normale. L'enunciato seguente precisa quanto detto.

##### Proposizione
Sia $X \sim N(\mu, \sigma)$, e sia $Y = aX + b$, dove $a, b \in \mathbb{R}$ e $a > 0$. Allora $Y$ è una variabile normale

\vspace{-1.5mm}
con media $a \mu + b$ e varianza $a^2 \sigma^2$.

\vspace{1mm}
Dimostrazione:

\qquad Si calcola la funzione di ripartizione di $Y$ in funzione di quella di $X$:
\begin{align*}
F_Y(x) &= \mathbb{P}(Y \le x) = \mathbb{P}(aX + b \le x) = \mathbb{P}\left( X \le \dfrac{x-b}{a} \right) = F_X\left(\dfrac{x-b}{a}\right)
\end{align*}
\qquad Si procede ora a calcolare la funzione di densità di $Y$:
\begin{align*}
f_Y(x) &= F_Y'(x) = \dfrac{d}{dx} F_X \left( \dfrac{x-b}{a} \right) = \dfrac{1}{a} \,f_X \left( \dfrac{x-b}{a} \right) = \dfrac{1}{a \sigma \sqrt{2\pi}} \, \exp \left\{ - \dfrac{\left( \frac{x-b}{a} - \mu \right)^2}{2\sigma^2} \right\} \\[0.5em]
&= \dfrac{1}{a \sigma \sqrt{2\pi}} \, \exp \left\{ - \dfrac{\left( \frac{x-b -\mu a}{a} \right)^2}{2\sigma^2} \right\}
  = \dfrac{1}{a \sigma \sqrt{2\pi}} \, \exp \left\{ - \dfrac{ [x - (a\mu + b)]^2 }{2 (a \sigma)^2} \right\}
\end{align*}

\hangindent=2em \qquad La variabile aleatoria $Y$ è quindi definita dalla funzione di densità sopra, che coincide con la forma convenzionale di una densità normale di parametri $a\mu+b$ e $a \sigma$. Dato che la funzione di densità identifica univocamente la distribuzione di una variabile aleatoria, si conclude che $Y \sim N(a\mu + b, a \sigma)$.

\hangindent=2em \qquad Il valore atteso di $Y$ è quindi $a\mu +b$ mentre la varianza è $(a\sigma)^2$. Questo risultato può essere ottenuto anche applicando la trasformazione direttamente al valore atteso e alla varianza di $X$:
$$
\mathbb{E}[Y] = \mathbb{E}[aX + b] = a\, \mathbb{E}[X] + b = a\mu + b \\[0.5em]
$$
\vspace{-6mm}
$$
\text{Var}(Y) = \text{Var}(aX + b) = a^2\, \text{Var}(X) = a^2 \sigma^2
\quad \Rightarrow \quad \sigma_Y = a \sigma \quad \text{(se } a > 0\text{)}
$$


\vspace{3mm}
#### Normale standard
Sia $X \sim N(\mu, \sigma)$, allora la variabile aleatoria ottenuta dalla standardizzazione di $X$
$$
Z = \dfrac{X - \mu}{\sigma}
$$
è una variabile normale $N(0,1)$ con 
$$
\mathbb{E}[Z] = 0, \quad \text{Var}(Z) = 1
$$

Una tale variabile aleatoria si dice *normale standard* e si indica con $Z \sim N(0, 1)$.

\vspace{3mm}
Dimostrazione:

\hangindent=2em \qquad La standardizzazione di una variabile aleatoria consiste nel sottrarre il suo valore atteso e dividere per la sua deviazione standard. Di conseguenza, si applica una trasformazione lineare a $X$ del tipo $aX + b$, con $a = 1 / \sigma$ e $b = - \mu / \sigma$. Si ha quindi
$$
Z = \dfrac{1}{\sigma} X - \dfrac{\mu}{\sigma}
$$

\qquad Applicando la proposizione precedente, si può concludere che $Z$ è normale con media 
$$
\qquad \mu_Z = \dfrac{1}{\sigma} \mu - \dfrac{\mu}{\sigma} = 0
$$ 
\qquad e deviazione standard
$$
\qquad \sigma^2_Z = \left( \dfrac{1}{\sigma} \right)^2 \sigma^2 = 1 \quad \Rightarrow \quad \sigma_Z = \sqrt{1} = 1
$$





\vspace{2mm}
\newpage
Sostituendo i due parametri della normale standard nella funzione di densità della normale, si ottiene
$$
\phi(x) = \dfrac{1}{\sqrt{2\pi}} e^{-x^2/2} \qquad \forall x \in \mathbb{R}
$$

Si osserva che la normale standard assume valore massimo $\phi(0) = 1/\sqrt{2\pi} = 0.399$ in $x=0$. I punti di flesso sono in corrispondenza di $x = \pm 1$, dove la funzione cambia concavità.

\vspace{3mm}
Integrando la densità, si ottiene la funzione di ripartizione della normale standard, indicata con $\Phi(x)$:
$$
\Phi(x) = \int_{-\infty}^{x} \phi(t) \, dt = \dfrac{1}{\sqrt{2\pi}} \int_{-\infty}^{x} e^{-t^2/2} \, dt \qquad \forall x \in \mathbb{R}
$$
La funzione di ripartizione della normale standard non ha una forma analitica.

\vspace{3mm}
#### Funzione di ripartizione
Il fatto che che $Z$ abbia distribuzione normale standard quando $X$ è una normale di valore atteso $\mu$ e varianza $\sigma^2$ permette di calcolare la funzione di ripartizione della normale in funzione di quella della normale standard:
$$
F_X(x) = \mathbb{P}(X \le x) = \mathbb{P}(\sigma Z + \mu) = \mathbb{P}(Z \le \dfrac{x - \mu}{\sigma}) = \Phi\left(\dfrac{x - \mu}{\sigma}\right)
$$

Derivando la funzione di ripartizione, si ottiene la funzione di densità della normale definita all'inizio:
\begin{align*}
f_X(x) &= F_X'(x) = \dfrac{d}{dx} \Phi\left(\dfrac{x - \mu}{\sigma}\right) = \Phi'\left(\dfrac{x - \mu}{\sigma}\right) \, \dfrac{d}{dx} \left(\dfrac{x - \mu}{\sigma} \right) = \phi\left(\dfrac{x - \mu}{\sigma}\right) \, \dfrac{1}{\sigma} \\[0.5em]
    &= \dfrac{1}{\sqrt{2\pi}} \, \exp\left\{ - \dfrac{(x - \mu)^2}{2 \sigma^2} \right\} \, \dfrac{1}{\sigma} = \dfrac{1}{\sigma \sqrt{2\pi}} \, \exp\left\{ - \dfrac{(x - \mu)^2}{2 \sigma^2} \right\}
\end{align*}

Si è quindi estesa la forma analitica di $\phi$ per una variabile normale con parametri $\mu$ e $\sigma$ arbitrari.


\vspace{3mm}
##### Proposizione
Ora che si conosce la funzione di ripartizione di una normale $X$ generica, si può calcolare la probabilità che $X$ assuma un valore compreso tra due estremi $a$ e $b$:
$$
\mathbb{P}(a < X < b) = F_X(b) - F_X(a) = \Phi\left(\dfrac{b - \mu}{\sigma}\right) - \Phi\left(\dfrac{a - \mu}{\sigma}\right)
$$

\vspace{1mm}
##### Proposizione
Sia $Z \sim N(0, 1)$, e si consideri $x > 0$. Allora $\Phi(-x) = 1 - \Phi(x)$.

Dimostrazione:

```{=latex}
\vspace{3mm}
\pgfplotsset{
  normpdf/.style={
    width=7cm,height=4cm,
    axis lines=left, axis line style={-stealth},
    xmin=-6, xmax=5, ymin=0, ymax=1.1,
    xtick={-6,-4,-2,0,2,4},
    tick style={black,thin}, clip=false
  },
  normcdf/.style={
    width=7cm,height=4cm,
    axis lines=left, axis line style={-stealth},
    xmin=-6, xmax=5, ymin=0, ymax=1.15,
    xtick={-6,-4,-2,0,2,4},
    tick style={black,thin}, clip=false
  }
}

\begin{minipage}{0.55\textwidth}
\vspace{-8mm}
\hangindent=2em \qquad Sfruttando la simmetria della distribuzione di $Z$ rispetto al valore atteso $\mu= 0$, si ottiene
\begin{align*}
\Phi(-x) & = \mathbb{P}(Z \le -x) = \mathbb{P}(Z \ge x) \\[0.5em]
 & = 1 - \mathbb{P}(Z < x) = 1 - \Phi(x)
\end{align*}
\end{minipage}
\begin{minipage}{0.39\textwidth}
    \begin{center}
    \begin{tikzpicture}[line cap=round]
      \begin{axis}[normpdf,
        axis lines=none,          % tolgo le linee di default
        xmin=-4.5, xmax=4.5,
        ymin=0,   ymax=0.45,
        clip=false
      ]
        % -------- parametri principali --------
        \def\sigma{1}  % deviazione standard
        \def\a{1.1}    % il tuo valore x (>0)

        % -------- curva N(0,1) ----------------
        \addplot[very thick,gray,domain=-4.5:4.5,samples=400,name path=PDF]
          {1/(sqrt(2*pi*\sigma^2))*exp(-(x^2)/(2*\sigma^2))};

        % -------- codice per riempire le code -----------------
        % segmento di asse (baseline) a sinistra
        \addplot[draw=none,name path=BASEleft]
          coordinates {(-4.5,0) (-\a,0)};
        % segmento di asse (baseline) a destra
        \addplot[draw=none,name path=BASEright]
          coordinates {(\a,0) (4.5,0)};

        % area ombreggiata sinistra
        \addplot[gray!20]
          fill between[
            of=PDF and BASEleft,
            soft clip={domain=-4.5:-\a}
          ];
        % area ombreggiata destra
        \addplot[gray!20]
          fill between[
            of=PDF and BASEright,
            soft clip={domain=\a:4.5}
          ];

        % -------- assi e tacche manuali ------------
        % asse x
        \draw[->,thin] (axis cs:-4.5,0) -- (axis cs:4.7,0);
        % asse y
        \draw[->,thin] (axis cs:0,0) -- (axis cs:0,0.5);

        % tacche -x, +x
        \draw[thin] (axis cs:-\a,0) -- (axis cs:-\a,-0.02);
        \draw[thin] (axis cs: \a,0) -- (axis cs: \a,-0.02);

        % linea verticale al centro
        \draw[very thin] (axis cs:0,0) -- (axis cs:0,{1/(sqrt(2*pi*\sigma^2))});

        % -------- etichette -----------------------
        % f_X al picco
        \node[above] at (axis cs:-0.5,{1/(sqrt(2*pi*\sigma^2))}) {$\phi$};

        % -x e +x
        \node[below] at (axis cs:-\a,-0.02) {$-x$};
        \node[below] at (axis cs:0,-0.02) {$0$};
        \node[below] at (axis cs:\a,-0.02) {$x$};

        % Φ(-x) in riquadro
        \node[draw,rounded corners=2pt,fill=white,inner sep=4pt]
              at (axis cs:-\a-1.3,0.09) {$\Phi(-x)$};
        \node[draw,rounded corners=2pt,fill=white,inner sep=4pt]
              at (axis cs:\a+1.3,0.09) {$\Phi(-x)$};
      \end{axis}
    \end{tikzpicture}
    \end{center}
\end{minipage}
```


\newpage
```{=latex}
\tikzset{
  declare function={
    normcdf(\x,\m,\s)=1/(1 + exp(-0.07056*((\x-\m)/\s)^3 - 1.5976*((\x-\m)/\s)));
  }
}
\pgfplotsset{
  normpdf/.style={
    width=7cm,height=5cm,
    axis lines=left, axis line style={-stealth},
    xmin=-6, xmax=5, ymin=0, ymax=1.1,
    xtick={-6,-4,-2,0,2,4},
    tick style={black,thin}, clip=false
  },
  normcdf/.style={
    width=7cm,height=5cm,
    axis lines=left, axis line style={-stealth},
    xmin=-6, xmax=5, ymin=0, ymax=1.15,
    xtick={-6,-4,-2,0,2,4},
    tick style={black,thin}, clip=false
  }
}

\begin{center}
\begin{tikzpicture}[>=stealth,line cap=round]
  % --------- DENSITÀ (PDF) ---------
  \begin{axis}[normpdf,
    ylabel={$f_X(x)$},
    ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
    xlabel={$x$},
    xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt},
    legend style={at={(0.035,0.98)},anchor=north west,draw=none,fill=none,font=\small},
    legend cell align=left
  ]
    % N(0,0.2) – nero
    \addplot[very thick,black,domain=-6:4,samples=200]
       {1/(sqrt(2*pi*0.2))*exp(-((x-0)^2)/(2*0.2))};
    \addlegendentry{$N(0,0.2)$}

    % N(0,1) – grigio medio
    \addplot[very thick,gray!70,domain=-6:4,samples=200]
       {1/(sqrt(2*pi*1))*exp(-((x-0)^2)/(2*1))};
    \addlegendentry{$N(0,1)$}

    % N(-2,4) – grigio chiaro
    \addplot[very thick,gray!20,domain=-6:4,samples=200]
       {1/(sqrt(2*pi*4))*exp(-((x+2)^2)/(2*4))};
    \addlegendentry{$N(-2,4)$}
  \end{axis}

  % --------- RIPARTIZIONE (CDF) ---------
  \begin{axis}[normcdf,
    at={(current bounding box.east)}, anchor=west, xshift=1.4cm,
    ylabel={$F_X(x)$},
    ylabel style={at={(axis description cs:-0.08,1)},anchor=south,rotate=-90},
    xlabel={$x$},
    xlabel style={at={(axis description cs:1,0)},anchor=north west,yshift=-2pt}
  ]
    % N(0,0.2) – nero
    \addplot[very thick,black,domain=-6:4,samples=200]
      {normcdf(x,0,sqrt(0.2))};
    % N(0,1) – grigio medio
    \addplot[very thick,gray!70,domain=-6:4,samples=200]
      {normcdf(x,0,1)};
    % N(-2,4) – grigio chiaro
    \addplot[very thick,gray!20,domain=-6:4,samples=200]
      {normcdf(x,-2,2)};
  \end{axis}
\end{tikzpicture}

\vspace{-2mm}
{\small
  Funzioni di densità e di ripartizione di tre variabili aleatorie $N(\mu, \sigma)$}
\end{center}
```
\vspace{2mm}
La densità della normale è una campana perfettamente simmetrica centrata sulla media: restringendo la deviazione standard il profilo si assottiglia e diventa più alto, mentre un valore più grande di $\sigma$ lo rende largo e più basso, lasciando invariata l’area totale sotto la curva che deve essere pari a 1.

La corrispondente funzione di ripartizione è una sigmoide che sale da 0 a 1; il punto di inflessione coincide con la media e la sua pendenza massima si fa tanto più ripida quanto più la distribuzione è concentrata. Cambiare la media sposta entrambe le curve lungo l’asse delle ascisse senza alterarne la forma intrinseca.

\vspace{4mm}
Regola normale
: La regola normale riassume quanto "peso" della distribuzione cade vicino alla media quando le osservazioni seguono una curva gaussiana. In una qualunque normale $N(\mu, \sigma)$:

    - il 68\% delle osservazioni cade entro un intervallo di $\mu \pm \sigma$

    - il 95\% delle osservazioni cade entro un intervallo di $\mu \pm 2\sigma$

    - il 99.7\% delle osservazioni cade entro un intervallo di $\mu \pm 3\sigma$

    Queste soglie non dipendono dalla posizione $\mu$ né dalla scala $\sigma$: descrivono soltanto come l'area si accumula sotto la campana descritta dalla funzione di densità.


\vspace{3mm}
#### Riproducibilità
Siano $X_1, \dots, X_n$ delle variabili aleatorie indipendenti tra loro e distribuite come $X_i \sim N(\mu_i, \sigma_i)$, allora
$$
S = \sum_{i=1}^n X_i \;\; \sim N\left(\;\sum_{i=1}^n \mu_i,\;\, \sqrt{\sum_{i=1}^n \sigma_i^2} \;\, \right)
$$


Siccome una variabile aleatoria binomiale non è altro che una somma di variabili di Bernoulli, allora per un numero $n$ abbastanza grande è possibile approssimare la suddetta variabile aleatoria a una normale di parametri $\mu = n p$ e $\sigma = \sqrt{n p (1-p)}$.












```{=latex}
\newpage
\part{Statistica inferenziale}
```

# Analisi della varianza

To do (lezione 08)


