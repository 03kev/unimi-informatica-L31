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
---

```{=latex}
\newcommand{\floor}[1]{\lfloor #1 \rfloor}
\newcommand{\ceil}[1]{\lceil #1 \lceil}
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
\newenvironment{myquote}{\begin{mdframed}[backgroundcolor=mygray, leftmargin=0.5cm, rightmargin=0.5cm, skipabove=\baselineskip, linewidth=0pt, innertopmargin=0.5cm, innerbottommargin=0.5cm, innerleftmargin=0.58cm, innerrightmargin=0.58cm]}{\end{mdframed}}
\renewenvironment{quote}{\begin{myquote}}{\end{myquote}}
```

```{=latex}
\vspace{2em}
\newpage
```

# Lezioni {-}

```{=latex}
\subsection*{L01 - 25/02/2025}
```

```{=latex}
\textbf{Dispense L01-Introduzione\shortunderscore a\shortunderscore python}
```

Introduzione a Python: panoramica sul linguaggio Python e le sue applicazioni.

Tipi di dati e operatori: 

- dati semplici e operatori:  numeri, stringhe e booleani; operazioni aritmetiche e logiche.
- dati strutturati:  liste, tuple, dizionari e insiemi; metodi e funzioni utili per manipolare le liste (e altri tipi strutturati).  

Operazioni sulle liste: creazione e manipolazione delle liste; uso di metodi e operatori specifici per le liste (*list comprehension*); esempi pratici e funzioni integrate.  
Import e utilizzo di librerie per specifiche funzionalità: `numpy` per operazioni numeriche; `pandas` per la gestione di dati strutturati; `matplotlib.pyplot` per la visualizzazione grafica; `csv` e `collections` per la manipolazione dei dati.



```{=latex}
\subsection*{L02 - 27/02/2025}
```

**Dispense L02-Pandas**

Introduzione alla libreria `Pandas` e ai dataset: caricamento del file `heroes.csv`.

- Serie: creazione e manipolazione di serie; gestione degli indici e accesso tramite slicing, `loc` e `iloc`; calcolo delle frequenze con `value_counts`; operazioni matematiche e uso del metodo `apply`.
- Visualizzazione grafica: creazione di grafici a barre per rappresentare le frequenze; personalizzazione dell’asse delle ascisse (utilizzo di `numpy.arange` e `xticks`).
- DataFrame: creazione di DataFrame da file CSV tramite `read_csv`; accesso a righe e colonne (utilizzo di `loc`, `iloc`, `at` e `iat`); ordinamento dei dati con `sort_values` e `sort_index`; filtraggio e selezione di sottoinsiemi di dati

Librerie utilizzate: `pandas`, `matplotlib.pyplot`, `numpy`, `csv`.



```{=latex}
\subsection*{L03 - 04/03/2025}
```

```{=latex}
\textbf{Dispense L03-Dati\shortunderscore e\shortunderscore frequenze - Capitolo 2 RS}
```

Dati e Frequenze: concetti di base; introduzione alla distinzione tra dati quantitativi e qualitativi.   
Classificazione dei dati: dati qualitativi (categorie e modalità); dati quantitativi (tipologie e suddivisione).  
Frequenze: calcolo e visualizzazione delle frequenze assolute e relative. Frequenze cumulate: definizione e applicazioni. Frequenze congiunte e marginali. Diagrammi:

- grafici a barre, istogrammi e diagrammi a torta.
- diagrammi di Pareto: ordinamento delle frequenze in ordine decrescente; identificazione della regola dell’80/20 per evidenziare le componenti più rilevanti.
- diagrammi stelo-foglia: rappresentazione della distribuzione dei dati quantitativi; visualizzazione della forma e concentrazione dei valori.

Suggerimenti e tecniche per la generazione dei grafici con l’uso di librerie come `matplotlib` e `pandas`.



```{=latex}
\subsection*{L04 - 06/03/2025}
```

```{=latex}
\textbf{Dispense L03-Dati\shortunderscore e\shortunderscore frequenze - Capitolo 3 RS}
```



```{=latex}
\subsection*{L05 - 11/03/2025}
```

```{=latex}
\textbf{Dispense L03-Dati\shortunderscore e\shortunderscore frequenze}: diagrammi a stelo \\
\textbf{Dispense L04-Indici\shortunderscore di\shortunderscore dispersione - Capitolo 3 RS}
```



```{=latex}
\subsection*{L06 - 13/03/2025}
```

```{=latex}
\textbf{Dispense L05-Indici\shortunderscore di\shortunderscore eterogeneita}
```

Indici di dipendenza. Indici di eterogeneità: indice di Gini, indice di entropia. Alberi di decisione e "machine learning" tramite questi indici.



```{=latex}
\subsection*{L07 - 18/03/2025}
```

```{=latex}
\textbf{Dispense L05-Indici\shortunderscore di\shortunderscore eterogeneita}: indici di concentrazione \\
\textbf{Dispense L06-Trasformazione\shortunderscore dei\shortunderscore dati}
```



```{=latex}
\subsection*{L08 - 25/04/2025}
```

```{=latex}
\textbf{Dispense L07-Analisi\shortunderscore della\shortunderscore varianza}: anova \\
\textbf{Dispense L08-Analisi\shortunderscore di\shortunderscore classificatori}: classificatori
```



```{=latex}
\subsection*{L09 - 27/04/2025}
```

```{=latex}
\textbf{Dispense L08-Calcolo\shortunderscore combinatorio}: calcolo combinatorio \\
Introduzione ai concetti basilari della probabilità.
```



```{=latex}
\subsection*{L10 - 01/04/2025}
```

Calcolo delle probabilità: assiomi e teoremi elementari. Spazi equiprobabili.



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

Se l'insieme di dati contiene un numero ridotto di valori distinti, lo si può rappresentrare con una *tabella delle frequenze*. Questa tabella associa a ciascun valore distinto osservato la sua frequenza assoluta. La somma di tutte le frequenze deve corrispondere al numero totale di osservazioni.  
Data una variabile statistica $X$ che può assumere vari valori, si elencano i valori distinti di $X$ in una colonna e, a fianco di ognuno, la relativa frequenza di occorrenza nel campione.

Per costruire una tabella delle frequenze relative da un insieme di dati, bisogna innanzitutto disporre i valori dei dati in ordine crescente. Si determinano i valori distinti e quante volte ciascuno di essi compaia. Si elencano questi valori distinti affiancati dalla loro frequenza $f$ e dalla loro frequenza relativa $f/n$, dove $n$ è il numero totale di osservazioni nell'insieme di dati.

### Grafici a bastoncini, a barre e poligonali

```{=latex}
\begin{minipage}[c]{0.3\textwidth}
    \centering
    \includegraphics[width=\linewidth]{diagramma-bastoncini.png}
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
    \includegraphics[width=\linewidth]{diagramma-barre.png}
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
 	\includegraphics[width=\linewidth]{diagramma-poligonale.png}
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
    Un modo efficiente di rappresentare un insieme di dati di dimensioni medie consiste nell'utilizzare il \textit{diagramma ramo-foglia} (o a stelo). Tale grafico si ottiene dividendo ciascun valore dei dati in due parti, chiamati appunto rami e foglie. \\ \\
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
: Un insieme di dati può consistere in coppie di valori che hanno una relazione di qualche tipo tra di loro. Ne viene che ogni elemento dell'insieme di dati sia costituito da un valore $x$ e da uno $y$.  Si indica con $(x_i, y_i), \; i=1 \cdots n\,$ la $i$-esima coppia.

Un metodo per rappresentare un insieme di dati di questo tipo consiste nel considerare ogni elemento della coppia separatamente, producendo istogrammi (o diagrammi ramo-foglia) separati per ciascuno. Così facendo però, nonostante i due grafici ci diano molte informazioni sulle singole variabili (attributi), non si ha nessun tipo di informazione riguardo al rapporto tra queste due variabili.

Per capirne la relazione è necessario considerare i valori accoppiati di ciascun dato simultaneamente. Si possono allora rappresentare questi dati accoppiati in un diagramma rettangolare e bidimensionale, in cui l'asse $x$ rappresenta il valore $x$ dei dati, e l'asse $y$ il valore $y$. Così facendo si ottiene un *diagramma di dispersione*.

Una delle ragioni per cui *questo* tipo di diagramma è utile consiste nella possibilità di fare previsioni sul valore $y$ di una futura osservazione, noto il valore $x$. Per stimare il valore $y$ a partire da $x$ si cerca, in modo intuitivo, di tracciare una "retta media" che approssimi l’andamento dei punti sul diagramma, ovvero una retta che passi "il più vicino possibile" a tutti i dati.

```{=latex}
\newpage
```

Il diagramma di dispersione, oltre a mostrare il comportamento relativo di due variabili e ad aiutarci nelle previsioni, è utile per riconoscere i *valori anomali* (outlier) che sono i punti che non sembrano seguire il comportamento degli altri. Una volta identificati questi valori, si può decidere quali di essi siano appropriati e quali siano invece causati da errori nella raccolta dei dati.



# Statistiche

Statistica
: Una statistica è una quantità numerica calcolata a partire da un insieme di dati.

## Centralità

Verranno presentate le statistiche che descrivono la tendenza centrale di un insieme di dati, ossia delle statistiche che descrivono il centro di un insieme di dati. Questa proprietà che si può individuare in un insieme di dati è detta **centralità** o posizione.

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
prende il nome di **media pesata** dei valori $x_1, x_2, \cdots, x_k$ dove $w_i$ è il peso di $x_i$.

Scrivendo l'equazione $(3.1)$ come
$$
\bar{x} = \dfrac{f_1}{n}x_1 + \dfrac{f_2}{n}x_2 + \cdots + \dfrac{f_k}{n}x_k\,
$$
possiamo vedere che la media campionaria $\bar{x}$ è la media pesata dell'insieme dei valori distinti. Il peso assegnato al valore $x_i$ è $f_i/n$, ossia rappresenta la frazione di volte in cui il valore $x_i$ comare nell'insieme dei dati.

#### Scarti

Si supponga che l'insieme di dati sia costituito dagli $n$ valori $x_1, \cdots, x_n$ e che $\bar{x} = \sum^n_{i=1} x_i / n$ sia la media campionaria. Le differenze tra ciascun valore dei dati e la media campionaria si chiamano **scarti**.
Il valore dell'$i$-esimo scarto è $x_i - \bar{x}$

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



### Varianza campionaria

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Varianza campionaria}
```

La varianza campionaria è una misura della media degli scarti quadratici rispetto alla media campionaria. Tuttavia, per ragioni tecniche questa "media" divide la somma di $n$ scarti quadratici per $n-1$, piuttosto che per l'usuale valore $n$.

```{=latex}
\newpage
```

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

Si consideri un insieme composto da dati accoppiati $(x_1,y_1),(x_2, y_2), \cdots, (x_n, y_n)$. Per vedere la relazione relativa di queste due variabili è possibile rappresentarle in un diagramma di dispersione. Questo approccio è però qualitativo, e quindi soggetto a interpretazione.  
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
    \includegraphics[width=\linewidth]{rel-diretta.png}
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
    \includegraphics[width=\linewidth]{rel-indiretta.png}
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

Per dimostrare le limitazioni inferiori e superiori si ricordi innanzitutto che, trattandosi di frequenze relative, $0 \le f_j \le 1 \;\; \forall j \in [1,m]$. Inoltre $\sum_{j=1}^m f_j = 1$. Di conseguenza si avrà:

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

$\displaystyle S_i = \sum_{k=1}^i a_k \qquad T_i = \sum_{k=i+1}^n a_k \qquad TOT = S_i + T_i = S_n$

Si cominci riscrivendo la disuguaglianza $Q_i \le F_i$ in termini di $S_i$ e $T_i$. In particolare, si osserva che

$\displaystyle Q_i = \dfrac{S_i}{TOT} \le \dfrac{i}{n} \;\; \Longleftrightarrow \;\; \dfrac{S_i}{S_i + T_i} \le \dfrac{i}{n}$

Da quest'ultima forma, si vuole isolare da un lato della disequazione $\tfrac{i\, T_i}{S_i}$:

$\dfrac{S_i}{S_i + T_i} \le \dfrac{i}{n} \;\; \Rightarrow \;\; \dfrac{1}{1+\tfrac{T_i}{S_i}} \le \dfrac{i}{n} \;\; \Rightarrow \;\; 1+\dfrac{T_i}{S_i} \ge \dfrac{n}{i} \;\; \Rightarrow \;\; i \roundp{\dfrac{T_i}{S_i}} \ge i \roundp{\dfrac{n}{i} - 1} \;\; \Rightarrow \;\; \dfrac{i\, T_i}{S_i} \ge n - i$

Si scompone ora il termine $\tfrac{i\, T_i}{S_i}$ come somma sugli elementi $a_k$ con $k > i$:

$\displaystyle \dfrac{i\, T_i}{S_i} = \dfrac{i}{S_i} \sum_{k=i+1}^n a_k = \sum_{k=i+1}^n \dfrac{i\, a_k}{S_i}$

Questa rielaborazione permette di sfruttare l'ordinamento $a_k \ge a_i \;\; \forall i < k$. Infatti, se $a_k \ge a_i$, allora:

$\dfrac{i\, a_k}{S_i} = \dfrac{\overbrace{a_k + a_k + \cdots + a_k\,\rule[0.8ex]{0pt}{1ex}}^{\raisebox{0.5ex}{\mbox{i volte}}}}{a_1 + a_2 + \cdots + a_k} \;\; \ge 1$

```{=latex}
\vspace{2mm}
```

Ne consegue che

$\displaystyle \dfrac{i\, T_i}{S_i} = \sum_{k=i+1}^n \dfrac{i\, a_k}{S_i} \ge \sum_{k=i+1}^n 1 = n - (i+1) + 1 = n - i$

In tal modo si conclude che $\tfrac{i\, T_i}{S_i} \ge n - i$, che equivale, tramite le equivalenze iniziali, a

$\dfrac{i\, T_i}{S_i} \ge n-i \;\; \Rightarrow \;\; \dfrac{S_i}{S_i + T_i} \le \dfrac{i}{n} \;\; \Rightarrow \;\; Q_i \le F_i$

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
    \includegraphics[width=\linewidth]{qq-plot.png}
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

Si consideri un insieme di valori distinti $V = \{v_1, v_2, \cdots, v_m\}$, ognuno con la propria frequenza relativa $f_1, f_2, \cdots, f_m$. Si consideri anche una funzione $f$ che trasformi i valori di $V$ in valori appartenenti all'insieme $V' = \{v_1', v_2', \cdots, v_m' \}$: si ha perciò che $\forall j \in [1,m] \;\; f(v_j) = v_j'$.

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

\vspace{-4mm}

##### Metodo delle rette

La funzione che trasforma i valori nell'intervallo $(a,b)$ all'interno dell'intervallo $(c,d)$ è una retta, la cui equazione si ricava tramite la formula della retta passante per due punti. Sia $(a,c) = (x_0, y_0)$ e $(b,d)= (x_1,y_1)$:

\vspace{-7mm}
$$
\dfrac{y-y_0}{y_1 - y_0} = \dfrac{x-x_0}{x_1 - x_0}  \;\;\Rightarrow\;\; \dfrac{x'-x'_0}{x_1'-x_0'} = \dfrac{x-x_0}{x_1 - x_0} \;\;\Rightarrow\;\; \dfrac{x'-c}{d-c}=\dfrac{x-a}{b-a} \;\;\Rightarrow\;\; f(x) = x' = c + \dfrac{d-c}{b-a} (x-a)
$$

\vspace{-5mm}

##### Metodo delle condizioni

Si consideri la funzione $f: [a,b] \rightarrow [c,d]$. In generale, una trasformazione lineare ha la forma $f(x) = mx + q$. Per determinare $m$ e $q$ si impongono le condizioni:

1. $f(a) =c$, ossia $ma + q = c$
2. $f(b) = d$, ossia $m b + q = d$

Sottraendo la prima dalla seconda si ottiene: 

\vspace{-1mm}

$m\, (b-a) = d-c \;\; \Rightarrow \;\; m = \dfrac{d-c}{b-a}$

\vspace{-1mm}

Sostituendo $m$ nella prima equazione:

$\dfrac{d-c}{b-a}\, a + q = c \;\; \Rightarrow \;\; q = c - \dfrac{d-c}{b-a}\, a$

Di conseguenza la funzione diventa:

$f(x) = \dfrac{d-c}{b-a}\, x + \left( c - \dfrac{d-c}{b-a}\, a\right) = c + \dfrac{d-c}{b-a}\, (x-a)$

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

To do (lezione 08)

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
\part{Teoria delle probabilità}
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

# Probabilità

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
: Un esperimento è un procedimento o una prova condotta in condizioni controllate, il cui risultato è incerto
\vspace{1mm}

Esito
: L'esito è un possibile risultato ottenuto da un esperimento. Si indica con $\omega$ e appartiene allo spazio degli esiti: $\omega \in \Omega$.
\vspace{1mm}

Spazio degli esiti
: Lo spazio degli esiti (o insieme universo o spazio campionario) è l'insieme dei possibili esiti dell'esperimento, e si indica con $\Omega$. L'universo può essere:

    - finito o infinito, a seconda del numero di esiti possibili
    - discreto se gli esiti sono isolati e contabili, o continuo se gli esiti formano un continuum. In questo contesto, la distinzione tra spazi discreti e continui riguarda la struttura complessiva di $\Omega$, e non le proprietà intrinseche degli elementi stessi.

\vspace{1mm}

### Evento

```{=latex}
\addcontentsline{toc}{subsection}{\protect\hspace*{2.3em}\numberline{\thesubsubsection}\hspace{0.9em}Evento}
```

Un evento $E$ è un sottoinsieme dello spazio degli esiti, perciò $E \subseteq \Omega$. Un evento formato da un solo esito $\{\omega\}$ è detto evento elementare. Per definizione, $\Omega$ rappresenta l'evento certo mentre $\varnothing$ è l'evento impossibile.

#### Operazioni

Dati due eventi $E, F \subseteq \Omega$, è possibile applicare le operazioni fondamentali degli insiemi:

- Unione $E \cup F$: è l'evento che si verifica quando si verifica almeno uno tra $E$ e $F$ si verifica.  
    Per un esito $x$ si ottiene che $\;x \in E \cup F \; \Leftrightarrow\; x \in E \lor x \in F$

- Intersezione $E \cap F$: è l'evento che si verifca quando si verificano entrambi gli eventi $E$ e $F$.  
    Per un esito $x$ si ottiene che $\;x \in E \cap F \; \Leftrightarrow\; x \in E \land x \in F$  
    Se $E \cap F = \varnothing$ allora $E$ e $F$ si dicono *mutualmente esclusivi* o eventi *disgiunti*.

- Complementare $E^C$ di $E$: è l'evento che si verifica quando non si verifica $E$ . Si indica anche con $\overline{E}$.  
    Per un esito $x$ si ottiene che $\;x \in E^C \; \Leftrightarrow\; x \not \in E$  
    Si osserva che $E^C = \Omega - E$. Vale anche la relazione $\Omega^C = \varnothing$.

- Differenza $E \smallsetminus F$: è l'evento che si verifica quando $E$ si verifica ma non $F$   
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

Un'algebra degli eventi $\mathcal{A}$ è una collezione di sottoinsiemi di $\Omega$, ossia $\mathcal{A}\subseteq \mathcal{P}(\Omega)$, tale che:

1. $\Omega \in \mathcal{A}:\;$ l'evento certo fa parte dell'algebra

2. $\forall E \in \mathcal{A} \; \Rightarrow\; \overline{E} \in \mathcal{A}:\;$ chiusura rispetto al complementare

3. $\forall E, F \in \mathcal{A} \;\Rightarrow \; E \cup F \in \mathcal{A}:\;$ chiusura rispetto all'unione finita

    - per $|\Omega| < \infty$ si ha che $\forall E_1, E_2, \dots, E_n \in \mathcal{A} \quad \bigcup^n_{{i=1}} E_i \in \mathcal{A}$

    - se la proprietà vale anche per $| \Omega | = \infty$ allora $\mathcal{A}$ si definisce $\sigma$-algebra. Ciò significa che l'algebra è chiusa rispetto a unioni numerabili:
        $$
        \forall E_i \in \mathcal{A} \;\;\; \forall i \in N \;\; \Rightarrow \;\; \bigcup_{i=1}^\infty E_i \in \mathcal{A}
        $$

Da queste proprietà discendono varie conseguenze, come ad esempio la chiusura rispetto all'intersezione finita (che si ottiene dalla chiusura rispetto al complementare e all'unione, grazie alle leggi di De Morgan), la chiusura rispetto alla differenza $E \smallsetminus F = E \cap \overline{F}$, e l'appartenenza di $\varnothing$ all'algebra.

Per spazi finiti, la più grande algebra che si possa considerare è l’intera collezione delle parti, $\mathcal{P}(\Omega)$, e questa è chiaramente un’algebra (e una $\sigma$-algebra) che include tutti i sottoinsiemi di $\Omega$.

Spazio misurabile
: La coppia $(\Omega, \mathcal{A})$ è detta *spazio misurabile*. In pratica, l'algebra $\mathcal{A}$ permette di associare a dei sottoinsiemi di $\Omega$ una misura, e lo spazio misurabile è l'insieme di tali sottospazi di misura assegnata.
[ *La scelta di una misura da associare a tali sottospazi produce uno spazio di misura, che in questo caso sarà lo spazio di probabilità. I morfismi degli spazi misurabili sono rappresentati dalle funzioni misurabili.* ]



https://it.wikipedia.org/wiki/Spazio_campionario

https://it.wikipedia.org/wiki/Spazio_misurabile






```{=latex}
\newpage
\part{Statistica inferenziale}
```

# Analisi della varianza

To do (lezione 08)

