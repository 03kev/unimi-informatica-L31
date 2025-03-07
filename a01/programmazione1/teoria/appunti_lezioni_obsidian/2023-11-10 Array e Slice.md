Sono usate per rappresentare delle sequenze di dati omogenee.
#### Array
È una sequenza di dati omogenei di lunghezza fissa. Sono dei blocchi di memoria fissi che si comportano come delle variabili.

Gli array sono definiti dalla lunghezza e dal tipo: si dichiarano come`{go}var x [10]int`: è un array formato da 10 elementi interi che vengono inizialmente inizializzati come 0. La lunghezza deve essere fissa e deve essere nota al tempo di compilazione: non posso utilizzare una variabile.
- `x[i]` restituisce la variabile i-esima contenuta nell'array, con `i`  intero che parte da 0. L'indicizzazione degli array è compatibile con l'iterazione dei cicli stretti.
- In maniera analoga posso assegnare i valori dell'array alle posizioni i-esime: 
  `{go}x[i] = 3 //x[i] = 3` 
- Un'altro modo per dichiarare le variabili dell'array è: `{go}var x [5]int = [5]int{...}` dove all'interno delle `{ }` vanno inseriti i valori. Se questi non vengono passati tutti, l'array aggiungerà in fondo i valori di default del tipo (nel caso degli interi 0)
- `{go}len(x)` restituisce la lunghezza dell'array

```go unwrap title:"Scorrimento di un Array" warn:3
func main() {
	var x [5]int = [5]int{-3, -1, 2, 5} 
	//x[4] vale di default 0 in quanto non assegnato
	for i := 0; i < len(x); i++ {
		Print(x[i], " ")
	}
}
```

È possibile definire i valori dell'array in indici stabiliti: 
```go unwrap title:
func main() {
	var a[5]int = [5]int{1:-1, 3:21}
	Println(a, &a[0], &a[1], &a[2], &a[3], &a[4])
}
```
- Con &a[i] si ottiene l'indirizzo di memoria dell'elemento i-esimo nell'array 
#### Slice
Il modo in cui funzionano è molto specifico di Go. La slice è una sequenza di elementi di tipo omogenee, un array, ma di lunghezza variabile.
Le slice però, a differenza degli array, non sono dei blocchi di memoria ma si comportano come dei puntatori, in quanto non hanno una grandezza definita e potrebbero aver bisogno di essere salvate in parti di memoria diverse.

La slice si dichiara come `{go}var x []type` , e al momento dell'inizializzazione ha valore `nil`, che viene stampato a terminale con `[]`. Con `{go}var x []type = []type{valori}` è possibile assegnare dei valori alla slice.
- `{go}slice = append(slice, valore1, valore2, ...)` prende una slice, ne aggiunge degli elementi e restituisce una nuova slice con gli elementi della slice di partenza e quelli aggiunti.
- `x[i]` e `{go}len(x)` funzionano esattamente come gli array. L'unica differenza è che in parti diverse di codice `{go}len(slice)`  potrebbe restituire valori diversi in quanto ha una lunghezza variabile.

```go unwrap title:"for range con le slice" hl:6
func main() {
	list := []int{-3, -1, 0, 5, 11}
	for i, e := range list {
		Println(i, e)
	}
	/* Il for range è zucchero sintattico di un normale for:
	for i := 0; i < len(list); i++ {
		Println(i, list[i])
	}
	*/
}
```

###### Subslicing
Lo subslicing è un'operazione che si fa ad una slice per restituirne una sottosequenza.
Si fa tramite l'espressione `slice[x1:x2]` che accetta due valori interi e restituisce una nuova slice con gli elementi di quella originale che vanno da `x1` incluso ad `x2` escluso. Se uno o entrambi gli interi non vengono passati il primo varrà 0 mentre il secondo la lunghezza della slice.
>`slice[:]` restituisce la slice stessa

```go unwrap title:Subslicing
func main() {
	a := []int{1, 2, 3, 4, 5}
	b := a[2:5] //b è una sottolista
	Println(a, b)
}
```

- In Go le stringhe sono delle slice di byte immutabili: il metodo per ottenere delle sottostringhe, infatti, è uguale a quello per ottenere delle subslice. <ins>[link sottostringhe]</ins> 


###### Come funzionano le slice
Gli array sono dei tipi di base rappresentati in memoria che si comportano come tutti gli altri tipi di dati e vengono trattate per valore.
Le slice sono delle strutture che contengono 3 campi:
- 1° campo: un puntatore che punta al primo elemento in un array da qualche parte salvato in memoria.
- 2° campo: una lunghezza che definisce.
- 3° capacità: il massimo numero di elementi che la slice può contenere senza cambiare array.

La slice quindi non contiene veramente i valori, ma è un puntatore a questi valori che sono contenuti in un array.
La slice, essendo un puntatore, ha molti comportamenti che agiscono come tale: per esempio è possibile fare Aliasing.

- slice[i] restituisce quindi l'elemento i-esimo dell'array a partire dal puntatore in poi.
  L'indicizzazione parte quindi dal puntatore all'array in poi.
- Quando si fa append Go guarda se la capacità è maggiore della lunghezza: capisce se l'array può ancora contenere nuovi elementi. 
  Append crea una nuova slice che ha lo stesso puntatore della slice originale, ma ha la lunghezza aumentata (e nel mentre aggiunge il valore nell'array) e la capacità invariata.
  Se la lunghezza però è uguale alla capacità (l'array è quindi pieno), Go alloca in memoria un nuovo array grande il doppio del precedente. La prima metà del nuovo array è uguale a quello originale, poi gli viene aggiunto il contenuto dell'append e ha lunghezza aumentata e capacità doppia. Se poi non c'è poi nessuna slice che punta all'array originale, questo viene successivamente tolto dal garbage collector.
- subslicing `slice[x1:x2]`: restituisce una nuova slice con lo stesso puntatore della slice originale spostato di tante volte quanto l'indice iniziale `x2`. La lunghezza è pari alla differenza tra i valori `x1` e `x2` passati e la capacità è uguale a quella originale meno l'indice di partenza `x1`. 
  Facendo un append alla subslice, si vanno a sovrascrivere gli elementi successivi della slice originale, e modificando un valore in una delle due slice, cambia anche nell'altra.
	- facendo lo subslicing di un array (oltre ad ottenere l'aliasing) si ottiene l'unico caso [?]
  
  Problema con l'alisaing: le due slice si riferiscono allo stesso array, ma quando quella originale raddoppia, questa punterà a un nuovo array, mentre la subslice punterà ancora a quello vecchio

Quando si passano gli slice, si passa per valore il puntatore della slice (i suoi 3 campi), non l'array.

- Non viene creato un nuovo array con gli elementi in più perchè altrimenti, più grande diventa l'array, più volte verrà copiata e diventerà perciò una struttura più lenta. 
- Con il raddoppio la crescita è esponenziale, e quindi l'array sarà più veloce in quanto ci sarà bisogno di copiarla molte meno volte: il riallocamento diventerà esponenzialmente più raro. In questo modo il tempo di copiatura medio dell'array rimane costante.

***
