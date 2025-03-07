# L01 - 26/09/2024

**Libro**: Artificial Intelligence. A modern Approach. Stuart Russel, Peter Norvig. 4th Edition.

```definition
"A field within computer science that is attempting to build enhanced intelligence into computer systems"
																	- Nils J. Nilsson, 2009
```

Applicazioni delle AI: robotica e computer vision.

- Emulazione: l'intelligenza artificiale è un fenomeno emergente da un sistema che internamente è progettato come una reale entità intelligente.

- Simulazione: l'intelligenza è il prodotto di un sistema che simula il comportamento di un'entità intelligente.

La comunità scientifica accetta la simulazione come il modello più adatto.

#### Turing Test

Il **Turing Test** è un esperimento ideato da Alan Turing nel 1950 per determinare se una macchina è in grado di mostrare un comportamento intelligente indistinguibile da quello di un essere umano. In questo test, un esaminatore umano interagisce tramite una tastiera con una macchina e con un altro essere umano, senza sapere chi è chi. Se l’esaminatore non riesce a distinguere tra la macchina e l’essere umano, si considera che la macchina abbia superato il test e che possieda intelligenza artificiale.

# L02 - 30/09/2024

### Breve storia

*1956*: durante una conferenza viene proposto da John McCarthy di usare il termine "Artificial Intelligence": è la nascita ufficiale.

*1950-1970*: nasce il settore, e i primi approcci portano a programmi in grado di risolvere versioni semplificate di certi problemi.

- Si creano aspettative molto alte che portano grandi finanziamenti nel settore.

*1970-1980*: ci si rese conto che la complessità dei problemi fu precedentemente sottostimata e iniziarono le prime difficoltà legate alla scalabilità.

- L'entusiasmo scompare e finanziamenti pubblici vengono azzerati: è il **primo inverno** delle AI.

*1980-1987*: c'è l'avvento dei **sistemi esperti**, che combinano la conoscenza di dominio con sistemi a regole e reasoning logico per imitare il lavoro svolto da un umano sperto.

- Non erano altro che serie di `IF-ELSE` che prendevano in considerazione tutte le casistiche verificabili in un'azienda, in un ambiente di lavoro, ecc.

- Torna di nuovo l'entusiasmo attorno alle AI, e vengono reinvestiti grandi finanziamenti pubblici (il Department of Defense statunitense investe quasi un miliardo di dollari).

*1987-1993*: i sistemi esperti sono poco flessibili e molto costosi da mantenere, i progetti pubblici vengono cancellati e le compagnie consolidate nel campo delle AI perdono milioni o falliscono.

- È il **secondo inverno** delle AI.

#### AI Winters

I due inverni dell'IA raccontano la storia di *tecnologie che non mantengono le promesse*.

- Il problema non è nella tecnologia, dato che le soluzioni dell'epoca sono ancora utilizzate oggi in molti ambiti oppure hanno contribuito allo sviluppo di nuovi metodi.
- Il problema è da ritrovarsi nelle promesse: l'eccessivo clamore iniziale attorno alla tecnologia non permette di riconoscere in modo obiettivo le sue potenzialità e i suoi limiti (**The Gartner Hype Cicle**).

Altre tecnologie che hanno seguito lo stesso andamento sono state l'internet (Dot-com Bubble) e le ferrovie.

Tecnologie che non hanno seguito il GHC e sono rimaste nel picco sono il cloud, l'energia solare e i social media.
Tecnologie che non hanno seguito il GHC e sono rimaste nella vale sono il Web3 e i film 3D.
Ci sono tecnologie che ad oggi non sono ben categorizzabili come la guida autonoma, le stampanti 3D, gli occhiali smart e la blockchain.

#### I due approcci alla AI

###### 1) Paradigma classico

Tutti gli approcci all'AI, fino agli anni 80, seguivano il **paradigma classico** dell'informatica:

- Fornito un problema e i suoi dati, si trova un algoritmo da codificare in un programma che lo risolva e lo si esegue nel computer: si ottiene in output la soluzione al problema.
    - Questo approccio funziona molto bene per problemi dove, per esempio, bisogna calcolare il percorso più veloce tra due punti (algoritmo di Dijkstra), mentre presenta dei problemi quando bisogna trovare il numero di persone in un'immagine.

###### 2) Machine Learning

Esiste però una seconda famiglia di metodi che adotta un paradigma meno tradizionale, il **machine learning**:

- Forniti i dati di un problema e la sua soluzione, li si inseriscono in un elaboratore che resituisce in output il programma che risolve il problea.
    - La macchina scrive quindi algoritmi a partire da esempi di soluzioni di un problema $\rightarrow$ esperienza.
    - Successivamente l'algoritmo può essere testato in un elaboratore tradizionale.

Questa famiglia di metodi presenta però due grossi limiti: richiede ingenti quantità di dati e computer ad altissime prestazioni. 



*1993-2011*: c'è un graduale ritorno sulla scena grazie alla crescente capacità computazionale dei calcolatori. Il settore si frammenta in sottoaree specifiche favorendo un metodo più focalizzato e rigoroso.

*2011-2021*: Big Data, web 2.0, ecc $\rightarrow$ alcune idee scoperte negli anni '70 che allora non erano percorribili diventano ora possibili. Il deep learning introduce grandi innovazioni applicative che vanno sul mercato.

*2019*: ChatGPT viene rilasciato. L'entusiasmo verso le AI esplode, aumentano i finanziamenti pubblici, le aziende nel settore tech devono avere una AI team, si lavora sul loro impatto e su una loro regolamentazione.



### Panoramica del settore

Il settore delle AI si suddivide in tanti sottosettori:

- Problem solving
- Come rappresentare la conoscenza: logica, ingegneristica, la pianificazione
- Come rappresentare le conoscenze incerte: conoscenze probabilistiche, l'inferenza
- Sistemi multi-agenti
- Machine learning: apprendimento supervisionato e non, quello rinforzato, ecc
- Problemi specifici che sono diventati dei sotto ambiti delle IA: la robotica, il deep learning, ecc

#### Ingredienti

I problemi che le tecniche diAI tipicamente affrontano sono caratterizzati da due dimensioni di difficoltà:
https://thedecisionlab.com/reference-guide/philosophy/system-1-and-system-2-thinking

###### 1) Bottom-up, apprendimento

Da un problema si costruisce il suo modello dei dati e si estraggono le caratteristiche rilevanti e si comprende il modo in cui [...]

###### 2) Top-down, inferenza

Da un problema si costruisce un modello che descriva le dinamiche dell'ambiente e come queste cambiano a seconda delle varie azioni compiute dall'agente. [...]

## Agenti

### Definizione di AI

La definizione che adotteremo principalmente è quella di agire razionalmente.

- L'emulazione è meno restrittiva.

```Definition
"[...] anything that can be viewed as perceiving its environment through sensors and acring upon that environment through actuators."													       - Russel and Norvig, 1995

"[...] a computer system that is situated in some environment, and that is capable of autonomous action [...]"
																	-Wooldrige, 2009
```



# L03 - 03/10/2024

#### Agenti reattivi (reflex)

Ciò che loro vedono al tempo $t$ è tutto ciò che hanno per decidere quale azione compiere.

- Lo stato interno coincide con l'ultima percezione fatta

L'azione si determina con una **reazione** alla percezione utilizzando un programma che mappa la percezione ricevuta sull'azione da compiere (come per esempuo un set di regole *if-then*)

<img src="/Users/kevinmuka/Library/Application Support/typora-user-images/image-20241003105449118.png" alt="image-20241003105449118 I" style="zoom: 25%; " />

#### Agenti reattivi con modello

L'agente mantiene una stima dello stato interno che aggiorna considerando le percezioni (conoscenza raccolta a runtime) e un modello dell'ambiente (conoscenza nota a priori).

- Una politica determina l'azione da compiere a seconda della stima dello stato corrente.

<img src="/Users/kevinmuka/Library/Application Support/typora-user-images/image-20241003110031567.png" alt="image-20241003110031567 I" style="zoom: 43%;" />

##### Agenti con modello orientati al goal

**Goal**: uno o più stati in cui l'agente desidera portare l'ambiente.

Oltre a stimare in quale stato ci si trovi bisogna ragioanre sulle conseguenze delle mie azioni a partire da quello stato e capire quale azione mi faccia avvicinare al goal.

- Si valuta perciò anche lo stato futuro

<img src="/Users/kevinmuka/Library/Application Support/typora-user-images/image-20241003110438000.png" alt="image-20241003110438000 I" style="zoom:37%;" />

###### Goal

Il concetto di goal ha però dei limiti nel descrivere gli obiettivi di un agente intelligente, questo perchè si descrivono in un linguaggio binario gli stati desiderati e quelli non desiderati.

- Non è perciò possibile quantificare l'utilità che questi stati avrebbero nel raggiungere il goal finale

**[...]**

Il valore intrinseco di una opzione non sempre misura correttamente la desiderabilità di ciò che essa comporta.

- *Soluzione 1*: creare una metrica che tenga conto sia del valore che dell'agente decisore: **utilità** (la proprietà di una opezione di essere utile o benefica per il decisore).
- *Soluzione 2*: variare le probabilità per modellare **avversione/propensione al rischio**.

#### Agenti basati su utilità

Viene generalizzato il concetto di goal con quello di **preferenza** sugli stati.

- L'agente sa misurare il suo grado di utilità per ogni possibile stato dell'ambiente
- Non basta ragionare su quali azioni mi portino al goal, ma si deve ragionare sull'utilità che queste mi consentono di ottenere.

<img src="/Users/kevinmuka/Library/Application Support/typora-user-images/image-20241003112254316.png" alt="image-20241003112254316 " style="zoom:23%;" />

Analisi formale del concetto di preferenza che un agente può avere rispetto agli stati del mondo:

- $S = \{s_1, s_2, \dots\}$ **insieme degli stati** possibili dell’ambiente
- $s_i \succeq s_j$ preferenza debole di $s_i$ rispetto a $s_j$ ($s_i$ non è peggio di $s_j$)

- $s_i \succ s_j$ preferenza di $s_i$ rispetto a $s_j$ ($s_i$ è meglio di $s_j$)

- $s_i \sim s_j$ indifferenza tra $s_i$ e $s_j$

- Possiamo estendere le preferenze a lotterie di stati, cioè situazioni di incertezza sullo stato espresse tramite **distribuzioni di probabilità**:
    		     				   $l \in \mathcal{L}, \ l = [\ p_1:s_1,\ p_2:s_2,\ \dots\ ], \ s_i \in \mathcal{S}, \ \sum_i p_i = 1$

Per rendere una qualsiasi relazione di preferenza significativa, abbiamo bisogno che le preferenze godano di alcune proprietà fondamentali:

- **Completezza (C)**: $\forall s_1, s_2$ deve valere $s_1 \succ s_2$ oppure $s_1 \prec s_2$ oppure $s_1 \sim s_2$

- **Transitività (T)**: $\forall s_1, s_2, s_3$, se $s_1 \succ s_2$ e $s_2 \succ s_3$, allora $s_1 \succ s_3$

- **Sostituibilità (S)**: se $s_a \sim s_b$, allora: $[\ q: s_a, p_1: s_1, p_2: s_2, \dots\ ] \sim [\ q: s_b, p_1: s_1, p_2: s_2, \dots\ ]$ 
    per ogni $s_1, s_2$ tale per cui $q + \sum_i p_i = 1$
    
- **Decomponibilità (D)**: detta $p^e_i$ la probabilità con cui la lotteria $e$ seleziona lo stato $s_i$, 
    se $\forall s_i \in S$, $p^1_i l_1 \sim p^2_i l_2$, allora $l_1 \sim l_2$

- **Monotonicità (M)**: se $s_1 \succ s_2$ e $p > q$, allora: $[\ p: s_1, (1 - p): s_2\ ] \succ [\ q: s_1, (1 - q): s_2\ ]
    $
    
- **Continuità (CC)**: se $s_1 \succ s_2 \succ s_3$, allora $\exists p \in [\ 0, 1\ ]$ tale per cui: $s_2 \sim [\ p: s_1, (1 - p): s_3\ ]$

##### Teorema dell'utilità di Von Neumann e Morgenstern

Se una relazione di preferena gode di tutte le proprietà riportate nella slide precedente, allora esiste una funzione $u: \mathcal{L} \rightarrow [\ 0, 1\ ]$ tale per cui:

- $s_1 \succ s_2 \Longrightarrow u\left(s_1\right)>u\left(s_2\right)$
- $u\left(\left[p_1: s_1, p_2: s_2, \ldots\right]\right)=\sum_i p_i u\left(s_i\right)$

La funzione $u$ è detta funzione di utilità e $u(s_i)$ è detta utilità dello stato $s_i$.

**Significato**: se le preferenze sono ben formate, allora possiamo quantificare con un numero la "*felicità*" di un agente per un certo stato (o lotteria di stati)

###### Esempio

**[...]**

Programma dell'agente
Ragionare sulle conseguenze delle azioni in termini di utilità attesa:

- Azione a: $u\left(\left[\alpha: s_2, 1-\alpha: s_3\right]\right)=\alpha$
- Azione b: $u\left(\left[\beta: s_4, 1-\beta: s_5\right]\right)=3 \beta-1$

Quale decisione prende l'agente?
$$
\begin{flalign}
\hspace{10pt}\sigma^*= \begin{cases}\mathrm{a}, & \text { se } \alpha>3 \beta-1 \\ \mathrm{b}, & \text { se } \alpha \leq 3 \beta-1\end{cases} &&
\end{flalign}
$$

**[...]**

# L04 - 07/10/2024

## Search - Capitolo 1

Ci concentriamo sulla risoluzione dei problemi atraverso un processo di inferenza (il secondo approccio della lezione precedente).

- L'inferenza di cui si andrà a discurre è chiamata ricerca, ossia si cerca un algoritmo per trovare una sequenza di azioni che l'agente potrebbe eseguire per portare il mondo da uno stato iniziale a uno stato di goal
- **[...]**

#### Spazio degli stati

- $S=\left\{s_1, s_2, \ldots\right\}$ insieme o **spazio** degli stati, assumiamo uno spazio degli stati finito
- $s_I \in S$ è lo stato **iniziale**, descrive la situazione di partenza in cui si trovano agente e ambiente
- $s_G \in S$ è lo stato di **goal**, descrive la situazione in cui l'agente vuole trovarsi
- Per ogni stato, abbiamo un insieme finito di azioni che possono essere intraprese dall'agente da quello stato $A\left(s_i\right)=\{a, b, c, \ldots\}$
- Modello di transizione $f$ : dato uno stato di partenza $s_i$ e un'azione $a \in A\left(s_i\right)$, indica uno stato di arrivo $f\left(s_i, a\right)$: rappresenta la conseguenza dello svolgere l'azione $a$ nello stato $s_i$
    - Dati uno stato ed un'azione, lo stato di arrivo dovuto da quell'azione è univoco. Si parla perciò di azioni deterministiche.
- Una transizione causata da una azione può generare un costo additivo $c\left(s_i, a, f\left(s_i, a\right)\right)$
    - $(s_i, a, f\left(s_i, a\right))$ questa terna indica una transizione

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241007110051895.png" alt="image-20241007110051895 I L" style="width: 35%;" /><br>

Gli stati possono essere interpretati come nodi e le azioni come archi. In questo esempio $A\left(s_1\right)=\{a, b\}$ e $f\left(s_1, a\right)=\left\{s_I\right\}, f\left(s_1, b\right)=\left\{s_2\right\}$





###### Esempio nella robotica e con una mappa

manipolatore e rappresentazione degli stati tramite il toroide **[...]**

#### Soluzione

**Problema di fattibilità**
Se esiste, bisogna costruire una sequenza di azioni che mi porti da $s_I$ fino ad $s_G$

- Si accetta qualsiasi soluzione purchè valida

**Problema di ottimizzazione**
Devo costruire la **miglior** sequenza di azioni che mi porti da $s_I$ fino ad $s_G$ in termini di un determinato parametro (minimizzare il tempo, lo spazio trascorso, ecc)

- Si accetta la soluzione ottima

**Approssimazione**
Accetto qualsiasi soluzione valida che sia al più $\rho$ volte peggiore di quella migliore.

- Un algoritmo approssimato non ha bisogno di conoscere la soluzione ottima, ma bisogna dimostrare che qualsiasi soluzione l'algoritmo approssimato trovi, questo non sia peggiore più di $\rho$ volte di quello ottimo: è molto difficile da dimostrare.

#### Specificare il problema

Per specificare un problema di search, si utilizzano:

- **Approccio esaustivo/esplicito**: fornire il grafo degli stati in modo esplicito, specificando tutte le transizioni possibili
    - Il più delle volte questa non è un'opzione percorribile a causa della natura combinatoria dello spazio degli stati
- **Approccio implicito**: possiamo specificare lo stato iniziale e la funzione di transizione in una forma compatta (ad esempio un insieme di regole con cui generare gli stati successivi a partire da quelli correnti)
    - Il grafo degli stati si svela man mano che le azioni vengono valutate

### Algoritmi di ricerca

#### Obiettivo della ricerca

Un algoritmo di ricerca esplora il grafo degli stati fino a quando non trova la soluzione desiderata

- Nella versione di **fattibilità** quando viene visitato un nodo di goal viene restituito il percorso che ha portato a quel nodo.
- Nella versione di **ottimizzazione** quando viene visitato un nodo di goal, se qualsiasi altro possibile percorso per quel nodo ha un costo maggiore, viene restituito il percorso che ha portato a quel nodo.

Non basta quindi visitare un nodo di goal, ma l'algoritmo deve ricostruire il percorso che ha seguito per arrivarci: deve perciò tenere traccia della sua ricerca.

- Tale traccia può essere mappata su un sottogrado di $G$, detto **albero** di ricerca (è quindi aciclico)

[ **Goal check**: l'agente, preso uno stato, riesce a riconoscere se questo sia lo stato di goal o meno ]

#### Valutare un algoritmo di ricerca

È possibile valutare un algoritmo di ricerca lungo diverse dimensioni: correttezza, completezza (sistematicità), complessità in termini di spazio e complessità in termini di tempo (o passi).

###### Correttezza

Bisogna avere la garanzia che se l'algoritmo restituisce una soluzione, questa è conforme alle caratteristiche specificate nella formulazione del problema.

- Se l'algoritmo trova una soluzione, bisogna verificare che la soluzione conduca davvero ad un goal
- [ la discesa del gradiente è un algoritmo non corretto che però funziona bene ]

###### Completezza

Si deve avere la garanzia che se una souzione esiste allora l'algoritmo la trova sempre

- La completezza di solito si dimostra facendo vedere che la ricerca nello spazio degli stati è ingrado di visitare tutti gli stati possibili, a patto di concedere un tempo arbitrariamente lungo.

Verificare, indipendentemente dall'input che l'algoritmo riceve, se questo termini.

- [ la discesa del gradiente è un algoritmo che non termina nei casi in cui la funzione non abbia un minimo ]

Se lo spazio degli stati è infinito, ci si chiede se la ricerca sia **sistematica**:

- se la risposta è sì l'algoritmo deve terminare
- se la risposta è no, va bene che l'algoritmo non termina ma tutti gli stati raggiungibili devono essere visitati nel limite: man mano che il tempo va all'infinito, tutti gli stati vengono visitati (questa definizione è valida sotto l'ipotesi di spazio degli stati numerabile)

###### Complessità spaziale e temporale

**Complessità spaziale**: bisogna verificare come cresca la quantità di memoria richiesta dall'algoritmo di ricerca in funzione della dimensione del problema (nel caso peggiore)

**Complessità temporale**: bisogna verificare come cresca il tempo richiesto (ossia il numeri di operazioni necessarie) dall'algoritmo di ricerca in funzione della dimensione del problema (nel caso peggiore)

L'$O$-grande viene utilizzato per valutare la complessità di un algoritmo **[... vedere lezione 4 algoritmi ...]**

#### Esempio di riferimento

$c(X, a, Y) = c(Y, b, X) = k$	[nelle slide questa formula è sbagliata]

[...]

**+ algoritmo di ricerca + DFS**

appunto importante tra la differenza tra gli stati e i nodi dell'albero (nelle slide usa B)

$N_{nodo} = <s, parent>$ dove s è lo stato del problema e parent è il percorso fino allo stato (è un puntatore)
$B_{nodo} = <B, A>$ dove B è lo stato B e A non è lo stato A, ma il nodo A.

[...]

# L05 - 10/10/2024

### Breadth-First Search (BFS)

La ricerca in ampiezza (BFS) espande il nodo meno profondo, ossia quello più in alto, non esplorato. Procede quindi per livelli di profondità.

- Ha un comportamento più conservativo rispetto a DFS
- Si indica con $q$ la profondità minima a cui sta una soluzione

### Nodi ridondanti

<div style="display: flex; align-items: center;">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010111119613.png" alt="image-20241010111119613 L I" style="zoom:30%;" />
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010111207237.png" alt="image-20241010111207237 I" style="zoom:30%;" />
	<p style="margin-left: 20px;">
    Sia DFS che BFS hanno visitato alcuni nodi più volte (evitare i loop impedisce che ciò possa accadere solo lungo lo stesso ramo).<br><br>
    Possiamo quindi scartare un nodo appena generato se è già presente da qualche parte nell'albero tramite una lista: la <strong>lista degli accodamenti</strong> <em>(Enqueued list, EQL)</em>
    </p>
</div>
#### DFS con EQL

<div style="display: flex; justify-content: center; align-items: center; margin-top:-18px">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010111309507.png" alt="image-20241010111309507 L I" style="zoom:60%;" />
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010110741236.png" alt="image-20241010110741236 I" style="zoom:30%;" />
</div>


Il nodo $F$ è già in lista, e quindi lo si scarta potando un ramo dell'albero (operazione di **pruning**).

- Si risparmia tempo e spazio poiché si evita di generare una parte dell'albero di ricerca

#### BFS con EQL

<div style="display: flex; justify-content: center; align-items: center;">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010111309507.png" alt="image-20241010111309507 L I" style="zoom:60%;" />
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010111347213.png" alt="image-20241010111347213 I" style="zoom:38%;" />
</div>

Anche in questo caso una parte dell'albero non viene generata con conseguente risparmio di tempo e spazio.

- La c orrettezza e la completezza sono preservate

*Nota: se non esistesse il pruning il DFS e il BFS sarebbero raramente applicabili* 

##### Implementazione

I due algoritmi si basano su due strutture dati, una delle quali viene usata senza riferirci ad esse esplicitamente:

1. $EQL$, la lista degli accodamenti, che contiene i nodi che compaiono già da qualche parte sull'albero di ricerca
2. $F$, la Frontiera, che contiene quei nodi dell'albero tra cui scegliamo per procedere con la ricerca, vale a dire i nodi terminali di tutti i percorsi attualmente in esplorazione sull'albero
    - Possiamo immaginarla come una lista i cui elementi sono ordinati per priorità e dove la selezione **consuma** l'elemento con la priorità più alta.

###### Separation property

- La frontiera **separa la parte esplorata** dello spazio degli stati **dalla parte inesplorata**.
- Per raggiungere uno stato che ancora non abbiamo ancora esplorato, dobbiamo **necessariamente** passare attraverso la frontiera.

###### Algoritmo

<div style="display: flex; align-items: center; margin-top: 0px">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010113051094.png" alt="image-20241010113051094 I" style="zoom:25%;" />
    <p style="margin-left: 20px;">
        Se F è implementata come una coda <strong>FIFO</strong> (first in first out) abbiamo una <strong>BFS</strong><br>
        <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010113408823.png" alt="image-20241010113408823 I" style="zoom:30%; display: block;
  margin-left: auto;  margin-right: auto;" />
        <br><br>Se F è implementata come una coda <strong>LIFO</strong> (last in first out) abbiamo una <strong>DFS</strong><br>
        <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010113558757.png" alt="image-20241010113558757 I" style="zoom:30%; display: block;
  margin-left: auto; margin-right: auto;" />
    </p>
</div>
###### Problema pratico

$$
[~...]
\\ \text{modo per dimostrare il modo ottimo (non presente la dimostrazione nelle slide)}
$$



***

## Ricerca della soluzione ottima

Si è interessati a cercare la soluzione ottima, ossia quella con il costo minimo: non un percorso qualsiasi verso il goal, ma il più economico possibile.

### UCS (ricerca a costo uniforme)

Per trovare questo algoritmo di ricerca ottimo si parte dal BFS. Si generalizza l'idea del BFS a quella di **Uniform Cost Search** (UCS), la ricerca a costo uniforme.

- Mentre BFS procede per livelli di profondità, **UCS procede per livelli di costo** *(quindi se i costi sono tutti uguali a una costante BFS e UCS coincidono)*

L'UCS è conosciuto anche con il nome di algoritmo di **Dijkstra**

##### Funzionamento

Nell'albero di ricerca si tiene traccia del costo accumulato sul percorso dal nodo iniziale a ogni nodo $V$: $g(V)$

- Non si prende in considerazione $EQL$

**UCS**: selezione (espansione) del nodo con $g$ minore ancora da esplorare (sulla frontiera)
**Goal check**: se il *nodo selezionato per l'espansione* è un goal, mi fermo e restituisco la soluzione

<div style="display: flex; justify-content: center; align-items: center;">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010111309507.png" alt="image-20241010111309507 L I" style="zoom:60%;" />
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010120436919.png" alt="image-20241010120436919 I" style="zoom:40%;" />
</div>
**[...] Nota in rosso -> TEOREMA + [...] dimostrazione**

#### UCS con EXL

Se quando selezioniamo per la prima volta un nodo scopriamo il percorso ottimo, non c'è motivo di selezionare lo stesso nodo una seconda volta: si introduce la lista dei nodi espansi **EXL**

Ogni volta che selezioniamo un nodo per l'estensione:

- se il nodo è già in EXL, lo scartiamo
- altrimenti lo espandiamo e lo inseriamo in EXL

*Attenzione: EXL è diversa da EQL. Se usassimo EQL in UCS l'ottimalità non sarebbe più garantita.*

<div style="display: flex; justify-content: center; align-items: center; margin-bottom:-18px">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010111309507.png" alt="image-20241010111309507 L I" style="zoom:60%;" />
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241014110146330.png" alt="image-20241014110146330 I" style="zoom:35%;" />
</div>

- Tramite l'utilizzo della lista EXL possiamo potare due rami

##### Implementazione

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241014110628023.png" alt="image-20241014110628023" style="zoom:38%;" />

# L06 - 14/10/2024

### Ricerca non informata

Gli algoritmi di ricerca visti in precendeza sono non informati.

Gli algoritmi di ricerca decidono quale nodo espandere attraverso delle regole che applicano in funzione della conoscenza del problema e del processo di ricerca svolto fino al tempo presente.

- Hanno bisogno di conoscere il modello di transizione del problema e devono tenere traccia dell'albero di ricerca per poter operare.

- Ciò che quegli stati rappresentano nel mondo reale non ha importanza, è un algoritmo agnostico rispetto al mondo che lo circonda (per qeusto vengono detti non informati).

Una ricerca è **non informata** se utilizza solo la conoscenza del problema che è specificata nella sua definizione: il grado, le sue connessioni e il criterio con cui scegliere il prossimo nodo. La scelta del nodo stesso non considera la sua bontà (non considera quanto sia vantaggioso quel nodo per il futuro).

## Ricerca informata

Una ricerca **informata** va oltre la definizione del problema sfruttando della conoscenza aggiuntiva: ciò che quel grafo, quelle connessioni e quei costi rappresentano nel mondo reale, oltre il formalismo agnostico che li esprime

Dato un generico stato $S$, usando questa conoscenza, un algoritmo informato **stima** la bontà di $S$ attraverso una funzione $f(S)$ e guida la ricerca usando $f$.

- Approccio **best-first**: espandere prima gli stati che hanno una $f$ migliore
- Esistono diversi algoritmi di ricerca best-firs, ciò che li differenzia è il come $f$ sia definita

### A*

Nel 1968, Nilsson, Hart e Raphael dovettero affrontare un problema pratico con Shakey (uno degli antenati dei robot mobili di oggi): dovevano trovare un modo per calcolare il percorso più breve per raggiungere una destinazione su una mappa a griglia.

- La soluzione che i tre proposero è nota come $A$* *(a star)*
- È un algoritmo di ricerca informata, di tipo best-first
  

L'idea alla base di $A$* consiste nell'eseguire un UCS, ma invece di considerare soltanto i costi accumulati $g$, bisogna tener conto anche della funzione $f(s)=g(s) +h(s)$

- Con $g(s)$ si indica, come prima, il costo accumulato lungo il path che arriva nello stato $s$
- Con $h(s)$ si indica una stima del costo ancora da spendere per arrivare al goal lungo il path ottimo: è l'**euristica**

L'algoritmo di ricerca seleziona per l'espansione i nodi sulla frontiera che minimizzano $f$

***[** Due esempi per comprendere l'euristica*

1. Distanza euclidea
2. Distanza di Manhattan **]**

#### Euristica: ammissibilità

Una proprietà fondamentale che una buona euristica deve avere è l'ammissibilità

Un'euristica $h$ è ammissibile se per ogni possibile stato $s$ $h(s)$ non sovrastima il costo del path minimo da $s$ al goal

- la stima deve perciò essere ottimista
- se questa proprietà non vale, l'algoritmo di ricerca potrebbe non riconoscere il percorso ottimo

**Esempio di un'euritstica non ammissibile** che fa perdere il costo ottimo:
si supponga che l'euristica sia sempre uguale a 0 (caso degenere sempre ammissibile) tranne che per lo stato $F: h(F)=100$ 

<div style="display: flex; justify-content: center; align-items: center;">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010111309507.png" alt="image-20241010111309507 L R" style="zoom:60%;" />
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241014115502261.png" alt="image-20241014115502261 I" style="zoom:35%;" />
</div>


#### A* con EXL

**Esempio 1**

<div style="display: flex; justify-content: center; align-items: center; margin-top:-18px">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241010111309507.png" alt="image-20241010111309507 L I" style="zoom:60%;" />
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241014120229650.png" alt="image-20241014120229650 I" style="zoom:45%;" />
	<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241014115830668.png" alt="image-20241014115830668 I" style="zoom:30%;" />
</div>
Grazie all'ammissibilità manteniamo la stessa proprietà di ottimalità che abbiamo dimostrato per UCS: se non sovrastimiamo non possiamo scartare il path ottimo

**Esempio 2**

<div style="display: flex; justify-content: center; align-items: center; margin-top:-18px">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241014121517176.png" alt="image-20241014121517176" style="zoom:40%;" />
	<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241014121542884.png" alt="image-20241014121542884" style="zoom:25%;" />
</div>
# L07 - 17/10/2024

#### Euristica: consistenza

Se lavoriamo con EXL (cosa molto desiderata) l'ammissibilità non garantisce l'ottimalità. Per risolvere questo problema è necessario considerare una proprietà più stringente del'ammissibilità: la **consistenza**.

Siano $V$ e $U$ due stati connessi da un'azione $a$, una euristica $h$ è consistente se per ogni possibile coppia di $V$ e $U$ vale la disugaglianza $h(V) \le c(V, a, U) + h(U)$

- Un'euristica consistente è anche ammissibile

Se l'euristica non è consistente, $A$* non trova l'ottimo con la regola di pruning. Se però non si usa la EXL, allora la consistenza non è necessaria ma basta solo l'ammissibilità (l'utilizzo dell'EXL è comunque preferito in quanto permette di svolgere meno passaggi).

<div style="display: flex; justify-content: center; align-items: center;">
  <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241017105729468.png" alt="image-20241017105729468" style="zoom:40%;" />
	<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241017110009867.png" alt="image-20241017110009867" style="zoom:30%; margin-left:80px;" />
</div>


### Ottimalità di A*

Se assumiamo che $h$ sia consistente, possiamo costruire una dimostrazione per l'ottimalità di $A$*. Si comincia con il derivare una proprietà di $f$

1. Consideriamo, come fatto in precedenza, due stati $V$ e $U$ connessi da un'azione $a$ che l'algoritmo ha generato uno dopo l'altro sull'albero di ricerca
2. Per definizione $f(U)=g(U)+h(U)$
3. Per definizione di $g$ e nostra assunzione in $1$, $g(U)=g(V)+c(V, a, U)$
4. Sostituendo $3$ in $2$: $f(U) = g(V) + \textcolor[rgb]{0.5, 0.5, 0.5}{c(V, a, U) + h(U)}$
5. Per la proprietà di $\text{\textcolor[rgb]{0.5, 0.5, 0.5}{consistenza}}$ $c(V, a, U) + h(U) \ge h(V)$
6. Sommando $g(V)$ a entrambi i termini: $g(V) + c(V, a, U) + h(U) \ge g(V) + h(V)$
7. $f(U) \ge f(V) \Rightarrow $ lungo ogni percorso nell’albero di ricerca la f è monotona non decrescente

**[immagine dalle slide nuove]**

Estendo la notazione di $f$ esplicitando il path su cui calcola il costo $g \hspace{1px}$: f(p,n)= g(p) + h(n)$

**Ipotesi**:

1. $A$* selezione per la prima volta dalla frontiera un nodo $V$ che è stato generato attraverso un percorso $p$
2. Il percorso $p$ non è il percorso ottimo per raggiungere $V$: $p^* \not = p$

Dato $2$ e la separation property della frontiera, sappiamo che deve esistere un nodo $X$ sulla frontiera che si trova sul cammino ottimo $p^* = p_1^* + p_2^*$ verso $V$

1. $g(p) > g(p^*)$ perché sia $p^*$ che $p$ sono path che portano a $V$, ma il primo è ottimo mentre il secondo no
2. $f(p^*, V) \ge f(p_1^*, X)$ dalla consistenza di $h$ ($f$ monotona non decrescente)
3. $g(p) + h(V) > g(p^*) + h(V)$ sommando lo stesso termine ai membri di $1$
4. $f(p, V) > f(p^*, V) \ge f(p_1^*, X)$ mettendo insieme $3$, $2$ e la definizione di $f$
5. $f(p, V) > f(p_1^*, X)$ quindi $V$ non può essere stato scelto prima di $X$, l'ipotesi $1$ è violata

**[immagine dalle slide nuove]**

## Progettare un'euristica

**[...]**

# L07 - 21/10/2024

### Limiti di A*

L'utilizzo di euristiche consistenti costituisce un vantaggio perché garantisce l'ottimalità

- Può però costituire anche un limite poiché manca di flessibilità

Se si considera una situazione in cui in frontiera ci sono un gran numero di nodi, ciascuno dei quali rappresenta un path verso il goal e tutti con più o meno lo stesso costo, ci si rende conto che $A$* può seguire un solo nodo **[...]**

### Focal Search

È un'algoritmo $A$* più flessibile, che garantisce di trovare una soluzione quasi ottima. 

Si ha a disposizione una seconda euristica, **non ammissibile**, che chiamiamo $\hat{h}_F$
$\hat{h}_F(n)$ è una stima del costo computazionale necessario per completare la ricerca del percorso ottimo verso il goal

- È un'euristica che stima un qualcosa non relativo al problema da risolvere, ma relativo all'esecuzione dell'algoritmo stesso

Ricordando che in un problema di search le azioni non hanno costi uniformi, possiamo dire che dato un nodo $n$

- $h(n)$ stima ottimisticamente il costo rimanente da spendere per arrivare al goal
- $\hat{h}_F(n)$ stima il numero di azioni ancora da compiere per arrivare al goal, ovver la lunghezza della parte di soluzione ancora da costruire

Il costo computazionale, che è un valore associato all'algoritmo che gira effettivamente sulla macchina, non è assolutamente legato al costo da spendere per arrivare al goal, che è invece un valore associato al problema che l'algoritmo cerca di risolvere.

###### Problema del commesso viaggiatore

nodi $\rightarrow$ città; 
collegamenti $\rightarrow$ strade, ciascuna strada ha un costo diverso e positivo (grafo completo); 
soluzione: ciclo Hamiltoniano di costo minimo ($\mathcal{NP}{-}\text{Hard}$)

Bisogna formalizzare un **problema di search** per questo problema:

- In questo caso gli stati non sono le città (non devo trovare il percorso da uno stato (città) $\alpha$ ad uno stato $\beta$, per come è posto il problema si può già fare), ma corrispondono a dei percorsi parziali, ossia a un insieme di città.
    Stato $\rightarrow$ percorso parziale (es. $n = \lt \alpha \rightarrow \gamma \rightarrow \delta \gt$ )
- Costo $\rightarrow$ somma dei collegamenti percorsi
- Azioni $\rightarrow$ spostamenti verso una città non precedentemente visitata
- Se $x$ è la città non ancora visitata più lontana dall'ultima città $\delta$ nel path:
    $h(n) = dist(\delta, x) + dist(x, \alpha)$
- $\hat{h}_F(n)$ numero di città rimanenti da visitare

##### Come funziona

- $F$: lista dei nodi in frontiera, quella usata da $A$*
- $n_{\text{best}} = \arg \underset{n \in F}{\min} f(n)$ *(è il prossimo nodo da espandere nella frontiera seguendo lo stesso principio di $A$\*)*
- $\omega \ge 1$, un parametro che scegliamo noi
- $FOCAL \subseteq F$ sottolista definita come $FOCAL = \{n \in F ~|~  f(n) \le \omega \cdot f(n_{\text{best}}) \}$
- **Regola di espansione**: scegliere da $FOCAL$ il nodo che minimizza $\hat{h}_F, n_{\text{next}} = \arg \underset{n \in FOCAL}{\min} \hat{h}_F(n)$
    *(si può scegliere anche in maniera casuale quale nodo andare a prendere da $FOCAL$)*
- Tutto il resto rimane uguale ad $A$*

**Conseguenze: **

- Si perda l'ottimalità in quanto non si sceglie più il nodo $n$ con la $f(n)$ minore.
- La perdita di ottimalità non è arbitrariamente grande, ma è controllabile con il parametro $\omega$. Ciò rende l'algoritmo molto flessibile.

##### Focal Search è una BSS

**[...]** parte importante da riguardarsi in videolezione

**BSS**: Bounded Suboptimal Search

##### Problema del trashing

**[...]** guardare la videolezione

EES (Explicit Estimation Search, 2011) risolve questo problema

## Altri algoritmi di ricerca



# L08 - 24/10/2024

## Adversarial Search - Capitolo 2

I problemi di search già affrontati sono caratterizzati da un singolo agente che interagisce con l'ambiente.

Nel caso in cui invece siano presenti altri agenti con obiettivi anche diversi da quello del nostro agente di riferimento si parla di sistema multi-agente, e l'interazione tra di essi è detta gioco.

### Gioco

Un gioco è un problema di decisione interattivo.

- Ogni agente ha le proprie preferenze individuali sugli stati del mondo
- Le azioni di un agente influenzano l'ambiente condiviso da tutti e quindi, indirettamente, anche gli altri agenti
- Nel cercare una sequenza di azioni verso lo stato desiderato non possiamo ignorare la presenza degli altri decisori

Esistono diversi tipi di giochi: 

- $\mathbf{2}$ 0 $n$ giocatori; 
- agenti **razionali** o parzialmente razionali; 
- struttura sequenziale tramite **turni** o azioni simultanee; 
- **deterministico** o stocastico (le azioni hanno effetti prevedibili o meno); 
- struttura dei payoff: **somma costante** o a somma generica; 
- **informazione completa** o incompleta (i giocatori conoscono o meno gli obiettivi e le azioni disponibili agli altri agenti);
- **informazione perfetta** o imperfetta: i giocatori sono o meno informati di tutto quello che è successo ad ogni punto del gioco.

Lo studio del comportamento individuale dei singoli agenti è detto *teoria dei giochi competitiva*, mentre lo studio delle dinamiche nella formazione di coalizioni è detta *teoria dei giochi cooperativa*.

###### Excursus storico

Garry Kasparov, campione mondiale in carica degli scacchi, contro Deep Blue, 11 maggio di 1997.

- Milestone nel campo delle AI che coincide con la risoluzione di un gioco che si pensava essere di padronanza di solo dell'uomo.

Il Go, un gioco di natura estremamente combinatoria, si pensava anche dopo questo avvenimento che fosse impossibile che le AI potessero conquistare anche questo gioco. 19 anni dopo Lee Se-dol perde contro Alpha Go, 9-15 marzo 2016. Di nuovo le AI battono gli umani su un problema che si pensava essere di pertinenza esclusivamente umana.

#### Formalizzazione

##### Meccanismo

Il **meccanismo**, ossia le regole del gioco, è composto da:

- **Stati**: $S= \{s_1, s_2, \cdots \}$ insieme o spazio degli stati dove $s_k \in S$ è lo stato iniziale (la situazione di partenza in cui si trovano gli agenti e ambiente)
- **Giocatori e azioni possibili**: insieme di agenti $I = \{ i_1,i_2 \}$, insieme di azioni disponibili $A = \{a_1, a_2, a_3, \cdots\}$
- **Turni e azioni legali**: dato $s_k \in S$, $I(s_k) \in I$ è il giocatore che ha diritto di compiere un’azione (turno) e $A(s_k)$ è l’insieme di azioni che può intraprendere.
- **Modello di transizione**: dato $s_k \in S$ e $a \in A(I(s_k))$, $f(s_k, a) \in S$ indica il prossimo stato del gioco e cioè il risultato della mossa $a$.
- **Stati terminali**: dato uno stato $s_k$, $T(s_k) = 1$ se $s_k$ è uno stato terminale, dove il gioco termina e un payoff viene inviato ad ogni giocatore; vale 0 altrimenti.
- **Utilità**: dato uno stato terminale $s_t$, $u_i(s_t)$ è il payoff che il giocatore $i$ riceve in quello stato.

Questa formalizzazione implica: 2 giocatori, struttura sequenziale a turni alternati, azioni deterministiche.

Definizioni:

- **Informazione completa**: entrambi i giocatori hanno accesso al meccanismo, conoscono azioni possibili e utilità del proprio avversario.
- **Informazione perfetta**: dato uno stato corrente del gioco $s_i$ ogni giocatore ha accesso allo stato e alla sequenza di azioni che, a partire dallo stato iniziale, ha portato fino ad $s_k$
- **A somma zero**: significa che in ogni stato terminale $s_t$ vale $u_1(s_t) + u_2(s_t) = 0$ 
    - **[...]**

##### Strategie

Il meccanismo, che descrive le regole del gioco, rappresenta solo una parte della sua descrizione; l'altra parte è data dalle **strategie**.

- La strategia di un giocatore $i$ specifica il comportamento di quel giocatore in ogni possibile stato del gioco, dato $s_k$, tale per cui $I(s_k) = i$, $\sigma_i(s_k)$ è la strategia di $i$ nello stato $s_k$
  - Se la strategia coincide con una singola azione, quella da giocare, in quel caso si chiama **strategia pura**: 
    $$\sigma_i: \{ s_k \mid I(s_k) = i \} \rightarrow A(s_k)$$
  - Se invece la strategia è una distribuzione di probabilità su più azioni, si chiama **strategia mista**: 
    $$\sigma_i: \{ s_k \mid I(s_k) = i \} \rightarrow \Pi(A(s_k))$$  (dove $\Pi(Q)$ è lo spazio delle distribuzioni di probabilità sugli elementi di $Q$)
- Per ora ci concentreremo principalmente su **strategie pure**.
- **Strategia ottima**: quella strategia tale per cui ogni strategia diversa non introduce miglioramenti contro un avversario **infallibile**.

##### Albero di gioco

Il meccanismo dà origine all'albero di gioco, che è un **albero di ricerca** che si ottiene sviluppando tutte le possibili sequenze di mosse alternate, dove ogni nodo è un nodo di decisione: uno dei due giocatori deve fare la sua mossa.

Ogni branch rappresenta una partita: dallo stato iniziale fino a quello terminale dove il gioco termina e i payoff sono distribuiti, ogni foglia è uno stato terminale su cui indichiamo il payoff del giocatore $i_1$ (quello del giocatore $i_2$ è uguale e opposto)

**[...]** esempio con il **tris**

### Minimax

Nei problemi di search l'albero di ricerca rappresentava il processo di inferenza per trovare una strada o la strada ottima per il goal.

**[...]**

# L09 - 28/10/2024

## α-β pruning 

Minimax deve eseguire una DFS esaustiva su tutto l'albero di gioco per poter determinare la sua mossa. Si ha quindi una complessità esponenziale nella profondità dell'albero $\mathcal{O}(b^d)$

- Certi giochi presentano una elevata complessità combinatoria (scacchi $\approx 10^{123}$) che rappresenta un limite impossibile da valicare con un approccio come Minimax



Si consideri questa situazione su un albero di gioco esplorato da Minimax:

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241028110430871.png" alt="image-20241028110430871" style="zoom:37%; margin-top:-40px; margin-bottom:-40px" />

##### Principio dell'α-β pruning 

man mano che la DFS procede si tiene traccia, su ogni nodo del branch corrente, di ciò che sappiamo sul valore di quel nodo (il valore che troveremmo con una DFS esaustiva in Minimax)

Fino a che la DFS non ha esplorato tutti i nodi figli, non conosciamo con esattezza il valore del nodo. Però qualcosa lo si ottiene comunque:

- se da un nodo $MAX~v$ scopriamo un nodo figlio con valore 5, allora sappiamo che il valore di $v$ è almeno 5
- se da un nodo $MIN~q$ scopriamo un nodo figlio con valore 7, sappiamo che il valore di $q$ è al più 7

Di conseguenza, anzichè usare un valore singolo si adopera un intervallo di valor [$\alpha, \beta \hspace{1.5px}$]: ciò indiche che, stando a quanto scoperto dalla DFS fino a quel momento, il valore Minimax di quel nodo è compreso in quell'intervallo

- Inizialmente l'intervallo che si prende in considerazione è [$-\infty, +\infty$]
- Quando $\alpha$ e $\beta$ coincidono allora si è arrivati al valore esatto del nodo

Questo è fondamentale perché spesso per scartare un nodo dall'albero di gioco non ci serve il suo esatto valore Minimax, ma basta [$\alpha, \beta \hspace{1.5px}$]

- $\alpha$: il minimo valore garantito per $MAX$
- $\beta$: il massimo valore garantito per $MIN$

**[2 esempi per capire il funzionamento]**

#### Implementazione algoritmica

**[...]**

La potatura $\alpha, \beta$ introduce i maggiori vantaggi quando le mosse migliori sono scoperte all'inizio: prima si scoprono queste mosse migliori, maggiore sarà il numero di rami potati.

Nell'albero di ricerca è importante avere un ordinamento delle mosse vantaggioso, che consenta alla DFS di esplorare il prima possibile le mosse migliori.

<div style="display: flex; justify-content: center; align-items: center; margin-bottom:20px">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241028114249076.png" alt="image-20241028114249076" style="zoom:23%;" />
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241028114313456.png" alt="image-20241028114313456" style="zoom:23%;" />
</div>

Se $d$ è la profondità dell'albero e $b$ è il branching factor, l'ordinamento delle mosse peggiori annichilisce il pruning che diventa di fatto equivalente ad una DFS: $\mathcal{O}(b^d)$

Ma con l'ordinamento migliore la complessità diventa $\mathcal{O}(b \cross 1 \cross b \cross 1 \cross \dotsc) = \mathcal{O}(b^{\scriptsize \dfrac{d}{2}})$, come se il branching factor fosse passato a $\sqrt{b}$: nello stesso tempo si riesce ad esplorare un albero profondo il doppio.

La potatura $\alpha, \beta$ può introdurre diversi vantaggi, ma ha un problema di fondo: almeno una porzione dell'albero di gioco va esplorata fino ai nodi terminali. Questo risulta impossibile in molti casi reali per via di:

1. Complessità elevatissima dell'albero di gioco
2. Tempo limitato entro cui va presa la decisione su quale mossa si debba fare

****

## Migliorie a Minimax

Si vogliono migliorare due aspetti:

1. calcolare un ordine delle azioni man mano che la ricerca procede, e non quello perfetto ma uno euristico, informato da ciò che la ricerca ha scoperto fino a quel momento
2. assegnare un valore numerico anche ad un nodo non terminale $p$ dell'albero di gioco, in modo da stimare il valore Minimax senza dover scendere in profondità fino ad almeno una foglia del sotto-albero con radice in $p$

Questo è possibile farlo, e la tecnica che lo permette combina tre elementi:

1. funzioni di valutazione e cutoff
2. tabelle delle trasposizioni
3. iterative deepening

### Funzioni di valutazione e cutoff

Dato un nodo $s$ dell'albero di gioco, anziché calcolare il suo valore Minimax si fornisce una stima di quel valore applicando una funzione di valutazione $v(s)$

- La funzione $v$ è un'**euristica**: produce una stima della qualità di quel nodo e codifica, in una computazione efficiente, quello che un giocatore umano fa quando cerca di intuire la bontà del trovarsi in una particolare situazione del gioco.

###### Approccio

data $v$ e un **test di cutoff** $CUT(s, d)$ per un nodo $d$ alla profondità $d$, se il test restituisce `false` eseguo Minimax da quel nodo, altrimento fermo Minimax e restituisco $v(s)$

- Introduciamo incertezza: la complessità computazionale mi impedisce di calcolare il valore esatto di ogni nodo anche se, viste le assunzioni sul meccanismo, sarebbe possibile.
- Se la funzione di valutazione è efficace, posso riuscire comunque ad identificare buone mosse

###### Vantaggi

1. Posso fermare la ricerca dopo un tempo ragionevole e fornire comunque un'azione da giocare
2. Posso usare $v$ per ordinare le azioni e valutare prima quelle che sono migliori

# L10 - 31/10/2024

Dato uno stato si possono definire delle **feature** che lo descrivono.

- Negli scacchi $(n_1,n_2,\cdots,n_6)$ dove $n_i$ è il numero di pezzi del tipo $i$ rimasti sulla scacchiera (pedone, ecc)

Si definisce una **funzione basata sull'esperienza** (ossia tante partite che si sono giocate e salvate in un dataset):

- Ogni profilo di feature $p$ definisce una classe di equivalenza tra stati
- Dall'esperienza sappiamo, per esempio, che in tutte le occasioni in cui ci siamo trovati in uno stato con profilo $p$. nel 50% dei casi abbiamo vinto, nel 20% perso e nel 30% pareggiato
- Perciò se $s$ è un nodo con profilo $p$ possiamo assegnarli il valore $v(s) = 0.5 \cross 1 + 0.2 \cross (-1) + 0.3 \cross 0 = 0.3$

Si definisce poi una **funzione basata sulla combinazione** di feature:

- Se si chiamano $f_1(s), f_2(s), \cdots, f_n(s)$ le $n$ feature che ho definito per un generico stato $s$, posso aggregarle per ottenere un valore: $v(s) = \omega_1 f_1(s) + \omega_2 f_2 (s) + \cdots + \omega_n f_n (s)$

Nella pratica queste funzioni sono convenienti se riusciamo a definire delle buone feature **manualmente** e se si può calcolare in modo **efficiente** la funzione di valutazione.



Si consideri un test di cutoff $CUT(s,d)$ basato su soglia di profondità massima.
Identificazione degli **stati quiescenti**: gli stati da cui non ci aspettano grandi cambiamenti in termini di valore
**[...]**

### Trasposizioni

Molti nodi nell'albero di ricerca sono strategicamente equivalenti perché identici per via di simmetrie e regolarità

**Trasposition table**: hash table dove per ogni stato $\bar{s}$ valutato dalla ricerca mantengo questi campi:

- Il valore dello stato $\bar{v}$ e la mossa associata $\bar{a}$
- La profondità massima $\bar{d}$ a cui è arrivata la ricerca che ha valutato il nodo (dipende dal cutoff)

**[...]**



### α-β pruning con iterative deepening

$\text{D}(s_k, d_{MAX}, TT)$: restituisce la strategia migliore per uno stato $s_k$ usando DFS, $\alpha \text{-} \beta$ pruning, cutoff basato su limite di profondità $d_{MAX}$ e transposition table $TT$

Per ogni nodo $s$ che viene selezionato dalla DFS:

- Se $s \in TT$ valuta $s$ e aggiungi il record $[ \bar{s} \leftarrow s, \bar{v} \leftarrow v, \bar{a} \leftarrow a, \bar{d} \leftarrow d_{MAX}]$ a $TT$
- Se $s \in TT$:
    1. 

**[...]**

### Forward pruning

**[...]**

****

## Giochi stocastici

### Expectimax

**[...]**

# L11 - 04/11/2024

###### Stimare il valore di un'azione

Bisogna trasformare il processo di inferenza in un **processo di stima**: non si cerca l'azione migliore ma si stima la bontà di ogni azione e sceglo quella con il valore stimato più alto.

##### Monte Carlo Tree Search

Per fare ciò si usa il **MCTS**:

- si considera un'azione e lo stato $s$ in cui porterebbe
- si simula un numero molto alto di partite partendo da $s$: si gioca scegliendo le azioni in maniera casuale
- la media dei punteggi finali è una stima del valore di $s$
- si ripete ogni azione e si sceglie quella con la stima più alta

###### Esempio

Si consideri un caso semplificato, in cui data una singola zione $a_i$ si voglia stimare la sua **winning rate**, ossia la probabilità di vincere la partita se ci si trovasse nello stato $s_i$ in cui tale azione porta.
Si possono scegliere tra $n$ azioni ($a_1, a_2, \cdots, a_n$) e si ha un tempo limitato che consente di svolgere un totale di $N$ simulazioni, senza poter parallelizzarle.

- Un approccio potrebbe essere eseguire $\dfrac{N}{n}$ simulazioni per ogni $s_i$ e per ciascuno ottengo la stima della winning rate $\omega_i=\dfrac{n W_i}{N}$ dove $W_i$ è il numero di imulazioni in cui si è vinto; alla fine si gioca $a^*=argmax_i\{\omega_i\}$

**Problema**: si suddivide lo sforzo in modo uniforme e non informato, spendendo troppe simulazioni su azioni chiaramente non buone e magari troppo poche su azioni migliori che richiederebbero più precisione nella stima
**Soluzione**: concentrare più sforzo, ossia eseguire più simulazioni, verso le azioni che si configurano come migliori

- Nonotante tutto bisogna non escludere del tutto le azioni che non sembrano buone: queste con più simulazioni possono magari portare a soluzioni migliori

<font style="color:rgb(174, 174, 174)">È il dilemma della Exploration vs Exploitation</font>

##### Multi-Armed Bandit Problem

Risultato fondante dell'informatica: **Upper Confidence Bound** (UCB)

**[...]**

**MCTS con UCB**

- È un algoritmo Anytime, ossia fermando l'algoritmo a un qualsiasi tempo $t$ si ottiene una decisione migliore possibile con le informazioni raccolte fino a quel momento
- Non necessita di erustiche, funzioni di valutazione, ecc...
- È un algoritmo **informato**: la ricerca si concentra maggiormente sui branch più promettenti

## Constraint Satisfaction Problems (CSP) - Capitolo 3

Gli algoritmi di search considerano lo stato come un'entità atomica, e quindi ragionano solo sulla struttura dello spazio degli stati senza considerare minimamente il come uno stato codifichi ciò che rappresenta.

Nei problemi in cui però la struttura dello stato è accessibile, anziche cercare una sequenza di transizioni per arrivare al goal si cerca di identificare lo stato di goal manipolando direttametne la sua strutture interna

I CSP sono un sotto-insieme dei problemi di search dove stato, transizione e goal check hanno una struttura specifica:

- stato = insieme di variabilli
- tansizione = assegnazione ad una variabile
- goal check = soddisfare un insieme di vincoli sugli assegnamenti

**[...]**

# L11 - 07/11/2024

Il tipo di un vincolo dipende dal numero di variabili che coinvolge:

- **Vincolo unario**: convolge una sola variabile *( x > 4, x != 0 )*
- **Vincolo binario**: coinvolge una coppia di variabili *( x1 != x2, x1 < 5x2 )*
- Vincolo più generale che coinvolge un numero maggiore di variabili *( x2 < x1 < x3, x1 > 2x2 + 3x3 )*
- **Vincolo globale**: coinvolge fino a tutte le variabili presenti in un CSP *( AllDiff(x1, x2, x3, ...) )*

Un CSP con domini finiti può essere sempre convertito in uno equivalente a patto di introdurre un numero sufficiente di variabili ausiliarie.

###### Esempio di conversione

Per convertire un vincolo con un numero maggiore di variabili in uno binario, come per esempio $A + B = C$, bisogna utilizzare una nuova variabile ausiliaria $V$ il cui dominio è $D_A {\cross} D_B$

- Quindi i valori assegnabili a $V$ sono tuple di 2 valori, uno del dominio di $A$ e uno del dominio di $B$

Si impongono nuovi vincoli: sia $V$ una variabile a $n$ dimensioni e $X$ una variabile standard ad una dimensione:

- $i(X, V)$ impone che $X$ sia uguale all'$i$-esimo valore della tula assegnata a $V$
    *se $V = (9, -11, 42)$ allora $2(X, V)$ impone che $X$ sebba valere $-11$*

- $\Sigma(X, V)$ impone che $X$ sia uguale alla somma di tutti i valori della tupla assegnata a $V$

    *se $V = (9, -11, 42)$ allora $\Sigma(X, V)$ impone che $X$ sebba valere $40$*

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241107112705833.png" alt="image-20241107112705833" style="zoom:20%; margin-top:-30px; margin-bottom:-50px" />

### Metodi risolutivi

Risolvere i CSP, ossia un sottoinsieme dei problemi di search, tramite un algoritmo di ricerca non ci permette di sfruttare pienamente la struttura del problema

- *potremmo per esempio usare una DFS dove un goal è uno stato in cui tutte le variabili sono assegnate e i vincoli sono rispettati. Nel caso pessimo verranno provati tutti gli assegnamenti possibili e alla fine avremo o un goal oppure si scoprirà che il problema non è soddisfacibile*

La search può essere rafforzata con un'attività di inferenza sui vincoli che si chiama **constrait propagation**

- si fa un assegnamento corrente e parziale delle variabili, si considerano i vincoli del problema e si escludono alcuni assegnamenti possibili sulle variabili non ancora assegnate
- questo funziona perché adesso conosciamo la struttura interna degli stati

#### Consistenza di nodo

La consistenza di nodo è la prima e più semplice forma di propagazione dei vincoli. Si applica solo ai **vincoli unari** e la si esegue in una fase di pre-processing del CSP.

###### Procedimento

Per ogni variabile $X_i$ si rimuovono da $D_i$ tutti i valori che non soddisfano i vincoli unari 
*$\qquad \rightarrow$ (se si ha un vincolo $X_i \not = 5$ allora si rimuove $5$ dal suo dominio)*

Se alla fine di questo procedimento:

- c'è almeno una variabile con dominio vuoto abbiamo risolto il CSP, che è **insoddisfacibile**
- ogni variabile ha un solo valore nel suo dominio, abbiamo risolto il CSP e, per verificare che sia soddisfacibile o meno, possiamo fare l'unico assegnamento possibile e verificarne i vincoli (quelli che non sono unari)
- in tutti gli altri casi abbiamo un CSP equivalente ma più compatto

È raro che la consistenza di nodo risolva un CSP, introduce solo delle semplici e piccole ottimizzazioni.

#### Consistenza di arco

La consistenza d'arco propaga i **vincoli binari**, e quindi gli archi del constraint graph.

Una variabile $X_i$ è consistente rispetto a una variabile $X_j$ se per ogni valore in $D_i$ c'è un valore in $D_j$ che soddisfa il vincolo binario tra le due.

###### Esempio: 

- $X_1 \ge X_2, ~~D_1 = \{7,12\}, ~~D_2 = \{1, 2, 15\}; \quad$ $X_1$ è arc-consistent rispetto a $X_2$
- $X_1 \lt X_2, ~~D_1 = \{5, 6\}, ~~~~D_2 = \{5, 6, 1\}; \quad~$ $X_1$ non è arc-consistent rispetto a $X_2$

Nel secondo esempio, la **non** consistenza di arco ci suggerisce che $6$ non può essere assegnato a $X_1$, quindi potremmo eliminarlo dal suo dominio $D_1$

Per **rendere una variabile arc-consistent**, bisogna eliminare dal suo dominio tutti i valori che la rendono non consistente rispetto ad un'altra variabile con cui condivide un vincolo binario.

- Un CSP è arc-consistent se tutti i nodi, ossia tutte le variabili, sono arc-consistent

Anche la consistenza d'arco non risolve sempre un CSP da sola, ma di sicuro capita più spesso rispetto alla consistenza di nodo e se non ci riesce lo semplifica in modo significativo.

**[... esempio sulle slide ...]**

# L12 - 11/11/2024

**[...]** gruppo di slides 04a fine e 04b

#### Consistenza di percorso

[...]

### Backtracking search e Min-Conflicts





# L13 - 14/11/2024

## Markov Decision Processes (MDP) - Capitolo 4

È una nuova classe di problemi più generale per un singolo agente. Sono utilizzati nella robotica.

Si **abbandona il concetto di goal** come principale rappresentante dei desideri dell'agente, si aggiunge un **orizzonte temporale** e ci troviamo in un **ambiente stocastico** (non c'è più certezza).

##### Formalizzazione

\- $S = \{s, p, q, \cdots\}$ spazio **finito** degli stati
\- $s_I \in S$ è lo stato **iniziale**, descrive la situazione di partenza in cui si trovano agente e ambiente
\- $s_T \in S$ è uno stato **terminale**

- possono essere più di uno o anche nessuno
- descrive la situazione in cui il processo si conclude, e da uno di essi non si possono eseguire azioni

\- Insieme **finito** di azioni $A(s) = {a, b, c, \cdots}$
\- Modello di transizione $f$ **stocastico**:

- dato uno stato di partenza $s \in S$, un'azione $a \in A(s)$ e uno stato di arrivo $s' \in S$, $f$ indica la **probabilità della transizione** $s \xrightarrow{a} s'$, e cioè la probabilitza che eseguendo l'azione $a$ nello stato $s$ si passi allo stato $s'$
- si rappresenta con una distribuzione di probabilità condizionata: $P(s' ~|~ s, a)$, dove $P$ è la probabilità di finire in $s'$ dato che si era in $s$ e si è compiuta l'azione $a$; si tiene conto del trascorso

\- Ad ogni transizione $s \xrightarrow{a} s'$ l'agente riceve un segnale di **reward additivo** $R(s, a, s')$ <font style="color:rgb(174, 174, 174)">(è un concetto equivalente a quello dei costi al netto di un'interpretazione diversa)</font>

- il reward non dipende solo in virtù dello stato di partenza e dell'azione compiuta, ma anche dagli effetti che quest'ultima ha

\- **Orizzonte** $H$ determina per quanti step dura l'MDP: tutto quello che succede dopo $H$ transizioni di stato non importa. $H$ può essere anche infinito.

#### Markovianità

La Markovianità è una proprietà dei processi stocastici che prende il nome dal matematico russo Andrey Markov.

Possiamo pensare ad un processo stocastico come ad una sequenza aleatoria di stati $s_0, s_1, \cdots$ dove $s_t \in S$ è lo stato al tempo $t$. Nel nostro modello questa sequenza è aleatoria perché l'ambiente è stocastico, le azioni hanno esiti certi ma sono descritte in termini probabilistici.

###### Proprietà di Markov

L’esito di un’azione dipende solo dallo stato corrente (e non dagli stati e dalle azioni precedenti)

Questa proprietà è implicitamente codificata nel modello di transizione: $P(s' ~|~ s, a)$ infatti è un modo compatto di scrivere $P(s_{t+1} ~|~ s_t, a_t)$ dove $t$ è il tempo corrente

*[ ...due esempi su questa proprietà... ]*

Grazie alla Markovianità lo **stato presente** racchiude tutte le informazioni necessarie per prendere la miglior decisione sul futuro.

### Soluzione di un MDP

Nei problemi di search cercavamo un **piano** (nel caso in cui il problema fosse un CSP il piano corrispondeva ad un assegnamento di variabili eseguito in un qualsiasi ordine). Nei problemi di adversial search si cercava una **strategia**

La soluzione di un MDP si chiama **policy** ed è definita come una funzione che, dato uno stato, prescrive quale azione l'agente deve compiere: $\pi: S \rightarrow A$

**Attenzione:** la policy è deterministica (non randomizza mai su quale azione prescrivere), ma la sequenza di stati che una policy genera è stocastica per via degli esiti incerti delle azioni.

<div style="display: flex; justify-content: center; align-items: center; margin-bottom:20px">
	<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241114114615666.png" alt="image-20241114114615666" style="zoom:35%;" />
	<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241114114632084.png" alt="image-20241114114632084" style="zoom:35%;" />
</div>

Se ci viene fornita una policy $\pi$ per un particolare MDP, l'agente che la implementa esegue iteratamente questi step:

1. osserva lo stato in cui si trova, detto stato corrente $s$
2. consulta la policy $\pi$ e ottiene l'azione $\pi(s)$ che essa prescrive
3. esegue l'azione $\pi(s)$ e ritorna al punto $1$

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241114115733716.png" alt="image-20241114115733716" style="zoom:35%;" /> È un agente reflex

Definire ed eseguire una policy è facile, ma per definirne una che massimizzi un criterio di qualità è necessario un metodo

Quando bisogna misurare la bontà di una policy, iniziano a sorgere dei problemi poiché non si può riutilizzare lo stesso piano ottimo dei problemi di search:

1. Non ci sono più stati di goal
    - ci sono solo stati terminali sui quali non si dice nulla rispetto alle preferenze dell'agente
    - gli stati terminali possono anche non esserci, e il processo può continuare all'infinito
2. Non ci sono più costi ma reward che sono anche soggetti ad incertezza

###### Idea

Massimizzare il valore atteso della somma dei reward che si ottengono eseguendo la policy $\pi$

La policy $\pi$ genera una qualche sequenza di stati $s_0, s_1, \cdots$ aleatoria che a sua volta corrisponde ad una sequenza di reward $R_0, R_1, \cdots$ anch'essa aleatoria

Maggiore è la somma $U(s_0, s_1, \cdots) = R_0 + R_1 + \cdots$ migliore è la sequenza di stati che si è percorsa

La policy che cerchiamo deve massimizzare il **valore atteso** della somma dei reward rispetto alle sequenze di stati che può generare

Chiameremo questa policy ottima $\pi^*: S \rightarrow A$, ogni altra policy $\pi$ genererà un reward atteso minore o uguale a
										$\pi^* = \max\limits_{\pi} \mathbb{E}_{\pi^*} \left[ U(s_0, s_1, \dots) \right]$





# L14 - 18/11/2024

**[...] Bellman equation**

# L15 - 21/11/2024

**[...] Bellman function**

**[...] Value Iteration**

# L16 - 25/11/2024

##### Policy Extraction

Calcolo della policy ottima a partire dalla state-value function ottima:

$\displaystyle \pi^*(s) = \arg \max \limits_{a} \sum_{s'} P(s'~|~s,a) [R(s,a,s') + \gamma V^*(s')]$

###### Svantaggi

- Procedimento inefficiente in quando ad ogni iterazione, nel caso pessimo, bisogna calcolare $|~S~| \cross |~A~| \cross |~S~|$ termini
- Molti di questi termini si ripetono
- La policy di norma **converge prima della state-value function**

##### Policy Iteration

Si lavora direttamente sulla policy e non sulla state-value function

[...]

###### Recap

Due algoritmi di programmazione dinamica per il calcolo della policy ottima in un MDP:

1. value iteration: ...
2. policy iteration: ...



## Reinforcement Learning

[...]

Il modello, ossia l'MDP $<P, R>$ preso in considerazione, fino ad ora è sempre stato assunto come conosciuto e si è voluto trovare la policy ottima per quel modello.

Ora si vuole trovare la policy ottima in situazioni in cui il modello $< P, R>$ è inizilamente sconosciuto. Questo si fa tramite il **reinforcement learning**.

In questo scenario di modello sconosciuto, eseguire un'azione ha una duplice funzione:

1. svolgere il proprio compito nell'ambiente, cercando di massimizzare il proprio reward (come prima)
2. rivelare le leggi e le regole del modello. Facendo infatti delle azioni si osservano delle transizioni e dei reward ricevuti, e raccogliendo tante osservazioni si può imparare qualcosa sul modello e sulla policy ottima

Sorge però il problema su quali azioni privilegiare:

1. **Exploration**: scegliere quelle che privilegiano l'acquisizione di nuove informazioni del modello
2. **Exploitation**: scegliere quelle che privilegiano le performance rispetto a quanto si è appreso del modello

Generalmente il modello appreso rappresenta solo una stima di quello reale, e di conseguenza fare la cosa ottima nel modello appreso non sarà buono come fare la cosa ottima nel modello reale.

- La differenza di utilità ottenuta tra i due casi si chiama **regret**

### Passive RL

Nell'apprendimento rinforzato passivo si assume che una policy $\pi$ sia data e fissata. Il problema affrontato dall'agente è imparare quanto sia effettivamente buona quella policy $\pi$.

L'agente non deve quindi calcolare una policy ottima, ma deve scoprire quanto sia buona la policy data.

##### Adaptive Dynamic Programming

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241125114342079.png" alt="image-20241125114342079" style="zoom:33%;" />

**Esplorazione**: genera un dataset (training set) fatto da un certo numero di episodi. L'**episodio** è una sequenza di transizioni e reward osservati di lunghezza massima fissata.

- In caso si finisca in uno stato terminale si conclude l'episodio indipendentemente dalla sua lunghezza.

Ogni transizione generata ha la forma $S_1 \xrightarrow{R(S_1, \pi(S_1), S_2)} S_2$

**Stima del modello**: per ogni stato osservato ed azione eseguita durante l'esplorazione si calcolano:

1. $\#(s,a)$: numero di volte in cui l'agente è stato nello stato $s$ ed ha svolto l'azione $a$
2. $\#(s,a,s')$: numero di volte in cui l'agente è stato nello stato $s$, ha svolto l'azione $a$ e si è ritrovato nello stato $s'$

Queste quantità dipendono dalla policy $\pi$ e dal modello delle transizioni, sconosciuto, che determina probabilisticamente gli esiti delle azioni intraprese

**[...]** + esempio



# L17 - 28/11/2024

### Richiamo di statistica

Variabile aleatoria $x$ (l'esito di una misurazione, risultato di un processo complicato): non so quanto valga ma posso osservarla.

$E[x]$ è il valore atteso di questa variabile aleatoria.

**Primo metodo per calcolare il valore atteso**

Si supponga di poter ossevare questa variabile nel tempo. Otteniamo un campione: $x_1, x_2, \cdots, x_{100}$

- tramite la media aritmetica di questi 100 campioni ricavo un possibile valore atteso

$\displaystyle \dfrac{1}{t}\sum_{t=1}^{t}x_t = \overline{x}(t)$ Monte Carlo

Più campioni si hanno, e quindi più si ha esperienza, e più questo nostro valora atteso sarà preciso.

Per applicare questo metodo serve un passo di precomputazione in cui ci si salvano tutti questi campioni, e solo dopo si può applicare l'algoritmo di Monte Carlo

- se mi servono un milione di campioni, mi devo salvare un milione di campioni

###### Secondo metodo "online"

$x_1 \rightarrow \hat\mu_1 = x_1$ 	con $\hat\mu_{1}$ stima al tempo $t=1$

$x_2 \rightarrow \hat\mu_{2} = \dfrac{\hat\mu_{1} + x_2}{2}$	$t = 2$

Questo processo di stima incrementale lavora un campione per volta.

- noi vogliamo che andando avanti in questo processo incrementale la stima converga sempre di più al valore atteso reale.
- È un procedimento iterativo che non richiede di salvarsi tutti i campioni, ma solo la stima al tempo corrente. Questa verrà poi scartata a  discapito della stima al tempo successivo.

$\displaystyle \hat\mu_t = \hat\mu_{t-1} + \alpha (x_t - \hat\mu_{t-1})$

- $x_t - \hat\mu_{t-1}$ rappresenta quanto si discosta la vecchia stima dal valore corrente di $x$
- $\alpha$ è un valore che va da 0 ad 1 e che rappresenta quanto ci si fida delle nuove osservazioni, ossia dei nuovi campioni $x_t$ che arrivano al tempo $t$

$\hat\mu_1 = x_1 \qquad\qquad \hat\mu_2 = \hat\mu_1 + \alpha(x_2 - \hat\mu_1) \qquad\qquad \hat\mu_3 = \hat\mu_2 + \alpha(x_3 - \hat\mu_2) \qquad\qquad \cdots$



**Cosa cambia tra questi due metodi?**

Esistono delle scelte per $\alpha$ tali per cui i due metodi coincidono: è quindi possibile calcolare la media aritmetica anche in maniera iterativa.

Si supponga di scegliere $\alpha = \dfrac{1}{t}: \qquad \hat\mu_t = \hat\mu_{t-1} + \dfrac{1}{t} (x_t - \hat\mu_{t-1}) = \overline{x}(t)$

- è possibile dimostrare questa uguaglianza per induzione **[...]**																																																																																																																														

## Temporal Difference Learning

[...]



# L18 - 02/12/2024

[...] abs

# L19 - 05/12/2024

[...]

# L20 - 09/12/2024

[...] abs

# L21 - 12/12/2024

#### Supervised learning













