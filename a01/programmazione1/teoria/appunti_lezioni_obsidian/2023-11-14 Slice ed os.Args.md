<span style="color:#ad0b0b">DA RICONTROLLARE QUESTI APPUNTI</span>

cap(slice) restituisce la capacità della slice.
```go unwrap title:
func main() {
	list := []int{4, 5, 7, 9, 4}
	list = append(list, -3)
	Println(list, len(list), cap(list))
	/*la capacità iniziale è 5. Aggiunendo un elemento alla slice, dato 
	che questa ha lunghezza pari alla capacità, fa il raddoppio e la 
	lunghezza aumenta di 1 mentre la capacità raddoppia*/
}
```

```go unwrap title:
func main() {
	list := []int{4, 5, 7, 9, 4}
	a := list[1:3]
	a = append(a, 7) //il valore 7 viene aggiunto ad a e viene sovrascritto nella slice list. Lo stesso sarebbe successo se list fosse stata un'array
	Println(list, a)
}
```

Make restituisce una nuova slice di una lunghezza e di una capacità opzionale date.
```go unwrap title:
func main() {
	var s []int = make([]int, 10, 20)
	Println(s, len(s), cap(s))
}
```

```go unwrap title:
func f(s []int) {
	s = append(s, -1)
	s[0] = -10
	s = append(s, -3)
	s[0] = -12 // non ha effetto nei due esempi in quanto agisce sul nuovo array allocato
}

func main() {
	t := []int{1, 2, 3}
	f(t[:2]) /* f sovrascrive t[3] con -1, ma poi quando aggiunge il secondo 
	elemento, dato che la slice t ha capacità massima, alloca un nuovo array che
	quindi non influisce sulla slice originale */
	Println(t)
	
	r := []int{1, 2, 3}
	f(r[:3]) /* f non modifica r in quanto è piena, ma alloca un nuovo array
	che quindi non influisce sulla slice originale r */
	Println(r)
}
```

***

Le stringhe sono convertibili in slice di rune e viceversa: `{go}chars := []rune("string")`. Queste operazioni sono però costose perchè viene fatta una copia della stringa.
La conversione da runa a byte invece non è costosa.

`{go}len([]rune(s))` restituisce effettivamente il numero di rune all'interno della stringa: questa però è un'operazione che in programmi grandi può rivelarsi costosa.

```go unwrap title:
func main() {
	s := "ciao €😇"
	Println(len([]rune(s)), len(s))
}
```
 ***

Le subslicing concantenate (annidate, ossia subslicing su una subslice) non seguono la catena di riferimenti: ogni volta che si fa subslicing si crea una nuova slice con il puntatore che viene creato a partire dalla slice originale, e così via per la catena di subslicing. dato che tutti i puntatori vengono copiati, non c'è bisogno di risalire la catena per risalire all'array sottostante.

#### os.Args
È contenuto nella libreria "os". Args contiene una slice di stringhe che sono gli argomenti che vengono passati nella linea di comando a partire dal nome del programma.
Si dichiara come `{go}var os.Args[]string`
- Può essere utilizzato per ricevere degli input

```go unwrap title:
import "os"

func main() {
	args := os.Args[1:] // il primo elemento è l'eseguito
	Println(args)	
}
```

