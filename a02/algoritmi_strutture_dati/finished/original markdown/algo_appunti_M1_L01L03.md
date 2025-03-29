# Algoritmi e strutture dati

# L01 - 25/09/2024

**Libro di testo**: Algoritmi e strutture dati, McGraw-Hill, 2008

Un algoritmo è un procedimento per la risoluzione di un problema.

- **Sintesi**: dal problema si trova un algoritmo.
- **Analisi**: data una strategia risolutiva, si valuta la sua efficienza.

Le **strutture dati** sono modi organizzati per immagazzinare e gestire dati in modo efficiente. Esse definiscono come i dati vengano salvati in memoria e come possano essere recuperati o manipolati.

- La scelta della struttura dati influisce sull'efficienza computazionale degli algoritmi che la manipolano.

### Algoritmica

L'algoritmica è la parte dell'informatica che si occupa di tutti gli aspetti legati agli algoritmi:

- Progettazione degli algoritmi;
- Studio delle strutture dati da essi utilizzate;
- Analisi della loro efficienza;
- Studio delle limitazioni inerenti e complessità dei problemi;
- Definizione di nuovi modelli di calcolo.

###### Analisi di un algoritmo

Nella progettazione di un algoritmo sono importanti:

- **Correttezza**: l'algoritmo deve risolvere il problema;
- **Efficienza**: l'algoritmo deve risolvere il problema nel minor tempo possibile.

Nella progettazione di un algoritmo è importante tenere conto dell'uso delle risorse: il tempo che ci impiega per operare, lo spazio utilizzato, il come si interfaccia con la rete, il numero di processori usati, il consumo di energia.

- Tutti questi fattori influiscono sull'efficienza dell'algoritmo. Spesso non è possibile adoperare efficientemente tutti questi aspetti, ma bisogna trovare un giusto compromesso.

Studiare l'algoritmica è importante per:

- Aspetto pratico: risolvere problemi tramite l'utilizzo dei computer.

- Aspetto teorico: forniscono delle metodologie che sono utili nelle altre discipline.


###### Problemi difficili

Esistono problemi per cui si conoscono solo algoritmi inefficienti. Questi sono detti problemi difficili. 
Un esempio è il problema del **commesso viaggiatore**:

- Input: $n$ città, distanza tra le varie città.

- Output: il percorso più breve che visiti tutte le città (passando una sola volta per ognuna) e torni al punto di partenza.

Gli algoritmi che risolvono questo problema calcolano le permutazioni delle città: $(n-1)!$ permutazioni.



# L02 - 27/09/2024

## Gli algoritmi

Un algoritmo è un insieme ordinato e finito di passi eseguibili e non ambigui che definiscono un procedimento che termina.

- La descrizione dell'algoritmo deve essere quindi finita.
- Il passo dipende dall'ambito e dal livello di astrazione con cui sto descrivendo un algoritmo.
    - Questi passi devono essere eseguibili e non ambigui: tutto deve essere specificato e nulla può essere lasciato all'interpretazione.
- L'algoritmo deve terminare: non può quindi essere infinito.

Ci sono dei contesti in cui alcune di queste caratteristiche possono essere trascurate, permettendo di uscire quindi da questa definizione stringente.

- In alcuni algoritmi non tutto è scritto, e qualcosa viene lasciato all'esecutore: per esempio gli algoritmi randomizzati.
    - Un esempio possono essere gli algoritmi di calcolo, come l'algoritmo di **Monte Carlo** dove si fa un calcolo approssimato di un integrale di una funzione.
    - Nel **quick sort** si disordinano gli elementi e si sceglie un elemento pivot in modo randomico in modo da evitare il caso peggiore. Si migliorano quindi le prestazioni di un algoritmo.
- Alcuni algoritmi non terminano, come per esempio quelli che regolano i processi industriali.

#### Programma

Un programma è un insieme ordinato e finito di istruzioni (ossia un algoritmo) scritte secondo le regole di uno specifico linguaggio di programmazione.

**Pseudocodice:**

```
ALGORITMO nome_algoritmo(parametri_con_tipo) -> tipo_di_ritorno
    istruzione1
    ...
    istruzioneN
    RETURN valore_di_ritorno
```

#### Visione matematica degli algoritmi

Gli algoritmi possono essere visti come trasformazioni di input in output.

Un algortimo $A$ può essere visto come una funzione $F_{a}: D_{i}\ \rightarrow D_{s}$ dove:

- $D_{i}$ è il dominio delle istanze (gli input del problema)
- $D_{s}$ è il dominio delle soluzioni (gli output del problema)

Un problema $p$ prende in input un'istanza $x∈D_{i}$ e restituisce una soluzione $f(x)∈D_{s}$ 
L'algoritmo $A$ risolve il problema $p$ se e solo se per $∀x∈D_{i}\hspace{7pt} F_{a}(x) = f(x)$

### Sintesi di algoritmi

Dato un problema si vuole ottenere un algoritmo che lo risolva. Alcuni metodi di sintesi sono la ricorsione, la tecnica *divide-et-impera*, la programmazione dinamica e le tecniche *greedy*.

### Analisi di algoritmi

Si valutano:

- **Correttezza**: dato un algoritmo $a$ e un problema $p$, dimostrare che $x$ risolve $p$ ( $∀x∈D_{i} \ \ F_{a}(x) = f(x)$ ).
- **Efficienza**: valutare la quantità di risorse (come tempo e spazio) utilizzate dall'algoritmo; ne si studia perciò la complessità. Dopodiché si cerca di capire se è ulteriormente ottimizzabile.

Per fare l'analisi dell'algoritmo si utilizzano due metodi:

- **Valutazione a posteriori**: si decodifica l'algoritmo in un linguaggio di programmazione (testing) e lo si fa girare. Nel testing subentrano però dei problemi:
  
    - Esistono infiniti ingressi, e con il testing si può solo testare un sottoinsieme di questi ingressi.
    - Costo della codifica: passare dall'algoritmo al programma può essere molto costoso.
    
    La valutazione a posteriori è quindi un metodo insoddisfacente.
    
- **Valutazione a priori**: è una stima teorica in fase di progetto della correttezza e dell'efficienza dell'algoritmo.
    - Questo metodo permette di confrontare soluzioni diverse e di codificare solo quella che si ritiene tramite l'analisi a priori migliore.
    - Si utilizzano degli strumenti matematici.

### Algoritmi per la moltiplicazione

#### Somme iterate

$a,b ≥ 0;\ a \cdot b = a+\dotsc+a\ b$ volte

```
ALGORITMO moltiplicazione(intero a, intero b) -> intero
    prod <- 0 // linea 1																  [1]
    WHILE b > 0 DO																		  [2]
        prod <- prod + a																  [3]
        b <- b - 1																		  [4]
    RETURN prod																			  [5]
```

##### Correttezza

Siano $b_{i}\text{, } prod_{i}$ i valori di $b\text{, } prod$ dopo l'iterazione $i$. Si dimostri il seguente *lemma*: 
sia $b_i = b - i~$ per $i = 0, \dotsc, b \Longrightarrow $ $prod_i = a \cdot i$

**Induzione su $\textbf{i}$**

- **Base**: $i=0$
    $$
    \begin{flalign}
    \quad b_0 = b \hspace{6.6em} & b_0 = b - 0 = b \\
    \quad prod_0 = 0 \hspace{5em} & prod_0 = a \cdot 0 = 0 && 
    \end{flalign}
    $$

- **Induzione**: $i-1 \rightarrow i$
    $$
    \begin{flalign}
    &\quad b_i = b_{i-1}-1 \\
    &\quad prod_i = prod_{i-1} + a \\[5pt]
    &\quad b_i = b_{i-1}-1 = b-(i-1)-1 = b-i+\cancel{1}-\cancel{1} = b-1 \\[-2em]
    &\hspace{6.67em} \text{\small \downarrow} \\[-2em]
    &\hspace{4.9em} \text{\small ipotesi di induzione} \\[-2em]
    &\hspace{9.75em} \text{\small \uparrow} \\[-2em]
    &\quad prod_i = prod_{i-1} + a = a \cdot(i-1) + a = a \cdot i - \cancel{a} + \cancel{a} = a \cdot i
    && \end{flalign}
    $$
    Per $i=b$ si ottiene che $b_b = 0$, e quindi termina l'esecuzione del ciclo while. Viene restituito dall'algoritmo $prod_b = a \cdot b$. Il lemma è stato dimostrato.

##### Complessità

**Tempo**:
se $b=0$ eseguo le linee $1,2,5 \rightarrow T=3$
se $b>0$:

- Le linee $1,5$ sono eseguite una volta $\rightarrow T=2$
- Le linee $3,4$ sono eseguite $b$ volte $\rightarrow T=2b$
- La linea $2$ è eseguita $b{+}1$ volte $\rightarrow T=b + 1$

$T_{tot} = 3b+3 \ \longrightarrow$ la crescita è lineare

**Spazio:** lo spazio è costante dato che dipende sempre da 3 variabili (e non da $a$ e $b$)

#### Moltiplicazione alla russa

$$
\begin{flalign}
& a \cdot b = 2a \cdot \dfrac{b}{2} \quad \longleftarrow \text{divisione in } \mathbb{R} \\[4pt]
& a \cdot b = 
\begin{cases}
2a \cdot \dfrac{b}{2} & \text{se } b \text{ pari} \\[4pt]
2a \cdot \dfrac{b-1}{2} + a & \text{se } b \text{ dispari, } b > 1  \\[3pt]
a & \text{se } b=1
\end{cases} \quad\quad \longleftarrow \text{divisione in } \mathbb{N}
&& \end{flalign}\\[4.6em]
$$

```
ALGORTIMO moltiplicazione(intero a, intero b) -> intero
    prod <- 0																			  [1]
    WHILE b > 0 DO																		  [2]
        IF b è dispari THEN																  [3]
            prod <- prod + a															  [4]
        b <- b/2 //divisione intera														  [5]
        a <- a*2																		  [6]
    RETURN prod																			  [7]
```

*Nota: In questo algoritmo si usano solo variabilli intere ed operazioni su interi*

##### Correttezza

Siano $a_{i}\text{, } b_{i}\text{, } prod_{i}$ i valori di $a\text{, } b\text{, } prod$ dopo l'iterazione $i$. Si dimostri che $a_{i}\ b_{i}+prod_{i} = ab$

**Induzione su $\textbf{i}$**

- **Base**: $i=0$
    $$
    \begin{flalign}
    &\quad i = 0 \\
    &\quad a_0 = a, \quad b_0 = 0, \quad \text{prod}_0 = 0 \\
    &\quad a_0 \cdot b_0 + \text{prod}_0 = ab + 0 = ab \\[-2em]
    && \end{flalign}
    $$

- **Induzione**: $i-1 \rightarrow i$
    $$
    \begin{flalign}
    &\quad b_{i} = \left\lfloor \dfrac{b_{i-1}}{2} \right\rfloor = 
    \begin{cases}
    \dfrac{b_{i-1}}{2} & \text{se } b_{i-1} \text{ è pari} \\
    \dfrac{b_{i-1} - 1}{2} & \text{se } b_{i-1} \text{ è dispari}
    \end{cases} \\[10pt]
    
    &\quad \text{prod}_{i} = 
    \begin{cases}
    \text{prod}_{i-1} & \text{se } b_{i-1} \text{ è pari} \\
    \text{prod}_{i-1} + a_{i-1} & \text{se } b_{i-1} \text{ è dispari}
    \end{cases} \\[10pt]
    
    &\quad \begin{cases}
    \text{se } b_{i-1} \text{ è pari:} & a_{i} b_{i} + \text{prod}_{i} = \cancel{2} a_{i-1} \dfrac{b_{i-1}}{\cancel{2}} + \text{prod}_{i-1} = a_{i-1} b_{i-1} + \text{prod}_{i-1} \\
    \text{se } b_{i-1} \text{ è dispari:} & a_{i} b_{i} + \text{prod}_{i} = \cancel{2} a_{i-1} \dfrac{b_{i-1}}{\cancel{2}} + \text{prod}_{i-1} + a_{i-1} = a_{i-1}(b_{i-1} - 1) + \text{prod}_{i-1} + a_{i-1} = \\
    & = a_{i-1} + b_{i-1} - \cancel{a_{i-1}} + \text{prod}_{i-1} + \cancel{a_{i-1}} = a_{i-1} b_{i-1} + \text{prod}_{i-1}
    \end{cases} && \\
    \end{flalign}
    $$
    In entrambi i casi si ottiene:
    $$
    \begin{flalign}
    &a_{i}\ b_{i} + \text{prod}_{i} = a_{i-1}\ b_{i-1} + \text{prod}_{i-1} = ab \\[-2em]
    &\hspace{15.07em} \text{\small \downarrow} \\[0em]
    &\hspace{11.5em} \text{\small ipotesi di induzione} && 
    \\[0pt]
    \end{flalign}
    $$
    L'esecuzione dell'algoritmo termina quando $b=0$. Sia $u$ il numero dell'iterazione dopo la quale $b=0$, allora $a_{u}\ b_{u} + prod_{u} = a \cdot b$. Ma se $b_{u} = 0$, allora $prod_{u} = a \cdot b$

##### Complessità

**Tempo:**
Si consideri $u$ il numero di iterazioni effettuate

- Le linee $1, 7$ vengono eseguite $1$ volta $\rightarrow T = 2$
- La linea $2$ viene ripetuta $u{+}1$ volte $\rightarrow T = u{+}1$
- Le linee $3, 5, 6$ vengono eseguite $u$ volte $\rightarrow T = 3u$
- La linea 4 viene eseguita al più $u$ volte $\rightarrow T ≤ u$

$T_{tot} ≤ 5u + 3$

|   $\bf b$    | $\text{0}$ | $\text{1}$ | $\text{2}$ | $\text{3}$ | $\text{4}$ | $\text{5}$ | $\text{6}$ | $\text{7}$ | $\text{8}$ | $\dotsc$ |
| :----------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :------: |
| $\textbf{u}$ | $\text{0}$ | $\text{1}$ | $\text{2}$ | $\text{2}$ | $\text{3}$ | $\text{3}$ | $\text{3}$ | $\text{3}$ | $\text{4}$ | $\dotsc$ |

Da ciò si ricava che $u=\lfloor\ \log_{2}\ b\ \rfloor + 1$

$T(a,b) ≤ 5\ (\ \lfloor\ \log_{2}b\ \rfloor + 1)+3 = 5\ \lfloor\ \log_{2}\ b\ \rfloor +8$

- La crescita del tempo non dipende da $a$ ed è logaritmica

**Spazio:** lo spazio è costate: non dipende da $a$ e da $b$ ma si utilizzano solo 3 variabili

#### Crescite lineari e logaritmiche

|                    $\bf b$                    | $\textbf{1}$ | $\textbf{2}$ | $\dotsc$ | $\textbf{8}$ | $\dotsc$ | $\textbf{1000}$ | $\dotsc$ | $\textbf{1ॱ000ॱ000}$ | $\dotsc$ |
| :-------------------------------------------: | :----------: | :----------: | :------: | :----------: | :------: | :-------------: | :------: | :------------------: | :------: |
|               $T(a, b) = 3b +3$               |  $\text{6}$  |  $\text{9}$  | $\dotsc$ | $\text{27}$  | $\dotsc$ |  $\text{3003}$  | $\dotsc$ |  $\text{3ॱ000ॱ003}$  | $\dotsc$ |
| $T(a, b) = 5\ \lfloor\ log_{2}b\ \rfloor + 8$ |  $\text{8}$  | $\text{13}$  | $\dotsc$ | $\text{23}$  | $\dotsc$ |   $\text{53}$   | $\dotsc$ |     $\text{103}$     | $\dotsc$ |

C'è quindi una sostanziale differenza tra una crescita lineare ed una logaritmica.



# L03 - 30/09/2024

## Calcolo della potenza $x^{y}$ 

Dati $x, y ≥ 0$ interi, bisogna trovare un algoritmo che calcoli $x^{n}$.

### Prodotti iterati

$x^{y} = x\ \dotsc\ x\ \text{per}\ y\ \text{volte}$

```
ALGORITMO potenza(intero x, intero y) -> intero
	power <- 1																			  [1]
	WHILE y > 0 DO																		  [2]
		power <- power * x																  [3]
		y <- y - 1																		  [4]
	RETURN power																		  [5]
```

**Correttezza**: dopo l'iterazione $i$ si ha che $y_{i} = y - i$ e $power_{i} = x^{i}$. Si fanno $y$ iterazioni e il risultato finale è $x^{y}$

**Complessità** (è analoga a quella della moltiplicazione a somme iterate): 

- Numero di righe di codice: $T(x,y) = 3y+3$
- Spazio: 3 variabili (i due parametri e la variabile power)

### Soluzione ricorsiva

$x^{y} = x^{\scriptsize {\normalsize 2}\dfrac{y}{2}} = (x^{\scriptsize \dfrac{y}{2}})^{2} \quad \longleftarrow \text{divisione in } \mathbb{R} \text{ con } y \in \mathbb{R} $ 

$$
\begin{flalign}
{x^y} = \begin{cases}
\text{1} & \text{se y = 0} \\[5pt]
(x^{\scriptsize \dfrac{y}{2}}) ^ {2} & \text{se y > 0 } \land \text{ y pari} \\[5pt]
(x^{\scriptsize \dfrac{y-1}{2}}) ^ {2}\ x & \text{se y > 0 } \land \text{ y dispari}
\end{cases} \quad\quad \longleftarrow \text{divisione in } \mathbb{N} \text{ con } y \in \mathbb{N} &&
\end{flalign}\\[3.0em]
$$

```
ALGORITMO potenza(intero x, intero y) -> intero
	IF y = 0 THEN																		  [1]
		RETURN 1																		  [2]
	ELSE
		power <- potenza(x, y/2) //divisione intera										  [3]
		power <- power * power															  [4]
		IF y è dispari THEN																  [5]
			power <- power * x															  [6]
		RETURN power																	  [7]
```

*Nota: in questo algoritmo si usano solo variabilli intere ed operazioni su interi*

##### Correttezza

Si dimostri che $~\text{∀x, y ≥ 0\ \ potenza(x, y)}$ restituisce $x^{y}$

**Induzione su $\textbf{y}$**

- **Base**: $y=0$
    $$
    \begin{flalign}
    \quad \text{restituisce 1 e } x^{y} = x^{0} = 1 \\[-3em]
    && \end{flalign}
    $$
    
- **Induzione**: $< y \rightarrow y \text{\scriptsize \quad(si suppone che sia vera per tutti i valori minori di un certo y)}$
  
    - *Caso $y$ pari*
    
    $$
    \begin{flalign}
    &\quad \quad \quad (x^{\scriptsize \dfrac{y}{2}}) ^ {\large\ 2} = x^{y} \rightarrow \text{risultato} \\
    &\quad \hspace{2.75em} \text{\small \downarrow} \\
    &\quad \hspace{2em} \text{\small risultato di potenza(x, y/2) } \text{\scriptsize \; (per ipotesi di induzione)} &&
    \end{flalign}\\[2.1em]
    $$
    
    - *Caso $y$ dispari*
    
    $$
    \begin{flalign}
    &\quad \quad \quad \text{potenza(} x, y/{\small 2} \text{)} = x^{\large \lfloor \scriptsize \dfrac{y}{2} \large \rfloor} = x^{\scriptsize\dfrac{y \text{ - } 1}{2}} \\
    &\quad \hspace{9.17em} \text{\small \downarrow} \\
    &\quad \hspace{5.9em} \text{\small per ipotesi di induzione} && \\
    &\quad \quad \quad (x^{\scriptsize \dfrac{y \text{ - } 1}{2}})^{\text{\normalsize\ 2}}=x^{\normalsize\ y \text{ - } 1}\\ 
    &\quad \quad \quad x^{\normalsize\ y \text{ - } 1}\ x = x^{\normalsize\ y}
    &&
    \end{flalign}
    $$

##### Complessità

###### **Tempo**

Sia $T(x, y)$ il tempo misurato come numero di righe di codice che vengono eseguite su input $x,y$

- $y=0$ vengono eseguite le linee $1,2 \rightarrow T=2$ 
- $y > 0$ :
    - vengono eseguite le linee $1, 3, 4, 5, 7 \rightarrow T = 5$
    - viene eseguita la linea $6$ per $y$ dispari $\rightarrow T ≤ 1$ 
    - la linea $3$ esegue una chiamata ricorsiva con un suo tempo $\rightarrow T(x, \lfloor \dfrac{y}{2} \rfloor)$

$$
\begin{flalign}
& T_{tot} ≤ 6 + T(x, \lfloor \dfrac{y}{2} \rfloor) \\
& T(x, y) = \begin{cases}
2 & \text{se } y = 0 \\
6 + T(x, \lfloor \dfrac{y}{2} \rfloor) & \text{altrimenti}
\end{cases} \quad \longrightarrow \text{equazione di ricorrenza}
&& \end{flalign}
$$

**Risoluzione dell'equazione di ricorrenza** *(si supponga per semplicità che $y$ sia una potenza di 2)*:
$$
\begin{flalign}
T_{tot} & = 6 + T(x, \lfloor \dfrac{y}{2} \rfloor) \\
& = 6 + 6 + T(x, \dfrac{y}{2^2}) \\
& = 6 + 6 + 6 + T(x, \dfrac{y}{2^3}) = \dotsc \\
& = 6k + T(x, \dfrac{y}{2^k}) \\
& \hspace{-1.6em} \small \text{Bisogna fare in modo di ricondursi al caso base } y=0 \text{ partento dall'equazione di sopra}\\[-2em]
& \hspace{-1.6em} \small \text{Dato che con } k = \log_2 y \Rightarrow y = 2^k \Rightarrow \dfrac{y}{2^k}=1, 
\text{ scelgo allora } k= 1 + \log_2{y}:\quad  \dfrac{y}{2^k}= \dfrac{y}{2^{\log_2{y}~+1}} = \lfloor~ \dfrac{1}{2} \dfrac{y}{2^{\log_2{y}}} ~\rfloor = \lfloor~ \dfrac{1}{2} ~\rfloor \dfrac{\cancel{y}}{\cancel{y}} = 0 \\
& = 6~(1+ \log_2{y}) + T(x, 0) \scriptsize ~~ \leftarrow \text{caso base}\\
& = 6 + 6\log_2{y} + 2 \\
& = 8 + 6\log_2{y}
&& \end{flalign}
$$

La crescita del tempo è perciò logaritmica: $T(x, y) \le 6\log_2{y} + 8$

###### **Spazio**

La ricorsione viene gestita utilizzando una struttura che si chiama **stack della ricorsione**, in cui vengono impilate le chiamate attive.

Associata ad ogni chiamata ricorsiva c'è un **record di attivazione**, ossia la struttura che contiene i dati della singola chiamata. Quando si chiama l'algoritmo, vengono aggiunte sulla pila dei record di attivazione per ciascuna chiamata. La dimensione di un record di attivazione è costante.

**Altezza della pila**
$$
\begin{flalign}
& H(x, y) = \begin{cases}
1 & \text{se } y = 0 \\
1 + H(x, \lfloor \dfrac{y}{2} \rfloor) & \text{altrimenti } 
\end{cases}
&& \end{flalign}
$$
Questa equazione si risolve come quella precedente, e si ottiene: $H(x, y) = 2+ \log_2{y}$
Essendo in questo caso la dimensione del record di attivazione pari a 3 variabili, si trova che lo spazio (inteso come numero di variabili) corrisponde a $3(2+ \log_2{y})$

<div style="display: flex; width: 90%; border: 0px solid green; padding: 10px; margin-bottom:-10px; margin-top:-5px; align-items:center">
	<div style="margin-right:-5px">
		<div style="text-align: center; font-size: 60px; color: gray; transform: rotate(30deg); margin-top:-4px">&#10559;</div>
		<div style="text-align: center; font-size: 60px; color: gray; transform: rotate(30deg); margin-top:-45px">&#10559;</div>
		<div style="text-align: center; font-size: 60px; color: gray; transform: rotate(30deg); margin-top:-45px">&#10559;</div>
	</div>
	<div>
      <div style="border: 2px solid gray; padding: 10px; margin: 0px; position: relative; display: flex; justify-content: center; align-items: center; text-align: center; width:180px">
          <div>potenza(x,6)</div>
      </div>
      <div style="border: 2px solid gray; padding: 10px; margin: 0px; margin-top: -2px; position: relative; display: flex; justify-content: center; align-items: center; text-align: center;">
          <div>potenza(x,3)</div>
      </div>
      <div style="border: 2px solid gray; padding: 10px; margin: 0px; margin-top: -2px; position: relative; display: flex; justify-content: center; align-items: center; text-align: center;">
          <div>potenza(x,1)</div>
      </div>
      <div style="border: 2px solid gray; padding: 10px; margin: 0px; margin-top: -2px; position: relative; display: flex; justify-content: center; align-items: center; text-align: center;">
          <div>potenza(x,0)</div>
      </div>
	</div>
    <div style="margin-left:-5px">
		<div style="text-align: center; font-size: 60px; color: gray; transform: rotate(210deg); margin-top:4px">&#10559;</div>
		<div style="text-align: center; font-size: 60px; color: gray; transform: rotate(210deg); margin-top:-44px">&#10559;</div>
		<div style="text-align: center; font-size: 60px; color: gray; transform: rotate(210deg); margin-top:-42px">&#10559;</div>
	</div>
    <div style="width:100%; margin-left: 30px; ">
       <p style="margin-top:-3px"><i>esempio dell'utilizzo dello stack per un algoritmo che calcola la potenza 6-esima di un qualsiasi numero x
           </i></p>
    </div>
</div>

*Sia il tempo che lo spazio di questo algoritmo crescono come un logaritmo di $y$*

#### Algoritmo alternativo

```
ALGORITMO potenza(intero x, intero y) -> intero
    power <- 1																			  [1]
    IF y > 0 THEN																		  [2]
        power <- potenza(x, y/2) //divisione intera										  [3]
        power <- power * power															  [4]
        IF y è dispari THEN																  [5]
            power <- power * x															  [6]
    RETURN power																		  [7]
```

- Le linee $1, 2, 7$ vengono eseguite $1$ volta $\rightarrow T = 3$
- Le linee $3, 4, 5$ vengono eseguite $1$ volta $\rightarrow T = 3$
- La linea $6$ viene seguita $≤1$ volta $\rightarrow T ≤ 1$ 
- Chiamata ricorsiva su linea $3$ $\rightarrow T(x, \lfloor \dfrac{y}{2} \rfloor)$

$$
\begin{flalign}

& T(x, y) ≤ \begin{cases}
3 & \text{se } y = 0 \\
7 + T(x, \lfloor \dfrac{y}{2} \rfloor) & \text{altrimenti}
\end{cases} \quad \longrightarrow \text{equazione di ricorrenza} 
&& \end{flalign}
$$

$$
\begin{flalign}
T(x, y) \leq 7 \log_{2} y + 10 &&
\end{flalign}
$$

*Attenzione:*
*`power <- potenza(x, y/2); power <- power * power` e `power <- potenza(x, y/2) * potenza(x, y/2)` non sono la stessa cosa: l'equazione di ricorrenza cambia poiché si vanno a fare due chiamate ricorsive al posto di una.*

### Potenza alla russa

```
ALGORITMO potenza(intero x, intero y) -> intero
	power <- 1																			[1]
	WHILE y > 0 DO																		[2]
		IF y è dispari THEN																[3]
			power <- power * x															[4]
		y <- y/2 //divisione intera														[5]
		x <- x*x																		[6]
	RETURN power																		[7]
```

##### Correttezza

Siano $x_i, y_i, power_i$ i valori di $x, y, power$ dopo l'iterazione $i$. Si dimostri che $x_i^{y_i} \cdot power_i = x^y$

La dimostrazione si fa per induzione (simile a quello della moltiplicazione alla russa), ma intuitivamente al termine dell'esecuzione $y_i$ varrà $0$, perciò $x_i^{y_i}$ varrà $1$ e di conseguenza il valore finale di $power$ sarà proprio $x^y$

##### Complessità

**Tempo:**
Si consideri $u$ il numero di iterazioni effettuate

- Le linee $1, 7$ vengono eseguite $1$ volta $\rightarrow T = 2$
- La linea $2$ viene ripetuta $u+1$ volte $\rightarrow T = u+1$
- Le linee $3, 5, 6$ vengono eseguite $u$ volte $\rightarrow T = 3u$
- La linea 4 viene eseguita al più $u$ volte $\rightarrow T ≤ u$

$T_{tot} ≤ 5u + 3$

Si ricava che $u=\lfloor\ \log_{2}\ y\ \rfloor + 1$ *(rivedere moltiplicazione alla russa)*

$T(x,y) ≤ 5\ (\ \lfloor\ \log_{2}y\ \rfloor + 1)+3 = 5\ \lfloor\ \log_{2}\ y\ \rfloor +8 = \mathcal{O}(\log y)$

- La crescita del tempo non dipende da $x$ ed è logaritmica

**Spazio:** lo spazio è costate: non dipende da $x$ e da $y$ ma si utilizzano solo 3 variabili: $\mathcal{O}(1)$

#### Calcolo potenza

**[...]** 



***

## Formule Utili

###### 1. Formula di Gauss per la somma dei primi $n$ numeri interi:

$$
\begin{flalign}
\sum_{i=1}^{n} i = \frac{n(n + 1)}{2}
&& \end{flalign}
$$

**2. Somma delle prime $k$ potenze di 2:**
$$
\begin{flalign}
\sum_{i=0}^{k-1} 2^i = 2^k - 1
&& \end{flalign}
$$

**3. Operazioni sui numeri binari:**
$11010_2 = n \quad 110100_2 = 2n \quad$ aggiungi uno zero a destra per raddoppiare un numero binario

**4. Problema**: Trovare il più piccolo $N$, potenza di 2, tale che  $N \geq n$

1. Converto $n$ in binario
2. Raddoppio il numero (tramite uno shift a sinistra)
3. Imposto tutti i bit a zero, tranne quello più a sinistra

*Osservazione: Per ogni intero $n$, esiste una potenza di 2 $N$ tale che $n \leq N \leq 2n$*
