# L19 - 08/11/2024

## Grafo

Un grafo è rappresentato dalla coppia $G = (V, E)$, dove $V$ è un insieme finito di nodi o vertici, ed $E \sube V \cross V$ è l'insieme di archi (lati o spigoli).

I grafi si dividono i due famiglie: 

- **non orientati**, in cui $E$ è simmetrica: gli archi non hanno quindi una direzione specifica
    *Esempio*: $V = \{1, 2, 3, 4\} \quad E = \{(1,2), (2,1), (1,3), (3,1), (3,4),(4,3), (1,4), (4,1) \}$
- **orientati** o diretti, in cui $E$ non è simmetrica: gli archi hanno quindi una direzione (un arco da $v$ a $w$ è diverso da un arco da $w$ a $v$)
    *Esempio*: $V = \{1, 2, 3, 4\} \quad E = \{(1,2), (1,3), (2,4), (4,3), (3,1)\}$

<div style="display: flex; justify-content: center; align-items: center;">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241108085912104.png" alt="image-20241108085912104" style="zoom:17%;"/>
   <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241108090124784.png" alt="image-20241108090124784" style="zoom:32%;"/>
</div>
##### Definizioni per i grafi

- $(x,y) \in E \Rightarrow (x,y)$ è incidente su $x$ e su $y$
- se $(x,y)$ esce da $x$ ed entra in $y$, allora $y$ è adiacente a $x$
- vicini di $v \in V$: vertici adiacenti a $v$

- **Grado** $\delta(v)$ di un vertice $v$: #archi incidenti su $v$

​	$\displaystyle \sum_{v \in V}{\delta (v) = 2m}$ dove $m$ è il numero di vertici

​	$\delta_{in}(v)$ grado in ingresso
​	$\delta_{out}(v)$ grado in uscita
​	$\delta(v) = \delta_{in}(v) + \delta_{out}(v)$

​	$\displaystyle \sum_{v \in V}{\delta_{in}(v) = m = \displaystyle \sum_{v \in V}{\delta_{out}(v)}}$

- **Cammino** da $x$ a $y$ $(x, y \in V)$:
    sequenza di vertici $v_0, v_1, \cdots, v_k \in V ~|~ v_0 = x, v_k = y \land (v_{i-1}, v_i) \in E ~\text{ per } i=1,\cdots, k$
    - lunghezza del cammino = # archi ($~k~$)
    - cammino **semplice**: non contiente vertici ripetuti

- $y$ è raggiungibile da $x$ se esiste un cammino da $x$ a $y$
    *nel grado orientato di sopra 7 è raggiungibile da 1 ma 1 non è raggiungibile da 7*

- **Ciclo**: cammino da un vertice $v$ a $v$ stesso
    - Ciclo semplice: solo il vertice iniziale è ripetuto, alla fine

- **Catena** tra $x$ e $y$ $(x, y \in V)$:
    sequenza di vertici $v_0, v_1, \cdots, v_k \in V ~|~ v_0 = x, v_k = y \land (~(v_{i-1}, v_i) \in E \lor (v_i, v_{i-1}) \in E ~) ~\text{ per } i=1,\cdots, k$
    - si chiama **circuito** se $x = y$

Un grafo si dice **connesso** se tra ogni coppia di vertici esiste una catena
Un grafo si dice **fortemente connesso** se tra ogni coppia di vertici esiste un cammino

$G' = (V', E')$ è un **sottografo** di $G=(V,E)$ quando $V' \sube~ V$ e $~E' \sube E \cap (V' \cross V')$
$G'$ è un **sottografo indotto** da $V'$ quando $E' = E \cap (V' \cross V')$

Una componente fortemente connessa è un sottografo indotto **fortemente connesso massimale** (ossia non esiste un altro sottografo fortemente connesso che lo contieni come sottoinsieme). 

- Le componenti fortemente connesse formano una **partizione** del grafo

**Circuito Hamiltoniano**
È un circuito che passa per ogni vertice del grafo una e una sola volta.

- È un problema $NP$-completo, ossia difficile da risolvere efficientemente

**Circuito Euleriano**
È un circuito che passa per ogni arco del grafo una e una sola volta. 

**I punti di Königsberg**

<div style="text-align: center;">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241108093552801.png" alt="image-20241108093552801" style="zoom:35%;"/>
</div>
Esiste un circuito euleriano che attraversa tutti i ponti? No, non si riesce a trovare

**Teorema**: esiste un circuito euleriano se e solo se $\forall v ~ \delta(v)$ è pari

### Albero

Un **albero** è un grafo non orientato, connesso e privo di cicli. Una **foresta** è un insieme di alberi.

###### Proprietà 1

Sia $G = (V, E)$ un grafo non orientato. Questo è un albero se e solo se tra ogni coppia di vertici esiste uno e un solo cammino

###### Proprietà 2

Sia $G = (V, E)$ un albero. Allora #$E$ = #$V -1$   <font style="color:rgb(174, 174, 174)">(il numero di archi è uguale al numero di vertici meno uno)</font>

**Dimostrazione** per induzione su $n = \#V$

- **Base:** $n = 1$
    si ha $1$ solo vertice e di conseguenza $0$ possibili archi

- **Induzione**:  $n \gt 1$
    scelgo un vertice $x$ qualunque. Eliminando $x$ e i suoi archi incidenti dal grafo si ottiene una foresta di di $k$ alberi: $G_1 = (V_1, E_1),\;\; G_2(V_2, E_2),\;\; \cdots, \;\; G_k = (V_k, E_k)$

###### Proprietà 3

Sia $G = (V, E)$ non orientato e connesso. Se $\# E = \# V - 1$ allora $G$ è un albero

**Dimostrazione per assurdo**

Se $G$ non è un albero $\Rightarrow$ $G$

##### Teorema

Dalle proprietà $2$ e $3$ deriva questo teorema:

Un grafo $G = (V, E)$ non orientato e connesso è un albero se e solo se $\#E = \#V-1$

##### Albero ricoprente

Dato $G = (V, E)$ un grado non orientato connesso, un albero ricoprente *(o di supporto / spanning tree)* di $G$ è un albero $G' = (V', E')$ con $V' = V$ e $E' \sube E$



La **cricca** (clique) è un grafo non orientato completo
La **cricca in un grafo** è un sottografo completo

<div style="text-align: center;">
	<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241108102054148.png" alt="image-20241108102054148" style="zoom:33%;"/>
</div>



# L20 - 11/11/2024

[...]

Rappresentazione dei grafi:

- lista di incidenza
- lista di adiacenza

- matrice di incidenza
- matrice di adiacenza

- visita in ampiezza
- visita in profondità

# L21 - 13/11/2024

### Grafi pesati (sugli archi)

$G = (V, E)~$ grafo; $\quad \omega:E \rightarrow \mathbb{R}~$ funzione peso

<div style="text-align: center;">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241113084454187.png" alt="image-20241113084454187" style="zoom:25%; margin-bottom:-60px" />
</div>
**Alcuni problemi**:
Cammini minimi, commesso viaggiatore, albero ricoprente minimo (grafi non orientati). Tutti questi problemi rientrano nei problemi di ottimizzazione.

### Problemi di ottimizzazione

Ora illustreremo due esempi di problemi di ottimizzazione

#### Colorazione di grafi

**Istanza**: Grafo non orientato $G = (V, E)$
**Problema**: trovare il minimo numero di colori da attribuire ai vertici di $G$ in modo che vertici adiacenti abbiano colori differenti

<div style="text-align: center;">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241113085024150.png" alt="image-20241113085024150" style="zoom:33%; margin-top:-60px; margin-bottom:-30px" />
</div>

**Colorazione**: $\mathcal{c}: V \rightarrow \text{Colori} ~|~ (x,y) \in E \Rightarrow \mathcal{c}(x) \not = \mathcal{c}(y)$	*(vincolo)*
**Obiettivo**: minimizzare $\#\text{Imm}(\mathcal{c})$

**Soluzione ammissibile**: vertici adiacenti hanno colori diversi
**Soluzione ottima**: soluzione ammissibile con numero di colori minimo

( Per i grafi planari è stato dimostrato negli anni '70 che bastino 4 colori )

#### Zaino monodimensionale

**Istanza**: zaino di altezza $h$, $k$ contenitori $c_1, c_2, \cdots, c_k$ di altezza $h_1, h_2, \cdots, h_k$
**Problema**: scegliere quali contenitori collocare nello zaino, in modo da riempirlo il più possibile

**Soluzione ammissibile**: sottoinsieme $\displaystyle S \sube \{c_1, c_2, \cdots, c_k \} ~|~ f(s) \le h \text{ con } f(s) = \sum_{c_i \in S} h_i$	*(vincolo)*
**Soluzione ottima**: sottoinsieme ammissibile $S^*$ tale che $f(S^*) \ge f(S)\;\; \forall S$ ammissibile

### Tecnica Greedy

$\mathcal{P}$ problema di ottimizzazione. Dato $C$ insieme di candidati trovare $S \sube C$ ottima

###### Strategia

- Inizialmente $S \leftarrow \varnothing$
- Ad ogni passo:
    - prevelo da $C$ l'elemento $x$ "migliore"
    - se $S \cup \{x\}$ è ammissibile aggiungo $x$ ad $S$
- Termino quando ho esaminato tutti i candidati

**Epsansione**

- **Soluzione ammissibile**: soddisfa i vincoli del problema
- **Scelta dell'ottimo locale**: tra tutti i candidati disponibili scelgo quello che al momento appare migliori
- **Scelta irrevocabil**e: non si torna più sui precedenti

```
ALGORITMO greedy(insieme C) -> soluzione
	S <- Ø
	WHILE C != Ø DO
	│	x <- seleziona(C) //elemento migliore al momento
	│	C <- C \ {x} //C senza x
	│	IF S ∪ {x} è ammissibile THEN
	│	│	S <- S ∪ {x}
	RETURN S
```



#### Zaino monodimensionale

Ora applicheremo la tecnica greedy sullo zaino monodimensionale.
$C = \{c_1, c_2, \cdots, c_k \}$ dove i candidati sono i contenitori

**Strategia greedy**: ispezioniamo i contenitori in ordine di altezza, dal più alto al più basso

- "seleziona" sceglie il contenitore più alto

**Esempio**:

[...]

#### Zaino con valori

**Istanza**: sacco che può portare al massimo peso $P$, $k$ oggetti $c_1, c_2, \cdots, c_k$ di peso $p_1, p_2, \cdots, p_k$ e valore $v_1, v_2, \cdots, v_k$ rispettivamente
**Problema**: scegliere quali oggetti collocare nel sacco, in modo da massimizzare il valore totale, evitando che però il sacco si rompa

**Obiettivo**: guadagnare il più possibile
**Vincolo**: non superare la capacità del sacco

$C = {c_1, c_2, \cdots, c_k}$ candidati
$\displaystyle S \sube C \rightarrow val(S) = \sum_{c_i \in S} v_i \quad peso(S) = \sum_{c_i \in S} p_i$

**Soluzione ammissibile**: $S \sube C$ è ammissibile se $peso(S) \le P$
**Soluzione ottima**: $S^* \sube C$ è ottima se: 

1. $S^*$ è ammissibile; 
2. $\forall S$ ammissibile $val(S^*) \ge val(S)$

##### Tecnica greedy

Ispeziona gli oggetti in ordine di valore, e "selezione" sceglie l'oggetto di maggior valore

[...]



****

### Albero ricoprente minino

**Albero**: grafo non orientato, connesso e privo di cicli.
**Proprietà**: $G = (V, E)$ non orientato e connesso è un albero se e solo se #$E$ = #$V-1$

La **foresta** è un insieme di alberi. Ricordarsi la definizione di **albero ricorrente**.

##### Problema

Dato $G = (V, E)$ non orientato connesso con una funzione peso $\omega: E \rightarrow \mathbb{R}$ trovare un albero ricoprente $T = (V, E_T)$ di peso minimo.

Dato $\displaystyle G' = (V, E') \text{ con } E' \sube E: \quad \omega(G') = \sum_{e \in E'} \omega(e)$

**Vincoli**: trovare un albero ricoprente di $G$

**Obiettivo**: [...] *me lo son perso*

<div style="text-align: center;">
	<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241113100007381.png" alt="image-20241113100007381" style="zoom:40%; margin-bottom:-40px" />
</div>

#### Strategia greedy

**Inizialmente**: 
	$T = (V, \varnothing)$
	$C = E~$ insieme dei candidati

**Ad ogni passo**:
prelevo da $C$ l'arco di peso minimo, lo aggiugno a $T$ se non forma cicli con gli archi già scelti

```
ALGORITMO Kruskal(Grafo G = (V, E, ω)) -> albero
	ordina E in maniera non decrescente in base ai pesi
	T <- (V, Ø)
	FOR EACH (x,y) ∈ E secondo l'ordine DO
	│	IF x e y non sono connessi in T THEN
	│	│	aggiungi a T l'arco (x,y)
    RETURN T
```

**Teorema**: L'algoritmo di Kruskal trova un albero ricoprente di peso minimo *(no dimostrazione)*

###### Esempio

[...]

# L22 - 15/11/2024

###### Esempio

<div style="display: flex; justify-content: center; align-items: center; margin-bottom:20px">
	<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241115084239133.png" alt="image-20241115084239133 L" style="zoom:15%;" />
    <div style="width:60px"></div>
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241115084817889.png" alt="image-20241115084817889" style="zoom:15%;" />
</div>

##### Implementazione

Durante l'implementazione, si utilizza una struttura di supporto in cui teniamo traccia delle varie partizioni
$$
\{A\}, \cancel{\{B\}}, \{C\}, \cancel{\{D\}}, \cancel{\{E\}}, \cancel{\{F\}}, \cancel{\{G\}} \\
\cancel{\{B,E\}}, \cancel{\{D,F\}} \\
\cancel{\{D, F, G\}} \\
\{B, E, F, F, G\}
$$
Implementazione dell'algoritmo di Kruskal tramite **UNION/FIND**

```
ALGORITMO Kruskal(Grafo G = (V, E, ω)) -> albero
	ordina E in maniera non decrescente in base ai pesi		[1]
	T <- (V, Ø)
	FOR EACH vertice v ∈ V DO makeSet(v)					[2]
	FOR EACH (x,y) ∈ E secondo l'ordine DO					[3]
	│	T_x <- FIND(x)										[3a]
	│	T_y <- FIND(y)										[3a]
	│	IF T_x != T_y THEN
	│	│	UNION(T_x, T_y)									[3b]
	│	│	aggiungi a T l'arco (x,y)
    RETURN T
```

###### Complessità temporale

$n = \# V, \quad m = \#E$

Noi qui scegliamo il QuickUnion con bilanciamento in altezza. Si riportano le complessità delle operazioni:
MakeSet $\mathcal{O}(1)$, Find $\mathcal{O}(\log n)$, Union $\mathcal{O}(1)$

**[1]** Heapsort $\rightarrow \mathcal{O}(m \log m)$
**[2]** Predisposizione di $T$ e makeSet $\rightarrow \mathcal{O}(n)$
**[3]** Ciclo sugli archi $\rightarrow m \text{ iterazioni}$
	**[3a]** Per ogni iterazione si fanno due Find $\rightarrow \mathcal{O}(m \log n)$
	**[3b]** #union = $n-1$ $\rightarrow \mathcal{O}(n)$

$T_{tot} = \mathcal{O}(m \log m) + \mathcal{O}(n) + \mathcal{O}(m \log n) + \mathcal{o}(n)$

Ricordando che $G$ connesso $\Rightarrow$ $n - 1 \le m \le n^2$
$$
\begin{flalign}
& \mathcal{O}(m \log m) + \mathcal{O}(n) + \mathcal{O}(m \log n) + \mathcal{o}(n) \le
\mathcal{O}(m \log n^2) + \mathcal{O}(m \log n) = \mathcal{O}(m \log n) \\
& \hspace{20em} \small 2m \log n
&&\end{flalign}
$$
Utilizzando RadixSort e QuickUnion con compressione di cammino si può raggiungere un tempo di $\mathcal{O}(m \log^* n)$

#### Strategia greedy alternativa

Algoritmo di Prim

**Inizialmente**:
$T$: albero costruito da un unico vertice

**Ad ogni passo**:
Si espande $T$ aggiungendo l'arco $(x,y)$ di peso minimo con un vertice in $T$ e l'altro non in $T$

```
ALGORITMO Prim (Grafo G = (V, E, ω)) -> albero
	T <- albero costruito da un unico vertice s ∈ V
	WHILE T ha meno di n nodi DO
	│	sia (x,y) l'arco di peso minimo con x in T e y non in T
	│	aggiungi a T il vertice y e l'arco (x,y)
	RETURN T
```

**[esempio dell'algoritmo in esecuzione]**

**Teorema**: L'algoritmo di Prim trova un albero ricoprente minimo *(no dimostrazione)*

##### Implementazione

Ad ogni passo per ogni vertice $v$ non ancora in $T$ consideriamo:

- $d[v] = $ minimo peso degli archi tra $v$ e vertici in $T$ ($\infty$ se non ce ne sono)
- vicino[$v$] = vertice $u$ in $T$ tale che $d[v] = \omega(u, v)$

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241115095550933.png" alt="image-20241115095550933" style="zoom:40%;" />

[manca l'algoritmo con la relativa spiegazione e il relativo esempio]

```
ALGORITMO Prim (Grafo G = (V, E, ω)) -> albero
	siano d e vicino due array con indici in V
	FOR EACH v ∈ V DO
		d[v] <- ∞
	T <- (V_T )
	[...]
```



**[...] manca la seconda parte della lezione daje**



****

#### Prim vs Kruskal

Sono due strategie greedy differenti

- **Kruskal**
    - soluzione parziale: foresta di alberi con insieme di vertici $V$
    - inizialmente: tutti i vertici, nessun arco
- **Prim**
    - soluzione parziale: albero $T = (V_T, E_T)$ con $V_T \sube V \quad E_T \sube E \cap (V_T \cross V_T)$
    - inizialmente: albero formato da un unico vertice



# L23 - 18/11/2024

[...]

# L24 - 20/11/2024

## Cammini minimi

$G = (E, V)$ grafo orientato
$\omega: E \rightarrow \mathbb{R}$
$\pi = < v_0, v_1, \cdots, v_k >$ cammino da $v_0$ a $v_k$

$\displaystyle \omega(\pi) = \sum^{k}_{i=1} \omega(v_{i-1}, v_i)$ peso del cammino

$\pi$ è un cammino minimo da $x$ a $y$, $x,y \in V$ sse:

- $\pi$ è un cammino da $x$ a $y$
- $\forall$ cammino $\pi'$ da $x$ a $y$ $\quad \omega(\pi) \le \omega(\pi')$

###### Proprietà

[...]

Se tutti i pesi sono positivi allora ogni cammino minimo è semplice *(non ha vertici ripetuti)*

Se ci sono pesi negativi ma non ci sono cicli di peso negativo allora dato un cammino da $x$ a $y$ esiste sempre un cammino minimo da $x$ a $y$ che è semplice.

[...]

#### Grafi pesati

###### Lista di adiacenza con pesi

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241120085843507.png" alt="image-20241120085843507" style="zoom:40%;" />

###### Matrice dei pesi

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241120090008978.png" alt="image-20241120090008978" style="zoom:40%;" />

### Problemi dei cammini minimi

- Trovare il cammino minimo tra due vertici
- Trovare i cammini minimi tra un vertice $s$ e tutti gli altri
- Trovare i cammini minimi tra ogni coppia di vertici

#### Cammini minimi tra tutte le coppie di vertici

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241120090613771.png" alt="image-20241120090613771" style="zoom:20%;" />

La tabella soprastante indica il peso del cammino minimo da un vertice ad un'altro (considerando solo il grafo verde). Si supponga però di aggiungere un nuovo vertice 6 ed alcuni archi che lo colleghino. 

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241120091849158.png" alt="image-20241120091849158" style="zoom:20%;" />

Bisogna aggiornare la tabella aggiungengo i cammini che vanno da e verso il vertice 6, e successivamente bisogna aggiornare i cammini precedenti confrontandoli con un nuovo che passi per il vertice 6.

##### Algoritmo di Floyd e Warshall

Si supponga $V = \{v_1, v_2, \cdots, v_n\}$ e sia $d_{ij}$ il peso del cammino minimo da $v_i$ a $v_j$

**<u>Problema</u>** $\mathcal{P}$: determinare $d_{ij} \quad i,j = 1, \cdots, n$ 

Per $k = 0, \cdots, n$ considero il problema vincolato:

​	**<u>Problema</u>** $\mathcal{P}(k)$: determinare $d_{ij}^{(k)} \quad (i,j = 1, \cdots, n)$ 	*programmazione dinamica*
​	$d_{ij}^{(k)}$ è il peso del cammino minimo da $v_i$ a $v_j$ che nei passi intermedi visita esclusivamente vertici di indice $\le k$

Allora $\mathcal{P} = \mathcal{P}(k)$

###### Risoluzione di $\mathcal{P}(k)$

- **k = 0**
    $$
    \begin{flalign}
    d_{ij}^{(0)} = 
    \begin{cases}
    \omega(v_i, v_j) & \text{ se } (v_i, v_j) \in E \text{ e } v_i \not = v_j \\
    0 & \text{ se } v_i = v_j \\
    \infin & \text{altrimenti}
    \end{cases}
    &&\end{flalign}
    $$

- **k > 0**
    $$
    \begin{flalign}
    d_{ij}^{(k)} = \min \{d_{ij}^{(k-1)}, d_{ik}^{(k-1)} + d_{kj}^{(k-1)} \}
    &&\end{flalign}
    $$



```
ALGORITMO FloydWarshall (Grafo G) -> Matrice
	siano D_0[1..n, 1..n], ..., D_n[1..n, 1..n] matrici
	FOR i <- 1 TO n DO
		FOR j <- 1 TO n DO
			IF i = j THEN D_0[i,j] <- 0
			ELSE IF (v_i, v_j) ∈ E THEN D_0[i,j] <- ω(i,j)
			ELSE D_0[i,j] <- ∞
			
    FOR [...]
```

**Tempo**: $\Theta(n^3)$, **Spazio**: $\Theta(n^3)$

*[ Esempio sulle slide ]*

**[...]**



# L25 - 22/11/2024

## Cammini minimi da un vertice a tutti gli altri

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20241122084542977.png" alt="image-20241122084542977 L" style="zoom:20%; margin-bottom:-100px" />

### Algoritmo di Bellman & Ford

<u>**Input**</u>: $G = (V, E) \quad \omega: E \rightarrow \mathbb{R}$
	     $s \in V$ vertice di partenza

$d[v] =$ peso del cammino minimo da $s$ a $v$ sinora trovato

**Inizialmente**: $\displaystyle d[v] = \begin{cases}0 &\text{se } v = s\\ \infin & \text{altrimenti}\end{cases}$

**Aggiornamento**: `IF d[u] + ω(u,v) < d[v] THEN d[v] <- d[u] + ω(u,v)`

**<u>Ipotesi</u>**: $G$ privo di cicli negativi
Tra ogni coppia di vertici esiste un cammino minimo semplice. È quindi sufficiente considerare cammini composti da al più $n$ vertici, e dunque $n-1$ archi.

- In al più $n-1$ passi si raggiungono tutti i nodi ottenendo i pesi dei cammini minimi

```
ALGORITMO Bellman&Ford (Grafo G, vertice s) -> vettore
	sia d[v] un vettore con indici in V
	d[s] <- 0
	FOR EACH v ∈ V\{s} DO d[v] <- ∞
	FOR k <- 1 TO n-1 DO
	│	FOR EACH (u,v) ∈ E DO
	│	│	IF d[u] + ω(u,v) < d[v] THEN
	│	│	│	d[v] <- d[u] + ω(u,v)
    RETURN d
```

Sia $n = \# V; \; m = \# E$

- Tempo $\Theta(n \cdot m)$

### Algoritmo di Dijkstra

<u>**Input**</u>: $G = (V, E) \quad \omega: E \rightarrow \mathbb{R}$
	     $s \in V$ vertice di partenza

$d[v]$ =  peso del cammino minimo da $s$ a $v$ sinora trovato *(sono distanze provvisorie)*

**Inizialmente**: $\displaystyle d[v] = \begin{cases}0 &\text{se } v = s\\ \infin & \text{altrimenti}\end{cases}$

**Aggiornamento**: `IF d[u] + ω(u,v) < d[v] THEN d[v] <- d[u] + ω(u,v)`

- ad ogni passo si considerano gli archi che escono da un vertice $u$ scelto con strategia greedy

**<u>Ipotesi</u>**: pesi non negativi

###### Strategia

Distanze provvisorie definite dal vettore $d[v]$

- Inizialmente $\displaystyle d[v] = \begin{cases}0 &\text{se } v = s\\ \infin & \text{altrimenti}\end{cases}$

$C \sube V$ insieme dei vertici candidati

- Inizialmente $C = V$

Strategia greedy: preleva da $C$ il vettore $u$ con $d[u]$ minima; $d[u]$ diventa definitiva ($u$ non è quindi più candidato); aggiorna $d[v]$ per ogni $v$ adiacente ad $u$

```
ALGORITMO Dijkstra (Grafo G, vertice s) -> vettore
	sia d[v] un vettore con indici in V
	d[s] <- 0
	FOR EACH v ∈ V\{s} DO d[v] <- ∞
	C <- V
	WHILE C != ∅ DO
	│	u <- elemento di C con d[u] minima					[2]
	│	C <- C\{u} 			// d[u] diventa definitiva
	│	FOR EACH (u,v) ∈ E DO								[1]
	│	│	IF d[u] + ω(u,v) < d[v] THEN
	│	│	│	d[v] <- d[u] + ω(u, v)
    RETURN d
```

- [1] si utilizza una rappresentazione del grafo tramite lista di adianceza oppure di incidenza. Questo perché per aggiornare $d[v]$ bisogna iterare sugli archi incidenti al vertice $u$: con una lista di adiacenza questo è immediato.
- [2] costo creando vettore $n^2$



L'insieme dei candidati viene rappresentato tramite una coda con priorità

[ Questo algoritmo non funziona con pesi negativi ] *to check*

**[...]**

