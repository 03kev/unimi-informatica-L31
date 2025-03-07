# Algoritmi e strutture dati

## Alberi binari di ricerca

Un albero binario di ricerca è un albero binario in cui per ogni nodo $n$:

- il valore di ogni chiave contenuta nel sottoalbero sinistro di $n$ è minore della chiave contenuta in $n$
- il valore di ogni chiave contenuta nel sottoalbero destro di $n$ è maggiore o uguale della chiave contenuta in $n$

Gli alberi binari di ricerca permettono di implementare i dizionari.

<div style="display: flex; align-items: center;  margin-top:0px; margin-bottom:0px">
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250221085750937.png" alt="image-20250221085750937 L" style="zoom:17%;" />
	<p style="margin-top:-5px">La rappresentazione per i nodi degli alberi binari di ricerca è la stessa degli alberi binari, con la differenza che nella parte del dato tra tutti i campi troviamo anche un campo chiave. Questo campo viene utilizzato per effettuare i confronti.
    </p>
</div>

**Proprietà:** visitando in profondità e in ordine simmetrico un albero binario di ricerca si ottiene la sequenza contenuta all'interno dell'albero ordinata secondo le chiavi.

- *Questo perché con la DFS in ordine simmetrico si visita prima tutta la parte sinistra, ossia tutti i valori minori della radice; poi si visita la radice ed infine i valori maggiori o uguali alla radice. Ciò viene fatto ricorsivamente.*
- *Se quindi abbiamo un dizionario rappresentato con un albero binario di ricerca e vogliamo un elenco ordinato secondo i valori delle chiavi degli elementi contenuti, si può utilizzare una DFS in ordine simmetrico.*



#### Operazioni

Il costo delle tre operazioni `ricerca`, `inserimento` e `cancellazione` che verranno presentate è $\Theta(h)$ dove $h$ è l'altezza dell'albero binario di ricerca. Si ricordi che negli alberi binari con $n$ nodi vale la relazione $\log_2n \le h \lt n$, di conseguenza le operazioni vengono eseguite in tempo $\mathcal{O}(n)$.

- *Se l'albero fosse però bilanciato, allora le operazioni si potrebbero eseguire in tempo $\mathcal{O}(\log n)$. In seguito verranno proposti degli alberi utili a tale scopo.*

###### Trovare il nodo con chiave max (o min)

```
FUNZIONE massimo(AlberoRicerca r) -> Nodo
	IF r = null THEN
	│	RETURN null
	ELSE
	│	n <- r
	│	WHILE n.dx != null DO
	│	│	n < n.dx
	│	RETURN n
```

Per trovare il valore massimo in un albero di ricerca, partiamo dalla radice e ci spostiamo sempre verso il figlio destro finché esiste. Quando non è più possibile andare a destra, il nodo corrente è quello che contiene la chiave massima. *Non si effettua nessun confronto.*

<div alt="page-break" class="page-break"></div>

###### Ricerca di una data chiave

**Ricerca ricorsiva**

```
FUNZIONE trova(AlberoRicerca r, tipoChiave k) -> Nodo
	IF r = null THEN
	│	RETURN null
	ELSE IF k < r.chiave THEN
	│	RETURN trova(r.sx, k)
	ELSE IF k > r.chiave THEN
	│	RETURN trova(r.dx, k)
	ELSE RETURN r
```

Per cercare un nodo con chiave $k$ in un albero di ricerca, si confronta $k$ con la chiave del nodo corrente: se $k$ è minore, si passa al sottoalbero sinistro; se è maggiore, si passa al sottoalbero destro; se coincide, lo si è trovato. Se si raggiunge un nodo nullo, significa che non esiste alcun nodo con chiave $k$.

Qua si divide l'albero in due parti in base al confronto con la radice: queste due ricorsioni (similmente a quanto avviene nella ricerca binaria) sono entrambe ricorsioni in coda.

**Ricerca iterativa**

```
FUNZIONE trova(AlberoRicerca r, tipoChiave k) -> Nodo
	n <- r
	WHILE n != null AND n.chiave != k DO
	│	IF k < n.chiave THEN
	│	│	n <- n.sx
	│	ELSE
	│	│	n <- n.dx
	RETURN n
```

La versione iterativa della ricerca in un albero di ricerca usa una variabile $n$ che punta al nodo attuale. Finché $n$ non è nullo e la chiave di $n$ non coincide con quella cercata, si decide se spostarsi a sinistra o a destra confrontando la chiave $k$ con $n.\text{chiave}$. Se $k < n.\text{chiave}$ ci si sposta nel sottoalbero sinistro, altrimenti in quello destro. Quando il ciclo termina, o abbiamo trovato il nodo con la chiave desiderata o $n$ è nullo (chiave non presente).

Nel caso peggiore il numero di confronti effettuati tra chiavi dipende dall'altezza dell'albero: $T(h) = \mathcal{O}(h)$.

###### Inserimento

**Inserimento ricorsivo**

```
FUNZIONE inserisci(AlberoRicerca r, elemento d) -> AlberoRicerca
	k <- d.chiavi
	IF r = null THEN
	│	r <- riferimento a un nuovo nodo
	│	r.chiave <- k
	│	r.altri_campi <- d.altri_campi
	│	r.sx <- null
	│	r.dx <- null
	ELSE IF k < r.chiave THEN
	│	r.sx <- inserisci(r.sx, d)
	ELSE
	│	r.dx <- inserisci(r.dx, d)
	RETURN r
```

Per inserire un nuovo elemento $d$ in un albero di ricerca: se l’albero è vuoto (nodo nullo), si crea un nuovo nodo contenente la chiave $k$ di $d$ e si inizializzano i suoi puntatori a sinistra e a destra a $\text{null}$; altrimenti, si confronta $k$ con la chiave del nodo corrente: se è minore, si ricorre sul sottoalbero sinistro, altrimenti sul sottoalbero destro. In questo modo, l’inserimento rispetta la proprietà di ordinamento dell’albero di ricerca.

<div alt="page-break" class="page-break"></div>

**Inserimento iterativo**

```
FUNZIONE inserisci(AlberoRicerca r, elemento d) -> AlberoRicerca
	// creazione nuovo nodo
	k <- d.chiave
	t <- riferimento a un nuovo nodo
	t.chiave <- k
	t.altri_campi <- d.altri_campi
	t.sx <- null
	t.dx <- null
	
	// trova posizione
	padre <- null
	n <- r
	WHILE n != null DO
	│	padre <- n
	│	IF k < n.chiave THEN n <- sx
	│	│				ELSE n <- dx

	// inserimento
	IF padre = null THEN
	│	r <- t
	ELSE IF k < padre.chiave THEN
	│	padre.sx <- t
	ELSE
	│	padre.dx <- t
	
	RETURN r	
```

Nell’inserimento iterativo, prima si crea il nodo $t$ che conterrà il nuovo dato. Poi, partendo dalla radice, si scorre l’albero confrontando la nuova chiave $k$ con la chiave dei nodi incontrati, spostandosi a sinistra o a destra finché non si trova la posizione corretta (un puntatore nullo). Infine, si collega $t$ al padre individuato: se il padre è nullo (albero inizialmente vuoto), $t$ diventa la radice; altrimenti si collega come figlio sinistro o destro, in base al confronto con la chiave del padre.

La creazione del nuovo nodo e l'inserimento presentano un numero costante di operazioni. Il numero di iterazioni del ciclo while (necessario a trovare la posizione) dipende invece dall'altezza dell'albero. Di conseguenza nel caso peggiore il numero di confronti effettuati tra chiavi dipende dall'altezza dell'albero: $T(h) = \mathcal{O}(h)$.

###### Cancellazione

La cancellazione di un nodo interno lascia due puntatori pendenti, ossia quelli dei due sottoalberi relativi, con un unico punto in cui reinserire entrambi. Si presentano $3$ possibili casi:

1. Il nodo da cancellare è una foglia: si aggiorna il puntatore del padre rimuovendo il puntatore alla foglia. Caso particolare: se il nodo è la radice l'albero diventa vuoto. 
2. Il nodo da cancellare ha un unico figlio: si modifica il puntatore nel nodo padre facendolo puntare all'unico figlio (la relazione di ordinamento tra le chiavi è mantenuta). Caso particolare: se il nodo da cancellare è la radice, non esiste un padre e quindi l’unico figlio diventa la nuova radice dell’albero.
3.  Il nodo da cancellare ha due figli: si sostituisce il contenuto del nodo da cancellare con il contenuto del nodo di chiave minima nel sottoalbero destro; dopodiché si procede a rimuovere tale nodo (e si ricade in uno dei primi due casi)

Lo pseudocodice è lasciato al lettore (non fornito dal docente durante la spiegazione).



****

## Alberi bilanciati

### Albero perfettamente bilanciato

Un albero binario è detto perfettamente bilanciato quando per ogni nodo la differenza in valore assoluto tra i numeri di nodi presenti nei suoi sottoalberi sinistro e destro è al massimo $1$.

*Non sono adatti all'implementazione dei dizionari in quanto l'inserimento può richiedere la riorganizzazione dell'intera struttura, con una complessità di $n$ dove $n$ è il numero di nodi dell'albero perfettamente bilanciato. A questo punto conviene implementare i dizionari tramite degli array ordinati, dato che le complessità delle operazioni sono le stesse, ma la struttura dati tramite array è estremamente più semplice.*

#### Relazione tra numero di nodi e altezza

Dato un albero binario perfettamente bilanciato di altezza $h$:

- il numero **massimo** di nodi lo si ottiene con un albero binario completo, ed è quindi pari a $2^{h+1} - 1$
- il numero **minimo** di nodi lo si ottiene quando si ha un albero completo di altezza $h-1$ e almeno un nodo di altezza $h$ (così facendo si ottiene un albero binario quasi completo con il numero minimo di nodi). È pari a $2^h - \cancel 1 + \cancel 1 = 2^h$

**Proprietà**: in ogni albero perfettamente bilanciato con altezza $h$ il numero di nodi $n$ è $\ge 2^h$
Dimostrazione: **Induzione su $\mathbf{h}$**

- **Base**: $h=0$
    Si ha solo la radice $\rightarrow n = 1 \ge 2^0$
- **Induzione**: $\,h > 0$
    Sia $T$ un albero perfettamente bilanciato di altezza $h$ e composto da una radice, da un sottoalbero più alto $T'$ e l'altro sottoalbero $T''$. $T'$ ha altezza $h-1$, e per ipotesi di induzione contiene quindi almeno $2^{h-1}$ nodi. Per ipotesi l'albero è perfettamente bilanciato, e quindi $T''$ può differire da $T'$ di al massimo un nodo: ha quindi almeno $2^{h-1}-1$ nodi. In totale vi sono quindi almeno $\cancel 1 + 2^{h-1} + 2^{h-1} - \cancel 1 = 2 \cdot 2^{h-1} = 2^h$ nodi. 

Abbiamo quindi dimostrato che:
$$
\begin{flalign}
&\; 2^h \le n \le 2^{h+1} -1 \;\; \Rightarrow \;\; h = \lfloor\, \log_2 n \, \rfloor \;\; \Rightarrow \;\; h = \mathcal{O}(\log n) \\[-0.15em]
& \small \hspace{0.35em} \uparrow \hspace{6.2em} \uparrow \\[-2em]
& \small \hspace{0em} \text{albero} \hspace{3.2em} \text{albero completo} \\[-2em]
& \small \text{q. completo}
&&\end{flalign}
$$
Un albero binario perfettamente bilanciato si pone quindi tra un albero binario quasi completo e uno completo.

In un albero binario perfettamente bilanciato quindi la ricerca avviene in $\mathcal{O}(\log n)$, ma l'inserimento può richiedere l'intera ristrutturazione dell'albero con una complessità di $\mathcal{O}(n)$.



### Alberi bilanciati in altezza (AVL)

Un albero binario è detto bilanciato in altezza o AVL quando per ogni nodo la differenza in valore assoluto tra le altezze dei suoi sottoalberi sinistro e destro è al massimo $1$.

Se un albero è perfettamente bilanciato, allora è anche bilanciato in altezza. Non vale il contrario.

#### Relazione tra numero di nodi e altezza

Dato un albero AVL di altezza $h$:

- il numero **massimo** di nodi lo si ottiene con un albero binario completo, ed è quindi pari a $2^{h+1}-1$
- il numero **minimo** di nodi lo si ottiene tramite il corrispondente albero di Fibonacci di altezza $h$

<div alt="page-break" class="page-break"></div>

###### Albero di Fibonacci

<div style="display: flex; align-items: center;  margin-top:0px; margin-bottom:0px">
<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250226203246619.png" alt="image-20250226203246619" style="zoom:19%;" />
    <div style="margin-top:-20px; margin-left:0px">
        <p style="">Se da un albero di Fibonacci di altezza <i>h</i> si toglie un nodo, o si diminuisce l'altezza (rendendolo quindi non più un albero di Fibonacci di altezza <i>h</i>) oppure l'albero perde la proprietà di essere AVL.
    </p>
    <p style="">Da questo deriva la seguente <strong>proprietà</strong>: un albero di Fibonacci è un albero AVL con il numero minimo di nodi.
    </p>
    </div>
</div>

Sia $n_h = \#\,$nodi dell'albero di Fibonacci di altezza $h$
$$
\begin{flalign}
n_h = \begin{cases}
1 & \text{se } h=0 \\
2 & \text{se } h=1 \\
n_{h-1} + n_{h-2} + 1 & \text{altrimenti}
\end{cases}
&&\end{flalign}
$$
Si definisce il numero di Fibonacci come: $\;F_1 = F_2 = 1, \quad F_k = F_{k-1} + F_{k-2}$



**Proprietà**: in un albero di Fibonacci $n_h = F_{h+3} - 1$ dove $F_{h+3}$ è il numero di Fibonacci corrispondente *($n_h$ è il numero di nodi presenti in un albero di Fibonacci di altezza $h$*) 

Dimostrazione: **Induzione su $\mathbf{h}$**

- **Base**: $h=0,\, h=1$
    - $h=0$ si ha solo la radice $\;\quad\quad\quad\quad \rightarrow \quad n_0 = 1 \quad F_3 - 1 = 2-1 = 1 = n_0$
    - $h=1$ si ha la radice con un figlio $\quad \rightarrow \quad n_1 = 2 \quad F_4 - 1 = 3-1 = 2 = n_1$


- **Induzione**: $h \gt 1$
    $$
    \begin{flalign}
    & n_h = n_{h-1} + n_{h-2} + 1 = F_{h+2} - \cancel{1} + F_{h+1} - 1 + \cancel{1} = F_{h+3} - 1 \\[-2em]
    & \hspace{9.5em} \uparrow \\
    & \hspace{7em} \small \text{ipotesi di induzione} \\[0.5em]
    & \text{dove $n_{h-1} = F_{h+2} - 1$ e $n_{h-2} = F_{h+1} - 1$}
    &&\end{flalign}
    $$

Abbiamo quindi dimostrato che $n_h = F_{h+3} - 1$ è il numero minimo di nodi di un albero AVL di altezza $h$ *(considerando il corrispondente albero di Fibonacci di altezza* $h\,$).
$$
\begin{flalign}
& F_n \approx \dfrac{\phi^n}{\sqrt{5}} \quad \text{con } \phi =1,618.. \text{ sezione aurea} \\[0.4em]
& n_h \approx \dfrac{\phi^{h+3}}{\sqrt{5}} - \cancel{1} \;\;\small \text{ si cancella l'$1$ in quanto una costante} \normalsize \;\; \Rightarrow\;\; \sqrt{5}\, n_h \approx \phi^{h+3} \\[0.4em]
& \text{Passando ai logaritmi: } h + 3 \approx \log_{\phi}(\sqrt{5}\, n_h) \;\; \Rightarrow\;\; h \approx \cancel {\log_{\phi} \sqrt{5}} + \log_{\phi} n_h - \cancel{3} \small \;\;\text{ si cancellano le costanti} \\[0.5em]
& \Rightarrow h = \Theta(\log n)
&&\end{flalign}
$$
Si può inoltre dimostrare $h < 1,44 \log_2 n$

L'altezza di un albero AVL è quindi logaritmica nel numero di nodi. La ricerca, proprio come negli alberi perfettamente bilanciati, avviene in tempo logaritmico $\Theta(\log n)$.

<div alt="page-break" class="page-break"></div>

#### Inserimento e bilanciamento

L’inserimento in un albero AVL segue le stesse regole di un normale albero binario di ricerca: si confronta il valore da inserire con la radice e si procede ricorsivamente a sinistra o a destra finché si trova la posizione corretta. La differenza sta nel *riequilibrio* che viene eseguito dopo ogni inserimento per garantire la proprietà di bilanciamento.

Sia $v$ un nodo con fattore di bilanciameto $\pm \;2$, allora esiste un sottoalbero $T$ di $v$ con altezza tale da sbilanciare il nodo. A seconda della posizione di $T$, possono presentarsi quattro casi:

- $SS$ (sinistra - sinistra): $T$ è il sottoalbero sinistro del figlio sinistro di $v$
- $DD$ (destra - destra): $T$ è il sottoalbero destro del figlio destro di $v$
- $SD$ (sinistra - destra): $T$ è il sottoalbero destro del figlio sinistro di $v$
- $DS$ (destra - sinistra): $T$ è il sottoalbero sinistro del figlio destro di $v$

Si possono applicare delle operazioni, dette rotazioni, al fine di ristabilire il bilanciamento nell'albero AVL. Queste rotazioni sono simmetriche tra $SS$ e $DD$ e tra $SD$ e $DS$, pertanto verranno illustrati solo gli sbilanciamenti sul sottoalbero sinistro.

Una qualsiasi di queste rotazioni, applicata ad un nodo $v$ con fattore di bilanciamento $\pm \, 2$, fa descrescere di $1$ l'altezza del sottoalbero radicato in $v$ prima della rotazione.

Le rotazioni $SS$ e $DD$ sono dette *singole*, mentre $SD$ e $DS$ sono dette *doppie* poiché si compongono di due rotazioni in sequenza.

**SS - Sbilanciamento a SX nel sottoalbero SX**

<div>
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250226231444949.png" alt="image-20250226231444949" style="zoom:21%; margin-bottom:-20px"/>
</div>

Per ribilanciare il nodo $v$ basta applicare una semplice rotazione verso destra con perno in $v$. Così facendo il fattore di bilanciamento di $v$ passerà da $2$ a $0$.

**SD - Sbilanciamento a DX nel sottoalbero SX**

<div>
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250226231850486.png" alt="image-20250226231850486" style="zoom:28%; margin-bottom:-20px" />
</div>

Sia $z$ il figlio sinistro di $v$, l'albero che sbilancia $v$ è il sottoalbero destro di $z$, radicato nel nodo $w$. Si applica una prima rotazione verso sinistra con perno in $z$ e successivamente si applica una rotazione a destra con perno in $v$.

- *Da notare che dopo la prima rotazione si torna nel caso $SS$*



Al fine di svolgere queste rotazioni si effettuano delle modifiche locali sui puntatori associati ai nodi $v$, $z$ (e $w$ in alcuni casi), e sono modifiche ai puntatori che troviamo nel cammino di ricerca. Di conseguenza queste operazioni costano $\mathcal{O}(1)$. Questo può essere implementato tenendo traccia di alcuni nodi del cammino, in particolare quelli in cui si presenta lo sbilanciamento.

##### Analisi delle operazioni

Sia $n = \#\, \text{nodi}$ dell'albero AVL. La sua altezza sarà nell'ordine di $\Theta(\log n)$. Di conseguenza le operazioni relative avranno un costo in termini di tempo pari a:

- Ricerca $\quad\quad\quad \rightarrow \Theta(\log n)$ 
- Inserimento $\quad \rightarrow \Theta(\log n)$
- Cancellazione $\;\, \rightarrow \Theta(\log n)$

Lo sforzo di memoria di avere i puntatori e lo sforzo di implementare gli inserimenti tramite le rotazioni viene ripagato da una maggiore efficienza. È infatti possibile ora implementare i dizionari più efficacemente rispetto all'implementazione tramite array ordinati, che presenta i seguenti costi:

- Ricerca $\quad\quad\quad \rightarrow \Theta(\log n)$ 
- Inserimento $\quad \rightarrow \Theta(n)$



### Alberi 2-3

Un albero $2$-$3$ è un albero in cui ogni nodo interno ha due o tre figli e tutte le foglie si trovano allo stesso livello (condizione di bilanciamento).<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250227175706846.png" alt="image-20250227175706846" style="zoom:50%;" />

#### Relazione tra numero di nodi e altezza

Dato un albero $2$-$3$ di altezza $h$:

- il numero **massimo** di nodi lo si ottiene quando ogni nodo dell'albero ha il numero massimo di figli possibili, ossia $3$. Così facendo si ottiene un albero ternario completo di altezza $h$, il cui numero di nodi è $\dfrac{3^{h+1}-1}{2}$ *(si può verificare per induzione)* e il numero di foglie è $3^h$ *(ogni volta che si aumenta l'altezza di uno il numero di foglie triplica).*
- il numero **minimo** di nodi lo si ottiene quando ogni nodo dell'albero ha il numero minimo di figli possibili, ossia $2$. Così facendo si ottiene un albero binario completo di altezza $h$, il cui numero di nodi è $2^{h+1}-1$ e il numero di foglie è $2^h$ *(ogni volta che si aumenta l'altezza di uno il numero di foglie raddoppia)*.

In conclusione:
$$
\begin{flalign}
\begin{array}{c|c|c}
 & \textbf{minimo} & \textbf{massimo} \\[0.4em]
\hline
~~~\text{numero nodi}~~~ & \hfill ~~~2^{h+1} - 1~~~ \hfill & \hfill ~~~\dfrac{3^{h+1} - 1}{2}~~~ \hfill \\[0.4em]
\hline
~~~\text{numero foglie}~~~ & \hfill 2^h \hfill & \hfill 3^h \hfill \\
\end{array}
&& \end{flalign}
$$
Dunque, se ci sono $f$ foglie: 
$$
\begin{flalign}
& 2^h \le f \le 3^h \;\; \Rightarrow \;\; \log_3 f \le h \le \log_2 f
&&\end{flalign}
$$
Pertanto l'altezza di un albero $2$-$3$ è logaritmica rispetto al numero di foglie: $h = \Theta(\log f)$

<div alt="page-break" class="page-break"></div>

### Alberi 2-3 di ricerca

Gli alberi $2$-$3$ sono utilizzati per implementare i dizionari in memoria centrale.

Negli alberi $2$-$3$ bisogna fare una distinzione tra nodo interno e nodo terminale (foglia):

- i dati sono memorizzati esclusivamente nelle foglie, in ordine crescente da sinistra fino a destra. 
- i nodi interni invece contengono alcune chiavi, utilizzate come informazioni di instradamento.

*Questo è il motivo per cui precedentemente abbiamo considerato l'altezza in funzione delle foglie, che sono le uniche a memorizzare i dati rilevanti.*

<div>
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250227191449961.png" alt="image-20250227191449961" style="zoom:26%; margin-top:-5px; margin-bottom:-25px" />
</div>

I nodi interni quindi non contengono dati, ma solo alcune chiavi utili alla ricerca. Se un nodo ha due figi, allora vi memorizzo solo un'unica chiave $x$ che corrisponde alla chiave più grande presente nel sottoalbero sinistro *(corrisponde alla foglia che si trova più a destra in quel sottoalbero)*; se il nodo ha invece 3 figli, allora vi memorizzo due chiavi $x$ e $y$ dove $x$ mantiene la stessa connotazione spiegata precedentemente, mentre $y$ corrisponde alla chiave più grande presente nel sottoalbero centrale *(corrisponde alla foglia che si trova più a destra in quel sottoalbero)*.

##### Rappresentazione

<div style="display: flex; align-items: center; margin-top:0px; margin-bottom:0px; margin-left:20px">
    <div>
        <div style="display: flex; align-items: center; margin-bottom:-10px">
			<p style="margin-left:80px; font-weight: 450;"><strong>Foglie</strong></p>
    		<p style="margin-left:131px; font-weight: 450;"><strong>Nodi interni</strong></p>
		</div>
		<div style="display: flex; align-items: center;">
<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250227200201948.png" alt="image-20250227200201948" style="zoom:17%;" />
<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250227201518382.png" alt="image-20250227201518382" style="zoom:16%;" />
		</div>
    </div>
</div>

Per inserimenti e cancellazioni è utile memorizzare in ogni nodo anche un puntatore al padre.

##### Operazioni

###### Ricerca

Per cercare una certa chiave `k`, si parte dalla radice `r` e si confronta `k` con `r.s`: se `k <= r.s` si continua la ricerca nel sottoalbero sinistro. Se invece `k` fosse maggiore si controlla che esisti il sottoalbero centrale `r.c`: se questo esiste e `k <= r.c` allora si prosegue la ricerca nel sottoalbero centrale. Se invece `k` fosse nuovamente maggiore o nel caso in cui `r.c` non esistesse allora si continua la ricerca nel sottoalbero destro. 
Si continua ricorsivamente la ricerca finché non si arriva ad una foglia: in questo caso *(ossia quello base)*, si controlla che la chiave `k` sia uguale alla chiave della foglia: se così fosse si restituisce il puntatore alla foglia, altrimenti si restituisce `null`.

Il numero di passi per la ricerca è logaritmico: $\Theta(h) = \Theta(\log f)$ dove $f$ rappresenta il numero di foglie dell'albero.

<div alt="page-break" class="page-break"></div>

###### Inserimento e bilanciamento

Durante l'inserimento di una certa chiave $k$ si crea inanzitutto un nuovo nodo $u$ e si segue l'instradamento dei nodi interni per trovare il suo giusto posizionamento tra le foglie (proprio come nella ricerca): bisogna infatti mantenere l'ordine crescente da sinistra verso destra per le foglie.

È però necessario assicurarsi di mantenere l'albero bilanciato. Una volta trovata la posizione in cui inserire la chiave infatti si ottiene un nodo $v$ al penultimo livello a cui andrebbe attaccato proprio $u$. A questo punto si presentano due casistiche:

- $v$ ha due figli: $u$ può essere correttamente inserito come figlio sinistro, destro o centrale.
- $v$ ha tre figli: $u$ non può essere correttamente inserito come figlio di $v$, quindi si esegue un'operazione chiamata `split`. Si divide $v$ in due, creando un nuovo nodo $w$. Considerando anche $u$, si attaccano a $v$ i due nodi di chiave minima e a $w$ i due nodi di chiave massima. Infine, $w$ diventa figlio del padre di $v$. Dopo questa operazione di `split`, nel caso in cui il padre di $v$ e $w$ abbia al massimo tre figli allora il procedimento si conclude, altrimenti si procede con altri `split` verso l'alto seguendo il medesimo approccio.

L'operazione di inserimento di nuovi nodi quindi può far crescere l'albero verso l'alto, anziché verso il basso. Per questo motivo risulta utile memorizzare in ogni nodo anche il suo puntatore al padre, dato che talvolta bisogna aggiornare proprio le informazioni del padre: quando infatti si fanno degli `split` si aggiornano delle informazioni locali, sempre sul cammino dal nodo che abbiamo inserito verso l'alto.

Nonostante quindi questo procedimento sembri complicato, il costo dell'inserimento è logaritmico. Questo perché si lavora sempre prima scendendo per la ricerca della posizione in cui inserire il nodo, per poi risalire verso l'alto per l'aggiornamento e per gli eventuali `split`. Il numero di passi corrisponde quindi a $\Theta(h) = \Theta(\log f)$ dove $f$ è il numero di foglie dell'albero.

###### Cancellazione

Quando cancellando capita che un nodo interno abbia un solo figlio, esiste un'operazione inversa allo `split` che riesce a riunificarlo con un nodo adiacente, eventualmente propagando la riunificazione verso l'alto. Anche questa operazione si riesce a implementare con una complessità di $\Theta(h) = \Theta(\log f)$ dove $f$ è il numero di foglie dell'albero.

*Non è ammissibile lasciare nodi con un singolo figlio perché altrimenti può capitare ciò che avviene negli alberi binari di ricerca senza bilanciamento, ossia può succedere che l'albero degeneri in una lista portando le complessità delle relative operazioni lineari rispetto al numero di nodi.*



##### Analisi delle operazioni

Sia $f = \#\, \text{foglie}$ dell'albero $2$-$3$. La sua altezza sarà nell'ordine di $\Theta(\log f)$. Di conseguenza le operazioni relative avranno un costo in termini di tempo pari a:

- Ricerca $\quad\quad\quad \rightarrow \Theta(\log f)$ 
- Inserimento $\quad \rightarrow \Theta(\log f)$
- Cancellazione $\;\, \rightarrow \Theta(\log f)$

Implementare le ultime due operazioni facendo in modo che mantengano il bilanciamento per ogni nodo (ossia che rispettando la condizione $2$-$3$) ci assicura che l'altezza sia logaritmica rispetto al numero di foglie: $\log_3 f \le h \le \log_2 f$. Così facendo, dato che ognuna di queste tre operazioni lavora sull'albero per profondità (ossia scendono l'albero in altezza, ed eventualmente lo risalgono), si ottiene delle operazioni con complessità logaritmica rispetto al numero di foglie.

Si può notare che il costo delle operazioni è lo stesso degli alberi AVL.



****

### B-Alberi (Alberi di Bayer)

Si utilizzano principalmente quando bisogna lavorare con un dizionario talmente grande da non poter stare in memoria centrale. Servono quindi per gestire dati su **memoria secondaria**.

I DBMS (database management system) gestiscono delle basi di dati molto grandi salvate su memoria secondaria. Si vogliono realizzare degli indici per garantire un acesso veloce a questi dati. Gli indici potrebbero essere basati su una chiave, oppure si potrebbero anche avere più indici basati su campi differenti. 
Questi indici possono essere molto grandi (possono essere infatti presenti migliaia o milioni di chiavi), e quindi a causa delle loro dimensioni non possono essere caricati in memoria centrale. 
È possibile perciò realizzare delle strutture ad albero per implementare dei dizionari in memoria secondaria, utili a rappresentare questi indici. *Il dizionario servirà quindi per fornirci la posizione delle informazioni nella base di dati.*

La memoria secondaria però presenta dei **vincoli tecnologici**:

- l'accesso ai dati è più lento rispetto alla memoria centrale *(i dischi hanno un tempo di accesso circa 100k volte più grande rispetto a quello in memoria centrale)*. 
    **L'accesso al singolo dato è perciò più lento**.
    - *Si supponga infatti di voler accedere a un singolo dato in un albero $2$-$3$: si scende dalla radice verso le foglie in un albero profondo, ed è quindi necessario fare tanti accessi al disco, che però sono molto lenti e perciò inefficienti.*

- l'accesso su memoria di massa non viene mai fatto sul singolo dato *(non avviene per parola come in memoria centrale)*, ma avviene per blocchi (o pagine). Dimensioni tipiche sono per esempio $512$ byte, $4096$ byte, ecc.
    **Quindi in un unico accesso si ottengono molti dati**.
    - *Se si fa un'implementazione diretta di un albero in memoria di massa, quando si deve scendere nell'albero si salta da un dato all'altro. Se non si sta attenti, ogni volta che bisogna accedere ad un nodo si rischia di dover fare ogni volta un accesso alla memoria di massa. Questo perché i dati possono trovarsi in blocchi diversi.*

Si deve quindi cercare di far in modo che nello stesso blocco si trovino dei dati che probabilmente verranno consultati insieme. Bisogna fare in modo che quando ci si muove verso il basso nell'albero, i dati che si devono consultare di seguito si trovino vicini anche sul disco. Così facendo si fa un accesso a memoria di massa, e poi l'accesso successivo verrà fatto non subito dopo, ma magari dopo tanto tempo.

- Si cerca di organizzare le chiavi nell'albero in modo che ciascun blocco in memoria di massa contenga delle chiavi che probabilmente verranno consultate una dopo l'altra.
- Si diminuisce quindi l'altezza dell'albero e si aumenta la quantità di elementi per ogni nodo, in modo da avere pochi accessi a memoria e da sfruttare l'intera dimensione dei blocchi.

**Obiettivo**: ridurre il numero di accessi alla memoria di massa. I B-alberi sono utili a tale scopo.

#### Definizione

##### Struttura

Un B-albero di ordine $t \ge 2$ (o grado minimo $t$) è un albero $T$ tale che $T$ sia vuoto oppure sia strutturato come segue:

- ogni nodo interno ha al massimo $2t$ figli
- ogni nodo interno diverso dalla radice ha almeno $t$ figli
- la radice ha almeno $2$ figli
- tutte le foglie si trovano allo stessa profondità

*L'ordine $t$ ci pone dei vincoli sulla struttura che garantiscono che la profondità del B-albero sia logaritmica.*

Si dice che un nodo è pieno se contiene esattamente $2t-1$ chiavi e quasi vuoto se ne contiene $t-1$.

##### Contenuto

- ogni foglia contiene $k$ chiavi ordinate $a_1 \le a_2 \le \cdots \le a_k$ dove $t -1 \le k \le 2t -1$
    ($1 \le k \le 2t-1$ se la foglia è la radice)
- ogni nodo interno con $k+1$ figli e sottoalberi $T_0, T_1, \cdots, T_k$ contiene $k$ chiavi ordinate $a_1 \lt a_2 \lt \cdots \lt a_k$ tali che, per ogni chiave $c_i$ di $T_i$ con $i = 0, \cdots, k\hspace{0.1em}$, risulta $c_0 \lt a_1 \lt c_1 \lt a_2 \lt \cdots \lt c_{k-1} \lt a_k \lt c_k$
    *Con $c_i$ si intendono tutte le chiavi contenute nel sottoalbero $T_i$.*

Mentre negli alberi $2$-$3$ i nodi interni contengono solamente informazioni per l'instradamento, nei B-alberi questi servono sia a memorizzare i dati che per l'instradamento.

<div alt="page-break" class="page-break"></div>

###### Spiegazione

**Foglie**
Le foglie possono essere viste come un array ordinato di $k$ chiavi, dove $k$ è compreso tra $t-1$ e $2t-1$. L’unica eccezione è la radice quando è essa stessa una foglia: in tal caso può contenere da $1$ a $2t-1$ chiavi.

**Nodi interni**
I nodi interni, al pari delle foglie, sono implementati come array ordinati di chiavi. Un nodo interno con $k + 1$ figli (o sottoalberi) $T_0, T_1, \ldots, T_k$ contiene esattamente $k$ chiavi $a_1 < a_2 < \cdots < a_k$, che fungono da separatori tra i diversi sottoalberi. In particolare, se $c_i$ è una qualunque chiave presente nel sottoalbero $T_i$, la condizione $c_0 < a_1 < c_1 < a_2 < \cdots < c_{k-1} < a_k < c_k$ indica che tutte le chiavi in $T_0$ sono minori di $a_1$, quelle in $T_1$ sono comprese tra $a_1$ e $a_2$, e così via. In altre parole, ciascuna chiave $a_i$ determina la soglia tra le chiavi del sottoalbero alla sua sinistra (che saranno minori) e quelle del sottoalbero alla sua destra (che saranno maggiori).

I nodi interni quindi contengono delle chiavi (univoche) che funzionano come guide per decidere in quale sottoalbero scendere durante le operazioni di ricerca, inserimento o cancellazione.

**Vincolo sul numero di chiavi**
Poiché un nodo interno con $k + 1$ figli ha appunto $k$ chiavi, e dal momento che ogni nodo interno deve avere tra $t$ e $2t$ figli, segue che il numero di chiavi di un nodo interno vari fra $t - 1$ e $2t - 1$. Lo stesso intervallo si applica alle foglie (pur non avendo figli), per garantire il bilanciamento dell’albero.

*Infatti quando una foglia supera il limite di $2t - 1$ chiavi, viene suddivisa (split) e le chiavi in eccesso sono distribuite tra la foglia originale e quella appena creata. Se questo processo si propaga verso l’alto, la foglia può essere promossa a nodo interno, motivo per il quale è importante imporre questo vincolo anche alle foglie.*

<img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250228181117588.png" alt="image-20250228181117588" style="zoom:31%; margin-bottom:-20px" />
$$
\hspace{-4.7em} \text{Un B-albero di ordine } t=3
$$

Le foglie negli alberi $2$-$3$ contengono un singolo elemento, e tutti i dati stanno proprio nelle foglie. Nei B-alberi invece tutti i nodi, che siano interni o foglie, contengono i dati.
*L'applicazione è quella di fare degli indici per delle basi di dati grandi; nei nodi dell'albero ci sono le chiavi e per ogni chiave ci sarà un puntatore che ci indica dove si trovi sul disco il record associato.*

#### Relazione tra numero di nodi e altezza

Si consideri un B-albero con $n$ chiavi. Sia $h$ l'altezza, il suo valore è massimo quando ogni nodo dell'albero è quasi vuoto, ossia contiene il minimo numero di chiavi consentito $t-1$. Questo perché, con meno chiavi per nodo, è necessario avere più livelli per contenere tutte le $n$ chiavi.

<div>
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250302222644702.png" alt="image-20250302222644702" style="zoom:13%; margin-top:-20px; margin-bottom:0px" />
</div>

<div alt="page-break" class="page-break"></div>

> $ \displaystyle \text{Progressione geometrica} \;\; \sum_{k=0}^{n-1} a r^k = a \dfrac{r^n -1}{r-1} \quad \Rightarrow \quad\, \sum_{i=0}^{h-1} t^i = \dfrac{t^h -1}{t-1} \;\;$

$$
\begin{flalign}
& \text{\# totale di chiavi minimo}
= 1 + \displaystyle \sum_{i=0}^{h-1} 2t^i (t-1)=
1 + 2(t-1) \sum_{i=0}^{h-1} t^i =
1 + 2 \cancel{(t-1)} \dfrac{t^h -1}{\cancel{t-1}} = 2t^h -1
&&\end{flalign}
$$

Il numero di chiavi minimo all'interno di un B-albero di ordine $t$ e altezza $h$ è quindi $2t^h-1$

Se l'altezza dell'albero è $h$, allora il numero di chavi è $n \ge 2t^h -1 \; \Rightarrow \; t^h \le \dfrac{n+1}{2} \; \Rightarrow \; h \le \log_t \dfrac{n+1}{2}$
Di conseguenza se ci sono $n$ chiavi, l'altezza sarà al massimo $\log_t \dfrac{n+1}{2}$

Scegliendo $t$ in maniera opportuna si può ridurre di molto il valore dell'altezza $h$ dell'albero. Bisogna però stare attenti a non scegliere un valore di $t$ troppo elevato per evitare di rendere troppo costosa la ricerca di un elemento all'interno di ciascun nodo.

#### Operazioni

##### Ricerca

Durante la ricerca si alternano due operazioni:

1. la ricerca in un singolo nodo, che è di fatto una ricerca in un array ordinato con al più $2t-1$ elementi
2. lo spostamento nel sottoalbero indicato dalle guide

La ricerca della chiave nel singolo nodo, che è implementato come un array ordinato, avviene tramite ricerca binaria. Il risultato di questa ricerca sarà o la chiave che si sta cercando, o la posizione del sottoalbero in cui proseguire. Dato che ogni nodo ha al più $2t-1$ elementi ordinati, verranno svolti $\Theta(\log t)$ passi in ognuno di essi.

Una volta che si scende nel sottoalbero individuato in base alla ricerca binaria precedente, bisogna rifare tale ricerca nel nuovo nodo raggiunto. Sia $h$ l'altezza dell'albero. Si dovrà scendere nel B-albero di al più $h$ passi, e in ciascuno di questi si dovrà fare una ricerca binaria.

$\#\, \text{passi totali} = \Theta(h \log t)$

***Osservazione***
*La condizione sul numero massimo di chiavi in un nodo ci garantisce che la ricerca binaria si faccia in $\log t$ passi, mentre quella sul numero minimo è necessaria al fine di evitare che l'albero sia poco pieno e di conseguenza abbia un'altezza $h$ elevata.*

######  Analisi

La ricerca svolge $\Theta(h \log t)$ passi. Tramire la relazione $h \le \log_t \dfrac{n+1}{2}$, dove $n$ rappresenta il numero di chiavi, e considerando una base $b$ qualsiasi per $\log t$ si deduce che:
$$
\begin{flalign}
& h \log_b t \le \log_t \dfrac{n+1}{2} \cdot \log_b t = \log_t \dfrac{n+1}{2} \cdot \dfrac{1}{\log_t b} = \dfrac{\log_t \frac{n+1}{2}}{\log_t b} = \log_b \dfrac{n+1}{2} \\[-2em]
& \small \hspace{14.2em} \downarrow \hspace{16.8em} \downarrow \\[-2em]
& \small \hspace{9em} \log_b t = \dfrac{\cancel{\log_t t}^{\normalsize \text{1}}}{\log_t b} = \dfrac{1}{\log_t b}
	\hspace{8.5em} \text{cambio di base}
&&\end{flalign}
$$
$\#\, \text{passi di ricerca} = \Theta(\log n) \;\Rightarrow\; $ è indipendente da $t$, *che scompare con il cambio di base*. $n$ è il numero di chiavi dell'albero *(e non di nodi)*

> $\text{Cambio di base per i logaritmi: } \; \log_a b = \dfrac{\log_c a}{\log_c b} \;\; \Rightarrow \;\; \log_a b \cdot \log_b c = \log_a c$

**Accessi a memoria secondaria**
Bisogna minimizzare non solo il numero di chiavi da controllare, ma anche il numero di accessi alla memoria secondaria. Si sceglie l'ordine $t$ in modo che ogni nodo sia contenuto interamente in un blocco su disco.
*Quando si accede ad una chiave in un nodo, si carica tutto il blocco in cui tale chiave è contenuta in una volta. Scegliendo $t$ in quel modo, con un unico accesso a memoria si ottengono tutte le chiavi del nodo.*
Il numero di accessi a memoria che si fa durante una ricerca diventa quindi pari alla profondità dell'albero:
$$
\begin{flalign}
& \#\, \text{accessi a memoria} \approx \text{altezza albero}\approx \log_tn
&&\end{flalign}
$$
Se si utilizzasse un albero AVL o $2$-$3$, il numero di accessi sarebbe sempre pari alla profondità dell'albero, e quindi circa $\log_2 n$. La differenza tra le due è significante in quanto $t$ è scelto con un valore abbastanza sostanzioso.

*Si supponga di avere $10^6 \approx 2^{20}$ chiavi. Sia l'ordine $t=100$. Negli alberi AVL il numero di accessi al disco sarebbero $\log_2 10^6 \approx \log_2 2^{20} = 20$. Con i B-alberi invece si hanno $\log_{100} 10^6 = 3$ accessi al disco.*



##### Inserimento e bilanciamento

I dati vengono sempre inseriti nelle foglie. Inizialmente si ricerca quindi la foglia in cui va inserito l'elemento, e una volta trovata si presentano due casi:

1. Nella foglia, che può contenere al massimo $2t-1$ chiavi, c'è spazio. In questo caso si inserisce l'elemento al posto giusto (si ricordi che la foglia è un array ordinato).
    La ricerca costa $\Theta(\log n)$ mentre l'inserimento nell'array ordinato costa $\mathcal{O}(t)$

2. Se la foglia è piena, e ci sono quindi già $2t-1$ chiavi, allora si fa uso di un'operazione di `split` analoga a quella degli alberi $2$-$3$. Si dividono le chiavi della foglia in tre gruppi: $t-1$ chiavi finiscono nella prima parte, $1$ singolo elemento finisce nel padre e le restanti $t$ chiavi finiscono nella seconda parte.
    L'operazione di aggiornamento può propagare gli `split` verso l'alto: il padre infatti potrebbe essere già pieno e l'aggiunta di quel singolo elemento ne può provocare la divisione, e così via. È analoga agli alberi $2$-$3$.

Il costo totale dell'inserimento è $\Theta(t \log n)$. Questo perché nel caso peggiore può capitare che lo `split` di una foglia si propaghi fino alla radice, e bisogna quindi fare degli inserimenti in array ordinati per tutti i nodi lungo il cammino.

##### Cancellazione

Per la cancellazione si adotta una strategia analoga tramite l'operazione inversa dello `split`, ossia il `merge`. Il costo è lo stesso dell'inserimento.



##### Riepilogo operazioni

Sia $n$ il numero di chiavi del B-albero. Se questa struttura è implementata adeguatamente, ossia se ogni nodo è presente in un singolo blocco su disco, le operazioni presentate avranno i seguenti costi:
$$
\begin{flalign}
\begin{array}{l|c|c}
\textbf{Operazione} & \textbf{Passi di calcolo (tempo)} & \textbf{Accessi a memoria di massa} \\[0.5em]
\hline
\text{Ricerca} & \Theta(\log n) & \approx \log_t n \\
\text{Inserimento / Cancellazione} & \Theta(t \log n) & \approx C \cdot \log_t n \\
\end{array}
&&
\end{flalign}
$$
$C$ è una costante piccola, e il suo valore dipende dall'implementazione. Indicativamente $C \approx 4$.



****

### Dizionario

Il dizionario è una collezione di elementi ciascuno dei quali è identificato da una chiave. Le operazioni fondamentali sono quelle di ricerca, inserimento e cancellazione.

Le implementazioni principali sono tramite array (strutture indicizzate) o tramite alberi (strutture dinamiche).

###### Costi operazioni su dizionari

Il numero di confronti per ciascuna operazione in funzione del numero $n$ di chiavi è:
$$
\begin{flalign}
\begin{array}{l|c|c|c}
 & ~~\textbf{ Ricerca } ~~&~~ \textbf{ Inserimento } ~~& ~~\textbf{ Cancellazione }~~ \\[0.5em]
\hline
\textbf{Array ordinati}           & \Theta(\log n) & \Theta(n)     & \Theta(n)     \\
\textbf{Alberi binari di ricerca} ~~& \Theta(n)      & \Theta(n)     & \Theta(n)     \\
\textbf{Alberi AVL / 2-3}         & \Theta(\log n) & \Theta(\log n)& \Theta(\log n)\\
\end{array}
&&\end{flalign}
$$
**Svantaggi:**

- **Array ordinati:** capacità fissa
- **Alberi binari di ricerca / bilanciati:** maggiore uso di memoria per via dei puntatori

## Tabelle Hash

Una tabella di hash è una struttura dati che permette di implementare un dizionario, ossia una mappa che associa delle chiavi a dei valori. L’idea fondamentale è quella di utilizzare una funzione, detta **funzione hash**, che trasforma una chiave in un indice di un array. Questo consente di accedere direttamente ai dati in modo efficiente.

Sia $U$ l'universo delle chiavi e sia $\{ 0, \cdots, m-1 \}$ lo spazio degli indici. La funzione di hash è definita come $h: U \rightarrow \{ 0, \cdots, m-1 \}$ ed associa ad ogni chiave dell'universo uno degli $m$ indici.

La tabella hash non è altro quindi che un array di $m$ posizioni.

###### Fattore di carico $\boldsymbol{\alpha}$

$$
\begin{flalign}
\alpha = \dfrac{n}{m} \;\, \text{ dove } \; \biggl\{ \;
\begin{array} 
& n = \#\, \text{elementi memorizzati nella tabella} \\
m = \#\, \text{posizioni disponibili nella tabella} ~~
\end{array}
&&\end{flalign}
$$

Perciò $\alpha$ è un valore compreso tra $0$, che indica che la tabella sia vuota, e $1$, che indica che la tabella sia piena.

#### Tabelle ad accesso diretto

La tabella di hashing più semplice è la tabella ad accesso diretto. Si supponga che le chiavi siano interi univoci nel range $0\, ..m{-}1$, con quindi $U =\{ 0, \cdots, m-1 \}$. Di conseguenza si avrà un array di $m$ posizioni. Come funzione di hash si utilizza $h(i)=i$, la funzione identità. Questo significa che il record che ha chiave $i$ viene collocato direttamente nella posione $i$ dell'array $v$, e vi si può accedere per una qualsiasi operazione tramite `v[i]`.

Le operazioni di ricerca, inserimento e cancellazione avvengono in tempo costante $\mathcal{O}(1)$ in quanto la posizione è nota immediatamente, e l'accesso a qualsiasi posizione in un array avviene in tempo costante.

Questo è un approccio efficiente dal punto di vista delle operazioni e semplice (non vi sono infatti collisioni perché ogni chiave ha una posizione univoca). Il limite principale di questo approccio emerge quando le chiavi assumono valori molto elevati. In questo caso l’array deve avere dimensione pari all’intero intervallo di possibili chiavi, il che porta a due problemi:

- **spreco di memoria:** se $n$ è molto più piccolo di $m$, il fattore di carico $\alpha$ sarà molto vicino allo $0$ e l’array risulterà essere per la maggior parte vuoto
- **scalabilità:** per universi di chiavi molto ampi, la dimensione dell’array diventa impraticabile, rendendo l’approccio ad accesso diretto inefficiente dal punto di vista dell’uso della memoria.

<div alt="page-break" class="page-break"></div>

#### Funzione hash perfetta

Una funzione di hash $h : U \rightarrow \{ 0, \cdots, m-1 \}$ è detta perfetta se è iniettiva, ossia se $\forall u, v \in U \;\;~ u \neq v \Rightarrow h(u) \neq h(v) $

Nella pratica, salvo casi particolari, il numero di chiavi possibili (ossia $\#U$) è più grande del numero di chiavi attese, e la dimensione $m$ della tabella viene scelta paragonabile al numero di chiavi attese. Diviene quindi impossibile usare funzioni di hash perfette dato che bisognerebbe fare una tabella sovradimensionata con un fattore di carico vicino allo zero.

Si utilizzano quindi delle funzioni di hash che non sono perfette e che possono però generare delle collisioni. Una **collisione** avviene quando, dovendo inserire o cercare una chiave $x$, la posizione $h(x)$ è già occupata da un'altra chiave $y$.

Ci si può occupare delle collisioni in due modi diversi:

- si fa in modo che avvengano raramente. La funzione di hash $h$ deve quindi sparpagliare le chiavi nella tabella in modo che le collisioni siano poco probabili.
- su ha una strategia per gestire le collisioni nel caso esse accadano.

### Definizione di funzioni hash

#### Sparpagliamento e uniformità

Sia $h: U \rightarrow \{ 0, \cdots, m-1 \}$ una funzione hash. 
Per una chiave $x \in U$, definiamo $\mathcal{P}(x)$ come la probabilità che, scegliendo a caso una chiave da $U$, si scelga proprio $x$.
Per $i = 0, \cdots, m-1$ definiamo $Q(i) = \sum_{\large x\, :\, h(x)\, =\, i} \mathcal{P}(x)$ come la probabilità che una chiave scelta a caso da $U$ abbia valore hash $i$.

La funzione hash $h$ è **uniforme** se la probabilità $Q(i)$ che un elemento sia associato alla posizione $i$ è $Q(i) = \dfrac{1}{m}$, ovvero se distribuisce uniformemente le chiavi nello spazio degli indici.

**Buona funzione hash**
Una buona funzione hash, oltre ad essere uniforme, deve essere anche **veloce da calcolare**. Se il calcolo richiede troppo tempo si perde il principale vantaggio delle tabelle hash, ovvero l’accesso diretto e immediato agli elementi.
Il valore di una buona funzione hash deve inoltre dipendere da tutta la chiave e non solo da una parte di essa.

**Da chiave non intera ad intera**
Si osserva che si può sempre ricondurre una chiave non intera ad un intero, guardando la sua rappresentazione. Sia $y$ una chiave non intera rappresentata dai bit $y_0, \cdots, y_l$ con $y_i \in \{0,1\}$ per ogni $i \in \{0, \cdots, l\}$, allora si associa ad $y$ il numero $b(y)$ ottenuto guardando i bit della rappresentazione di $y$ come un numero binario:
$$
b(y) = \sum_{i=0}^l y_i \cdot 2^i
$$
Ora verranno illustrati dei metodi generali per costruire delle funzioni hash con una buona uniformità.

##### Metodo della divisione

Questo metodo trasforma la chiave in un intero binario, la divide per la dimensione $m$ della tabella e considera il resto:
$$
& h(x) = x\ \text{mod}\, m \\[-2em]
& \small \hspace{3.58em} \downarrow \\[-2em]
& \small \hspace{2.9em} \text{in binario}
$$
In genere una tabella di hash ha come dimensione $m$ una potenza di $2$. Essendo la chiave $x$ considerata come un intero binario, il valore della funzione hash sarà dato dagli ultimi $\log_2 m$ bit di $x$. Quindi il risultato dipenderà solo dalla parte finale dei bit dell'input.

Questo rende facile da calcolare la funzione di hash, ma allo stesso tempo anche non uniforme. Si prenda infatti un universo composto interamente da chiavi che sono multipli di $m$, allora si avrebbe $h(x)=0$ per ogni chiave $x$, e quindi tutte le chiavi colliderebbero nella stessa cella. Questo implicherebbe che $Q(0)=1$ e $Q(i)=0$ per ogni $i \in \{ 1, \cdots, m-1 \}$. La bontà del metodo della divisione dipende quindi dalla scelta di $m$, e come visto precedentemente la scelta $m = 2^i$ non è buona in questo caso.

Per migliorare la distribuzione si potrebbe scegliere come $m$ un numero primo non troppo vicino a una potenza di $2$.

##### Metodo del ripiegamento

Si consideri una tabella con dimensione $m=2^k$, ossia una potenza di $2$. Sia $x$ una chiave in binario, questo metodo suddivide i bit della rappresentazione della chiave in $l$ blocchi $x_1, \cdots, x_l$ di $k$ bit ciascuno. Si applica poi ai blocchi $x_i$ una funzione $f: U^l \rightarrow \{ 0, \cdots, m \}$, ovvero $h(k) = f(x_1, \cdots, x_l)$.

Ad esempio si potrebbe applicare l'operazione di XOR tra i blocchi $x_i$, oppure applicare il metodo della divisone ad ogni $x_i$ per poi concatenare i risultati.

Il vantaggio di questa tecnica è che garantisce una buona uniformità ed è abbastanza facile da calcolare.

### Gestione delle collisioni

Si ha una collisione quando la posizione che dovrebbe essere utilizzata per una chiave $x$ è già occupata da una chiave differente $y$. Ci sono tecniche per gestire le collisioni esterne (che usano delle strutture ausiliarie) e interne.

*Con le esterne è possibile memorizzare più dati rispetto alla dimensione della tabella proprio perché ci si appoggia a strutture esterne, mentre con le interne il numero di record $n$ che si possono memorizzare è minore o uguale alla dimensione $m$ della tabella (proprio perché non si ha altro spazio oltre a quello della tabella)*

### Gestione delle collisioni esterna

#### Liste di collisione

La tabella di grandezza $m$ è un array di puntatori: perciò ogni posizione contiene il puntatore ad una lista concatenata. Questa lista lista contiene tutti gli elementi che hanno quella chiave hash.

- La posizione $i$ contiene ogni record la cui chiave $x$ ha valore hash $i$, cioè $h(x) = i$

Questa gestione per le collisioni è anche detta concatenamento esterno.

<div>
    <img src="/Users/kevinmuka/Library/Application%20Support/typora-user-images/image-20250305085823065.png" alt="image-20250305085823065" style="zoom:18%; margin-top:-15px; margin-bottom:-15px" />
</div>

Come struttura dati si utilizza un array `v[0,...,m-1]` di liste di coppie `<elemento, chiave>`. L'elemento di chiave $k$ finisce nella lista di posizione $h(k)$.

###### Operazioni

Si supponga che la funzione hash $h$ sia veloce da calcolare, e che quindi il suo costo sia costante. Sia $n$ il numero di elementi memorizzati nella tabella ed $m$ il numero di posti disponibili.

**Inserimento**
`inserimento(elemento e, chiave k)`: se si fa l'inserimento all'inizio della lista (come le pile) si svolgono $\mathcal{O}(1)$ passi.

**Ricerca**
`ricerca(chiave k) -> elemento`: il tempo dipende dalla lunghezza della lista in cui si trova l'elemento, e quindi dalla lunghezza massima delle liste. 

- **Caso peggiore**: si verifica quando $n$ elementi finiscono tutti nella stessa lista, e si svolgono quindi $\mathcal{O}(n)$ passi.

- **Caso medio**: se la funzione hash sparpaglia bene, in media la lunghezza delle liste sarà $\max(1,\alpha = \dfrac{n}{m})$. *Se $n$ è minore di $m$, si ha un numero minore di $0$ e quindi l'$\mathcal{O}$ non è ben definito. Per questo in quel caso si prende $1$ in quanto almeno un passo va fatto*. Il numero di passi medio sarà quindi $T_{arg}(n) = \mathcal{O}(\max(1, \dfrac{n}{m})) = \mathcal{O}(1+\dfrac{n}{m})$.

**Cancellazione**
`cancellazione(chiave k)`: per la cancellazione si possono fare le stesse considerazioni della ricerca.

<div alt="page-break" class="page-break"></div>

L'**agglomerazione** è la presenza di zone in cui si concentrano molti dati. Se la funzione hash non sparpaglia bene si potrebbero formare alcune liste molto lunghe.

### Gestione delle collisioni interna

#### Indirizzamento aperto

L'indirizzamento aperto permette a un elemento con una certa chiave di occupare l'indice di un'altra chiave.

###### Funzione ausiliaria

Durante l'inserimento di una chiave $k$, se l'indice $h(k)$ è già occupato allora si cerca un'altra posizione libera utilizzando una strategia predefinita. La sequenza delle posizioni da cercare è data dalla **funzione ausiliaria** $c(k,i)$ dove $k$ indica la chiave ed $i$ è un intero che indica l'ordine nella scansione tale che $0 \le i \lt m$.

Per trovare il posto in cui collocare l'elemento di chiave $k$ si parte da $h(k)$ e si ispezionano le celle della tabella secondo una sequenza opportuna di indici $c(k,0)=h(k),\, c(k,1),\, c(k,2),\, \cdots, \, c(k, m-1)$. Ci si ferma non appena viene trovata una cella vuota. La funzione ausiliaria $c$ deve rispettare due requisti:

- **punto di partenza**: $c(k,0) = h(k)$
- **copertura parziale**: $\{ c(k,0),\, c(k,1),\, \cdots,\, c(k,m-1) \} = \{ 0,1,\cdots,m-1 \}$ ovvero deve garantire che tutti gli indici siano analizzati così che, se esiste una cella vuota, il metodo prima o poi la considera.

Esistono diverse modalità per definire $c(k,i)$. Di seguito vengono proposte la scansione lineare, quella quadratica e l'hashing doppio.

##### Scansione lineare

Una prima strategia semplice è la scansione lineare: se il posto è occupato, si cerca il prossimo posto libero seguendo linerarmente la tabella. La sequenza di scansione è definita come:
$$
c(k,i) = (h(k)+i) \text{ mod }m \quad \text{ per } i \text{ tale che } 0 \le i \lt m
$$
Se si utilizza una funzione di hash non buona, si troveranno dei punti nella tabella hash in cui si concentrano più chiavi. Si verifica perciò un'**agglomerazione primaria**: a forza di inserire elementi si vanno a creare zone di memoria con grandi quantità di elementi.

**Ricerca**
Si applica la funzione hash alla chiave e si accede alla posizione data dall'hashing. A questo punto si possono verificare due casi:

- l'elemento è presente oppure la cella è vuota. Si conclude la ricerca rispettivamente con esito positivo o negativo.
- l'elemento non è presente però la cella è occupata. Bisogna continuare la ricerca proseguendo nelle posizioni successive, e ci si ferma solo quando si trova l'elemento oppure si trova una cella vuota.

Così facendo non c'è bisogno di scansionare l'intera tabella ma solo una parte di essa.

##### Scansione quadratica

Un altro modo classico di definire $c(k,i)$ è il seguente:
$$
c(k,i) = \left\lfloor ~h(k) + c_1i + c_2 i^2 ~  \right\rfloor \text{ mod } m \quad\; \text{per ogni } 0 \le i \lt m \text{e per $c_1, c_2$ opportuni}
$$
Si può dimostrare che, scegliendo ad esempio $c_1 = c_2 = 0,5$ ed $m$ potenza di $2$, la sequenza $c(k,i)$ contiene tutti gli indici in $\{ 0, \cdots, m-1 \}$, e permette perciò di scandire tutta la tabella.

Nonostante la scansione quadratica distribuisca le chiavi in modo da evitare l'agglomerazione primaria, ogni coppia di chiavi $k_1$ e $k_2$ con $h(k_1) = h(k_2)$ continua a generare la stessa sequenza di scansione. Questo dà luogo alla cosiddetta **agglomerazione secondaria**.

<div alt="page-break" class="page-break"></div>

##### Hashing doppio

Un metodo per eliminare il fenomeno dell'agglomerazione è quello dell'hashing doppio. L'idea è quella di far dipendere dalla chiave anche il passo di incremento dell'indice usando una seconda funzione hash:
$$
c(k,i) = \left( h(k) + ih'(k) \right) \text{ mod } m \quad  \text{dove $h': U \rightarrow \{0, \cdots, m-1\}$ è una seconda funzione hash}
$$
In questo modo, anche se due chiavi collidono, la sequenza di scansione sarà diversa. Affinché per una certa chiave $k$ la sequenza $c(k,i)$ contenga tutti gli indici in $\{ 0, \cdots, m-1 \}$, è necessario che $m$ e $h'(k)$ siano primi fra loro.

- Per esempio si potrebbe scegliere $m$ primo, $h(k)= k \text{ mod } m$ e $h'(k)= \left( k \text{ mod } (m-1)\right) +1$

La situazione ideale si presenta quando $\, \forall k_1,k_2 \in U \,\text{ se }\, h(k_1) = h(k_2) \Rightarrow h'(k_1) \not = h'(k_2)$. Così facendo si garantisce la massima dispersione degli elementi, riducendo quindi la probabilità di collisioni ripetute.

Ci sono possibilità di avere agglomerazioni secondarie, sebbene queste siano ridotte.



##### Operazioni

La tabella di hash è rappresentata come un array `v[0..m-1]`. Si supponga di adottare una gestione delle collisioni ad indirizzamento aperto.

###### Inserimento

Si supponga di dover inserire un elemento `e` con chiave `k`. Inizialmente si verifica che `v[h(k)]`, che corrisponde a `v[c(k,0)]`, sia vuota: in questo caso `(e,k)` viene inserito in `v[h(k)]`. Altrimenti si ha una collisione ed è quindi necessario trovare una cella vuota. Utilizzando la funzione ausiliaria si continua a cercare una cella vuota, e nel caso in cui siano state controllate tutte le `m` posizioni e non la si trovi, si solleva un errore in quanto la tabella è piena.

```
Inserimento(elemento e, chiave k)
	i <- 0
	WHILE i < m AND v[c(k,i)] è occupata DO
	│	i <- i + 1
	IF i < m THEN v[c(k,i)] <- (e, k)	// inserisci elemento
	│		 ELSE errore				// tabella piena
```

###### Ricerca

L'operazione di ricerca è molto simile a quella di inserimento. Se durante la scansione delle celle, tramite l'utilizzo della funzione ausiliaria, viene trovata una cella che contiene la chiave cercata l'operazione restituisce l'elemento trovato. Se invece si arriva ad una cella vuota o si è scandita senza successo tutta la tabella si restituisce `null`.

```
Ricerca(chiave k) -> elemento
	i <- 0
	WHILE i < m AND v[c(k,i)] è occupata AND v[c(k,i)].chiave != k DO
	│	i <- + 1
	IF i = m OR v[c(k,i)] è libera THEN
	│	RETURN null					// non c'è
	ELSE
	│	RETURN v[c(k,i)].elemento	//trovato
```

###### Cancellazione

In una tabella hash con indirizzamento aperto, la cancellazione viene effettuata in maniera logica anziché fisica. Questo perché, se una cella venisse semplicemente segnata come vuota, la ricerca potrebbe interrompersi prematuramente, interrompendo la catena degli indici derivante dalla funzione ausiliaria $c(k,i)$ e facendo sì che alcuni elementi non vengano trovati. Pertanto, si marca la cella come "cancellata" (ad esempio tramite un bit di validità) in modo da preservare il percorso di ricerca, garantendo così l’integrità della tabella.

<div alt="page-break" class="page-break"></div>

###### Elencare gli elementi ordinati per chiave

Un'altra operazione che potrebbe essere utile per i dizionari potrebbe essere quella di elencare tutti gli elementi del dizionario in ordine di chiave. Negli alberi binari di ricerca o AVL per svolgere questo compito basta fare una visita in profondità in ordine simmetrico.

Se si prende una tabella hash questa operazione non è più possibile, in quanto per il principio di uniformità queste tabelle funzionano meglio proprio quando gli elementi sono il più sparpagliati possibili. Bisogna copiare gli elementi in una struttura ausiliaria e fare il sort di quella struttura.



##### Costo delle operazioni

I costi di ricerca, inserimento e cancellazione, con una gestione delle collisioni interna, dipendono dal costo di scansione (ossia dal numero di posizioni da visitare). È facile verificare che il costo di un'operazione di inserimento sia al più quello di un'operazione di ricerca nel caso di insuccesso (ossia di elemento non trovato).

Sia $n = \# \, \text{chiavi presenti}$ e sia $m = \text{dimensione tabella}$. Si ricordi che $\alpha = \dfrac{n}{m}$ è il fattore di carico della tabella.

**Caso peggiore**: si devono scandire tutte le chiavi presenti nella tabella $\rightarrow \Theta(n)$ passi

**Caso medio**
Si ha quando la funzione di hash è uniforme, e quindi sparpaglia bene gli elementi:
$$
\begin{flalign}
\begin{array}{>{\bf}l|>{\bf}c}

\textbf{ numero di passi} & \textbf{scansione lineare} & \textbf{scansione quadratica / hashing doppio } \\[0.5em]

\hline
\text{ chiave trovata} & \dfrac{1}{2} + \dfrac{1}{2(1-\alpha)} & - \dfrac{1}{\alpha} \log_e (1- \alpha) \\[0.5em]
\hline
\text{ chiave non trovata} & \dfrac{1}{2} + \dfrac{1}{2(1-\alpha)^2} & \dfrac{1}{1-\alpha} \\

\end{array}
&& \end{flalign}
$$
Il numero di passi di calcolo non dipende quindi esclusivamente dal numero di chiavi $n$, ma dipende da quanto la tabella sia piena, ossia dal fattore di carico $\alpha$. Si prenda il caso in cui non si trovi una chiave in un hashing doppio, in base al riempimento della tabella il costo delle operazioni infatti varia:
$$
\begin{flalign}
\dfrac{1}{1-\alpha} = 
\begin{cases}
\text{ se } \alpha = \dfrac{1}{2} \quad & \dfrac{1}{1-\alpha} = 2 \quad \text{ tempo costante }\\[0.4em]
\text{ se } \alpha = \dfrac{3}{4} \quad & \dfrac{1}{1-\alpha} = 4 \quad \text{ tempo costante }\\[0.4em]
\text{ se } \alpha \rightarrow 1 \quad & \dfrac{1}{1-\alpha} \rightarrow \infin \\
\end{cases}
&&\end{flalign}
$$
È quindi bene fare in modo che le tabelle di hash non siano piene per fare in modo che le prestazioni non degenerino. Nella pratica si fissa come valore massimo di $\alpha$ $1/2$ oppure $3/4$, e nel caso in cui $\alpha$ superi il valore fissato si effettua il rehashing.



### Rehashing

Quando la tabella viene riempita oltre un certo fattore di carico stabilito, ne viene creata una più grande (di solito il doppio) in cui ricollocare tutti gli elementi. I problemi principali di questa operazione sono la definizione di una nuova funzione hash da adottare nella nuova tabella e i costi in termini di tempo dell'operazione stessa.

Di solito la funzione hash è **parametrica** rispetto alla dimensione $m$ della tabella *(ossia dipende da quel parametro)*. Questa funzione si può infatti definire come $h_m(k) = f(k) \text{ mod } m$, dove $f(k)$ è un'altra funzione hash che restituisce un intero molto grande. Al risultato intero viene poi applicato il modulo rispetto ad $m$. Per svolgere questo modulo in maniera efficiente si sceglie $m$ in modo tale che sia una potenza di $2$ *(così facendo basta prendere gli ultimi $\log_2 m$ bit del numero)*. Si nota come, se la prima funzione $f$ è uniforme, allora lo sia anche la seconda $h_m$. 
Il tutto torna utile quando si fa rehashing, in quanto per definire una nuova funzione hash basta modificare il numero per il quale viene fatto in modulo, ossia $m$, con il nuovo valore della dimensione della tabella.

<div alt="page-break" class="page-break"></div>

###### Analisi del tempo

Ora si procederà facendo un'analisi ammortizzata del tempo. Si consideri una tabella di hash di dimensione iniziale $m$ e sia il fattore di carico massimo consentito $\alpha = 1/2$, allora l'operazione di rehashing viene effettuata ogni qualvolta che si debba inserire in una tabella piena al $50\%$. 

Si indichi con $T_i$ la tabella con $i=0,\cdots,k\,$ operazioni di rehashing, allora:
$$
\begin{flalign}
\begin{array}{c|c|c|c|c|c}
\textbf{} & \mathbf{T_0} & \mathbf{T_1} & \mathbf{T_2} & \dots & \mathbf{T_k} \\[0.4em]
\hline
\textbf{Dimensione} & m &~ 2m ~&~ 2^2m ~& ~\dots~ & 2^k m~ \\[0.4em]
\hline
\textbf{Max elem. (50\%)} & ~m/2~ & m & 2m & \dots & ~2^{k-1}m~ \\
\end{array}
&& 
\end{flalign}
$$
Si conclude quindi che $T_k$ abbia dimensione $2^k m$ e che possa contenere al più $2^{k-1}m$ elementi.

Si supponga che, partendo da una tabella vuota, venga effettuata una sequenza di operazioni tra cui $N$ inserimenti. Per contenere $N$ chiavi è necessaria una tabella $T_k$ con $k$ minimo intero tale per cui $2^{k-1}m \ge N$. Dunque sono necessari $k$ rehashing calcolati come:
$$
\begin{flalign}
& 2^{k-2} m < N \leq 2^{k-1} m 
\quad \Rightarrow \quad 2^{k-2} ~~\lt~~ \frac{N}{m} ~~\leq~~ 2^{k-1} 
\quad \Rightarrow \quad 1 + \log_2 \frac{N}{m} \leq k < 2 + \log_2 \frac{N}{m}
\\[-1pt]

& \hspace{15.1em} \downarrow \hspace{3.2em} \downarrow\\[-2pt]
& \hspace{11.2em} \small k < 2 + \log_2 \frac{N}{m} \hspace{1.7em} 1 + \log_2 \dfrac{N}{m} \le k \\[-2em]
&&\end{flalign}
$$
Di conseguenza si arriva alla conclusione che: $k = 1 + \left\lceil \log_2 \dfrac{N}{m} \right\rceil$

Si osserva che le chiavi da trasferire da $T_i$ a $T_{i+1}$ sono il numero massimo di elementi che $T_i$ può contenere, ossia $2^{i-1}m$. Perciò da $T_0$ a $T_k$ il numero di chiavi da trasferire sarà:
$$
\begin{flalign}
& \sum_{i=0}^{k-1} 2^{i-1} m = m \sum_{i=0}^{k-1} 2^{i-1} = \dfrac{m}{2} \sum_{i=0}^{k-1} 2^i = \dfrac{m}{2} \left( 2^k - 1 \right) \lt \dfrac{m}{2} \left( 2^{\,\large 2+\log_2 \tfrac{N}{m}} -1 \right) \\[-2em]
& \hspace{21.77em} \downarrow \\[-0.1em]
& \hspace{15.3em} \small k = 1 + \left\lceil \log_2 \scriptsize{\frac{N}{m}} \right\rceil \lt 2 + \log_2 \scriptsize{\frac{N}{m}} \\[0.4em]
&\Rightarrow \dfrac{m}{2} \left( 2^2 \cdot \dfrac{N}{m} -1 \right) 
	\lt \dfrac{m}{2} \left( 2^{\,\large \log_2 \tfrac{N}{m}} \cdot 2^2 - 1\right) = 
	\dfrac{\cancel m}{\cancel 2} 2^{\cancel 2} \dfrac{N}{\cancel m} = 2N  - \dfrac{m}{2}
	\lt 2N \\
& \hspace{20.6em} \small \downarrow \\
& \hspace{17.3em} \small 2^{\,\large \log_2 \frac{N}{m}} = \dfrac{N}{2}
&&\end{flalign}
$$
In conclusione, per $N$ inserimenti effettivi di chiavi vi sono $\lt 2N$ inserimenti dovuti al rehashing, per un totale quindi di $\lt 3N$ inserimenti. Considerando che in media ogni operazione di inserimento usa tempo costante, possiamo allora dire che il tempo totale per inserire una sequenza di $N$ elementi con rehashing sia $\mathcal{O}(N)$. Applicando il costo ammortizzato questo tempo diventa costante per ogni singolo elemento di questa sequenza:
$$
T_{a}(N) = \dfrac{\mathcal{O}(N)}{N} = \mathcal{O}(1)
$$
Se ciascun inserimento costa $\mathcal{O}(1)$, anche se si effettua il rehashing il costo (ammortizzato) degli inserimenti rimane costate.

