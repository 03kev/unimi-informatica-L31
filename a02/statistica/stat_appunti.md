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

header-includes:
    - \usepackage{graphicx}
    - \usepackage{tikz}
    - \usepackage{tcolorbox}
    - \usetikzlibrary{positioning}
    - \usepackage{bm}
    - \usepackage{caption}

    - \usepackage{pgfplots}
    - \pgfplotsset{compat=1.17}
    - \usepgfplotslibrary{statistics}
    - \usepgfplotslibrary{groupplots}

    - \newcommand{\shortunderscore}{\kern0.1em\raisebox{-0.2ex}{\rule[0pt]{0.5em}{0.7pt}}\kern0.1em}

    - \usepackage{mdframed}
    - \usepackage{xcolor}
    - \definecolor{mygray}{HTML}{F7F7F7}
    - \newenvironment{myquote}{\begin{mdframed}[backgroundcolor=mygray, leftmargin=0.5cm, rightmargin=0.5cm, skipabove=\baselineskip, linewidth=0pt, innertopmargin=0.5cm, innerbottommargin=0.5cm, innerleftmargin=0.58cm, innerrightmargin=0.58cm]}{\end{mdframed}}
    - \renewenvironment{quote}{\begin{myquote}}{\end{myquote}}

    - |
        \let\originAlParaGraph\paragraph
        \renewcommand{\paragraph}[1]{\originAlParaGraph{#1} \hfill}
---

```{=latex}
\vspace{2em}
\newpage
```

# Lezioni {-}

## L01 - 25/02/2025 {-}

```{=latex}
\textbf{Dispense L01-Introduzione\shortunderscore a\shortunderscore python}
```

Introduzione a Python: panoramica sul linguaggio Python e le sue applicazioni.

Tipi di dati e operatori: 

- dati semplici e operatori:  numeri, stringhe e booleani; operazioni aritmetiche e logiche.
- dati strutturati:  liste, tuple, dizionari e insiemi; metodi e funzioni utili per manipolare le liste (e altri tipi strutturati).  

Operazioni sulle liste: creazione e manipolazione delle liste; uso di metodi e operatori specifici per le liste (*list comprehension*); esempi pratici e funzioni integrate.  
Import e utilizzo di librerie per specifiche funzionalità: `numpy` per operazioni numeriche; `pandas` per la gestione di dati strutturati; `matplotlib.pyplot` per la visualizzazione grafica; `csv` e `collections` per la manipolazione dei dati.

## L02 - 27/02/2025 {-}

**Dispense L02-Pandas**

Introduzione alla libreria `Pandas` e ai dataset: caricamento del file `heroes.csv`.

- Serie: creazione e manipolazione di serie; gestione degli indici e accesso tramite slicing, `loc` e `iloc`; calcolo delle frequenze con `value_counts`; operazioni matematiche e uso del metodo `apply`.
- Visualizzazione grafica: creazione di grafici a barre per rappresentare le frequenze; personalizzazione dell’asse delle ascisse (utilizzo di `numpy.arange` e `xticks`).
- DataFrame: creazione di DataFrame da file CSV tramite `read_csv`; accesso a righe e colonne (utilizzo di `loc`, `iloc`, `at` e `iat`); ordinamento dei dati con `sort_values` e `sort_index`; filtraggio e selezione di sottoinsiemi di dati

Librerie utilizzate: `pandas`, `matplotlib.pyplot`, `numpy`, `csv`.

## L03 - 04/03/2025 {-}

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

## L04 - 06/03/2025 {-}

```{=latex}
\textbf{Dispense L03-Dati\shortunderscore e\shortunderscore frequenze - Capitolo 3 RS}
```

## L05 - 11/03/2025 {-}

```{=latex}
\textbf{Dispense L03-Dati\shortunderscore e\shortunderscore frequenze - Capitolo 3 RS}
```



```{=latex}
\newpage
```

# Introduzione alla statistica

## Definizione

Statistica
: La statistica è l'arte di apprendere dei dati. Si occupa della raccolta, della descrizione e dell'analisi dei dati, possibilmente permettendo di trarne delle conclusioni.

A volte un’analisi statistica comincia con un insieme di dati prestabilito, in questo caso la statistica si usa per descrivere, riassumere e analizzare i dati. In altre situazioni i dati non sono ancora disponibili e si può usare la statistica per progettare un esperimento che li generi. Se ne occupa la statistica descrittiva.

Statistica descrittiva
: La statistica descrittiva è la parte della statistica che descrive e riassume i dati.

Una volta che i dati sono stati raccolti e descritti, si vogliono trarre delle conclusioni. Se ne occupa la statistica inferenziale.

Statistica inferenziale
: La statistica inferenziale è la parte della statistica che trae conclusioni sui dati.

La statistica inferenziale si basa sul modello probabilistico che consiste nel fare un insieme di assunzioni sulle probabilità di ottenere un certo valore. La statistica inferenziale, quindi, richiede la conoscenza della teoria della probabilità. L’inferenza statistica si basa sull’assunzione che importanti aspetti del fenomeno in analisi si possano rappresentare in termini di probabilità e giugne a conclusioni usando i dati per fare inferenza su queste probabilità.

## Popolazioni e campioni

Nella statistica è cruciale ottenere delle informazioni su tutto un insieme di elementi, che viene definito popolazione. Spesso la popolazione però è troppo numerosa per poter analizzare ciascuno dei suoi membri: in questo caso si sceglie e si esamina un suo sottoinsieme, che viene definito campione.

Popolazione
: Si definisce popolazione l'insieme di tutti gli elementi di interesse.

Campione
: Si definisce campione un sottoinsieme della popolazione, utile quando questa è troppo numerosa.

Affinché il campione ci dia informazioni su tutta la popolazione, questi deve essere rappresentativo di tutta la popolazione. Con rappresentativo si intende che il campione deve essere scelto in modo che tutte le parti della popolazione abbiano uguale probabilità di fare parte del campione. *Il campione deve quindi riflettere la variabilità reale della popolazione.*

Campione casuale
: Un campione di $k$ membri di una popolazione si dice **campione casuale**, o talvolta campione casuale semplice, se i membri sono scelti in modo che tutte le possibili scelte dei $k$ membri siano ugualmente probabili.

Una volta che si sceglie un campione casuale, è possibile usare l'inferenza statistica per giungere a conclusioni sull'intera popolazione studiando gli elementi del campione.

### Campionamento casuale stratificato

Un metodo più sofisticato del campionamento casuale semplice è il campionamento casuale stratificato. Inizialmente si stratifica la popolazione in sottopopolazioni, ognuno dei quali contiene unità simili secondo determinati criteri. In seguito, da ogni strato si estrae un casualmente un numero di unità proporzionale alla sua consistenza nella popolazione totale. In questo modo, le proporzioni di ciascuno strato presenti nel campione rispecchiano esattamente quelle dell’intera popolazione.

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

Quando i dati sono numerici o comunque ordinabili, un concetto affine alle frequenze relative cumulate è quello della *funzione cumulativa empirica*, nota anche come funzione di ripartizione empirica. Data una serie di osservazioni ${ x_1, \dots, x_n }$, la funzione cumulativa empirica $\hat F: \mathbb R \to [0, 1]$ è definita in modo che per ogni $x \in \mathbb R$ essa assuma il valore pari alla frequenza relativa delle osservazioni minori o uguali a $x$. In altre parole:

$$
\hat F(x) = \frac{\# \{ x_i \leq x \}}{n}
= \frac{1}{n} \sum_{i=1}^n \mathrm I_{(-\infty, x]}(x_i)
$$
dove $\mathrm I_A: \mathbb R \to {0, 1}$ è la funzione indicatrice dell’insieme $A$, che restituisce $1$ se l’argomento appartiene ad $A$ e $0$ altrimenti: di conseguenza l’intervallo $(-\infty, x]$ include tutti i valori minori o uguali a $x$. Pertanto, per ogni $x$, $\hat F(x)$ rappresenta la frequenza relativa cumulata del massimo valore osservato che non supera $x$, e il grafico di questa funzione sarà a tratti costanti.
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

Se l'insieme di dati contiene un numero ridotto di valori distinti, si può rappresentrare con una *tabella delle frequenze*. Questa tabella associa a ciascun valore distinto osservato la sua frequenza assoluta. La somma di tutte le frequenze deve corrispondere al numero totale di osservazioni.  
Data una variabile statistica $X$ che può assumere vari valori, si elencano i valori distinti di $X$ in una colonna e, a fianco di ognuno, la relativa frequenza di occorrenza nel campione.

Per costruire una tabella delle frequenze relative da un insieme di dati, bisogna innanzitutto disporre i valori dei dati in ordine crescente. Si determinano i valori distinti e quante volte ciascuno di essi compaia. Si elencano questi valori distinti affiacati dalla loro frequenza $f$ e dalla loro frequenza relativa $f/n$, dove $n$ è il numero totale di osservazioni nell'insieme di dati.

### Grafici a bastoncini, a barre e poligonali

```{=latex}
\begin{minipage}[c]{0.3\textwidth}
    \centering
    \includegraphics[width=\linewidth]{\detokenize{./stat_appunti_img/diagramma-bastoncini.png}}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.65\textwidth}
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
    \includegraphics[width=\linewidth]{\detokenize{./stat_appunti_img/diagramma-barre.png}}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.65\textwidth}
    \vspace{-2mm}
    Un secondo tipo di rappresentazione, molto simile concettualmente, 
    è il \textit{grafico a barre}: anche in questo caso i valori si trovano 
    sull’asse orizzontale e le frequenze su quello verticale, ma invece dei 
    singoli segmenti si utilizzano barre di un certo spessore. Ciò permette di 
    mettere in evidenza ciascuna categoria o classe di dati e risulta particolarmente 
    efficace quando si vogliono confrontare categorie di grandezza diversa.
\end{minipage}

\begin{minipage}[c]{0.30\textwidth}
	\centering
 	\includegraphics[width=\linewidth]{\detokenize{./stat_appunti_img/diagramma-poligonale.png}}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.65\textwidth}
 	\vspace{-6mm}
    Infine, esiste il \textit{grafico poligonale}, in cui i valori (sempre disposti
    sull’asse orizzontale) vengono rappresentati da punti, collocati a un’altezza
    proporzionale alla loro frequenza, che vengono poi congiunti da segmenti. In questo modo
    si ottiene una linea spezzata che rende immediata la visualizzazione delle variazioni di
    frequenza da un valore all’altro, permettendo di apprezzare più facilmente tendenze o
    andamenti complessivi.
\end{minipage}
```

### Diagramma a torta

Se i dati non sono numerici si utilizza un diagramma a torta. Si costruisce usando un cerchio suddiviso in settori, uno per ogni valore distinto dei dati. Dato un valore con frequenza relativa $f/n$, allora l’area del settore corrisponde all'area del cerchio moltiplicata per $f/n$, ovvero un arco con un angolo di $360 \cdot(f /n)$ gradi.

### Diagramma ramo-foglia

```{=latex}
\hfill

\begin{minipage}[c]{0.35\textwidth}
    \centering
    \begin{tabular}{r|l}
        22 & 372 \\
        23 & 512, 688, 941 \\
        24 & 706 \\
        25 & 020, 057, 128, 400, 446, 575\\
        26 & 183, 894, 982 \\
        27 & 671, 711, 744 \\
        28 & 345, 764, 913, 967 \\
    \end{tabular}
    \captionof{table}{Diagramma a stelo}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.6\textwidth}
    \vspace{-2mm}
    Un modo efficiente di rappresentare un insieme di dati di dimensioni medie consiste nell'utizzare il \textit{diagramma ramo-foglia} (o a stelo). Tale grafico si ottiene dividendo ciascun valore dei dati in due parti, chiamati appunto rami e foglie. \\ \\
    La scelta dei rami dovrebbe essere fatta in modo che il \mbox{diagramma} ramo-foglia che ne risulta sia informativo sui dati. Questi diagrammi sono particolarmente adatti a descrivere insiemi di dati dimensioni ridotte.
\end{minipage}

\hfill
```

Fisicamente, questo grafico ha l'aspetto di un istogramma ruotato su un lato, con il vantaggio di contenere tutti i valori dei dati originali in ogni classe. Quando il grafico presentra troppe foglie per ogni riga, si può raddoppiare il numero di rami utilizzando due righe per ogni valore del ramo.

### Diagrammi di Pareto

I diagrammi di Pareto sono grafici a barre ordinati in ordine decrescente di frequenza, ai quali è spesso affiancata una linea che rappresenta la frequenza cumulata. In questo modo, oltre a mostrare il numero di casi per ciascuna categoria, permettono di evidenziare quali categorie contribuiscono maggiormente al totale, facilitando l’individuazione delle cause o delle categorie più rilevanti.

### Istogrammi e raggruppamento dei dati

Utilizzare i grafici presentati precedentemente è un metodo efficace per descrivere un insieme di dati. Tuttavia alcuni di questi insiemi hanno troppi valori distinti per poter usare questo metodo. 

Quello che bisogna fare in questi casi è suddividere i valori in gruppi, o classi, e poi si rappresenta con un grafico il numero di valori deti dati che cadono in ciascuna classe. Il numero di classi scelte è un compromesso tra:

1. scegliere poche classi al costo di perdere molte informazioni sui valori effettivi in una classe
2. scegliere troppe classi, ottendendo frequenze troppo basse all'interno di ciascuna di esse

I valori al bordo di una classe si chiamano *estremi* della classe. Si adotta la convenzione di inclusione a sinistra, che richiede che una classe includa il suo estremo sinistro ma non quello destro.

Una volta suddivisi i dati in classi, si costruisce la tabella delle frequenze (e delle frequenze relative), e da questa si ottiene l’istogramma, un grafico a barre adiacenti che mostra la distribuzione dei dati in ciascuna classe. L’istogramma offre una visione immediata di come i valori si distribuiscono: per esempio, se sono concentrati in un certo intervallo, se ci sono "vuoti" senza osservazioni o se alcuni valori si distaccano notevolmente dagli altri. Pur non contenendo tutte le informazioni dell’insieme di dati originale, la tabella delle frequenze di classe e l’istogramma illustrano le caratteristiche fondamentali della distribuzione, come la simmetria, la dispersione e i possibili estremi isolati.

### Diagramma di dispersione e insieme di dati a coppie

Un insieme di dati può consistere in coppie di valori che hanno una relazione di qualche tipo tra di loro. Ne viene che ogni elemento dell'insieme di dati sia costituito da un valore $x$ e da uno $y$.  Si indica con $(x_i, y_i), \; i=1 \cdots n\,$ la $i$-esima coppia.

Un metodo per rappresentare un insieme di dati di questo tipo consiste nel considerare ogni elemento della coppia separatamente, producendo istogrammi (o diagrammi ramo-foglia) separati per ciascuno. Così facendo però, nonostante i due grafici ci diano molte informazioni sulle singole variabili (attributi), non si ha nessun tipo di informazione riguardo al rapporto tra queste due variabili.

Per capirne la relazione è necessario considerare i valori accoppiati di ciascun dato simultaneamente. Si possono allora rappresentare questi dati accoppiati in un diagramma rettangolare e bidimensionale, in cui l'asse $x$ rappresenta il valore $x$ dei dati, e l'asse $y$ il valore $y$. Così facendo si ottiene un *diagramma di dispersione*.

Una delle ragioni per cui questo tipo di diagramma è utile consiste nella possibilità di fare previsioni sul valore $y$ di una futura osservazione, noto il valore $x$. Per stimare il valore $y$ a partire da $x$ si cerca, in modo intuitivo, di tracciare una "retta media" che approssimi l’andamento dei punti sul diagramma, ovvero una retta che passi "il più vicino possibile" a tutti i dati. 

- In pratica, si ricorre a metodi di regressione lineare, come il *metodo dei minimi quadrati*, che permette di trovare l’equazione della retta (del tipo $y = a + bx$) minimizzando la somma delle distanze (al quadrato) tra i valori osservati $(x_i, y_i)$ e i valori $\hat{y}_i$ previsti dalla retta. Una volta trovata questa retta di "miglior adattamento", per un qualunque valore $x$ che possa presentarsi in futuro, si ottiene la stima di $y$ semplicemente sostituendo $x$ nell’equazione $y = a + bx$.

Il diagramma di dispersione, oltre a mostrare il comportamento relativo di due variabili e ad aiutarci nelle previsoni, è utile per riconoscere i *valori anomali* (outlier) che sono i punti che non sembrano seguire il comportamento degli altri. Una volta identificati questi valori, si può decidere quali di essi siano appropriati e quali siano invece causati da errori nella racolta dei dati.



****

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

Dimostrazione: $\quad \displaystyle\bar{y} = \dfrac{1}{n} \sum_{i=1}^n y_i = \dfrac{1}{n} \sum_{i=1}^n (x_i + h) =
	\underbrace{\dfrac{1}{n} \sum_{i=1}^nx_i}_{\large \bar{x}} ~+~ \underbrace{\dfrac{1}{n} \sum_{i=1}^n h}_{\large \tfrac{1}{n} \cdot\, nh} = \bar{x} + h$

**Scalatura**
Se invece ciascun calore dei dati viene moltiplicato per $a$, lo è anche la media campionaria:
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

Per verificarlo, si supponga di disporre di una tabella delle frequenze che elenca $k$ valori distinti $x_1, x_2, \cdots, x_k$ con le rispettive frequenze $f_1, f_2, \cdots f_k$. Ne segue che questo insieme di dati è costituito da $n$ osservazioni, dove $n = \sum^k_{i=1} f_i$ e dove il valore $x_i$ comprare $f_i$ volte per $i=1,2,\cdots,k$. La media campionaria per questo insieme di dati è:
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

$\mathbf{100p}$-esimo percentile campionario

: È un valore maggiore o uguale di almeno $100p$ percento dei valori dati, e minore o uguale di almeno $100(1-p)$ percento dei valori dati. Se due valori dei dati soddisfano questa condizione, allora il $100p$-esimo percentile campionario è la media aritmetica di essi.

La mediana campionaria è il $50$-esimo percentile, ossia è il percentile campionario $100p$ quando $p=0.5$

Supponiamo che i dati di un campione di cardinalità $n$ siano disposti in ordine crescente. Per determinare il  
$100p$-esimo percentile campionario bisogna determinare quale valore sia:

- maggiore o uguale di almeno $np$ valori dei dati
- minore o uguale di almeno $n(p-1)$ valori dei dati

Se $np$ non è un intero, il solo valore dei dati che soddisfa questi requisiti è quello la cui posizione è il più piccolo intero maggiore di $np$.  
Se invece $np$ è un intero, allora sia il valore in posizione $np$ che il valore in posizione $np+1$ soddisfano i due requisti, e quindi il $100p$-esimo percentile campionario è la media dei due valori.

> **Calcolo del 100$\bm{p}$-esimo percentile campionario di un insieme di dati di $\bm{n}$ elementi:**
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

Questi valori si vedono facilmente in una tabella delle frequenza; sono infatti i valori con la frequenza più alta.



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

Lo squarto interquartile è un indice di dispersione che deriva dalla mediana campionaria, e rappresenta la lunghezza dell'intervallo in cui si trova la metà centrale dei dati. Richiamando i quartili, possiamo dire che si tratta della lunghezza dell'intervallo compreso tra il primo quartile $Q1$ e il terzo quartile $Q3$.

Un $\text{IQR}$ piccolo indica che la metà centrale dei dati è relativamente concentrato attorno alla mediana, mentre un $\text{IQR}$ ampio suggerisce una maggiore dispersione nella parte centrale della distribuzione.

Come la mediana campionaria, l'$\text{IQR}$ è un indice robusto perché non è influenzato da valori fuori scala. Questo lo rende particolarmente utile quando la distribuzione dei dati è asimmetrica o contiene anomalie.

Questo indice è fondamentale per la costruzione dei boxplot perché viene proprio utilizzato per definire quali valori siano fuori scala e quali no. Generalmente, i valori inferiori a $Q1 - 1.5 \cdot \text{IQR}$ o superiori a $Q3 + 1.5 \cdot \text{IQR}$ sono considerati outlier.



## Altri grafici

### Box Plot

Per visualizzare alcune statistiche riassuntive di un insieme di dati si una un *box plot* (diagramma a scatola). Per realizzarlo tracciamo un segmento orizzontale dal minore al maggiore dei dati. Al segmento sovrapponiamo un rettangolo che si estende dal primo al terzo quartile. Il rettangolo è diviso in due parti da un segmento verticale in corrispondenza della mediana campionaria.

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
    mark options={draw=black},
  ] coordinates {(8.5,1) (9.6,1)};

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
    \includegraphics[width=\linewidth]{\detokenize{./stat_appunti_img/qq-plot.png}}
\end{minipage}
\hspace{2mm}
\begin{minipage}[c]{0.65\textwidth}
    \vspace{-7mm}
Un diagramma Q-Q (o diagramma quantile-quantile) è una rappresentazione grafica qualitativa che permette di verificare le similarità tra le distribuzioni di due campioni diversi (utile per vedere quindi se seguono una stessa distribuzione). \\\\ 
Questi diagrammi si basano sul fatto che i quantili campionari rappresentino l'approssimazione di quantili teorici che, se considerati tutti insiemi, individuano la distribuzione dei dati.
\end{minipage}
```

Ogni asse cartesiano di questo diagramma contiene i quantili dei due campioni presi in considerazione.

Se due campioni hanno una distribuzione uguale, allora estraendo da entrambi il quantile di un livello fissato si dovranno ottenere due numeri vicini. In questo caso i punti del diagramma Q-Q tenderanno ad allinearsi alla bisettrice del I° e III° quadrante.

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

- Circa il $68\%$ delle osservazioni rientrano nell'intervallo $\bar{x} \pm s$
- Circa il $95\%$ delle osservazioni ritentrano nell'intervallo $\bar{x} \pm 2s$
- Circa il $99.7\%$ delle osservazioni ritentrano nell'intervallo $\bar{x} \pm 3s$

Insiemi di dati bimodali
: Un insieme di dati ottenuto campionando una popolazione costituita da sottogruppi eterogenei non è di solito normale. Piuttosto, l’istogramma di un insieme di dati di questo tipo spesso rassomiglia a una sovrapposizione di istogrammi normali e quindi spesso ha due o più massimi locali. Questi massimi locali si comportano come mode. Un insieme di dati il cui istogramma ha due massimi locali si dice quindi *bimodale*.

In questi casi, quando nei dati si hanno due popolazioni ben distinte per quanto riguarda un certo attributo, ha senso dividere i dati in base a queste popolazioni e ottenere un insieme normale.
