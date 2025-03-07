###### Tipi Funzionali
Servono ad organizzare non i dati come gli altri tipi, ma il codice. 
Si dichiara come `{go}var name func([arguments_types]) [return_type]` 
```go unwrap title:
func nothing (x int, s string) bool {
	return true
}
	
func main() {
	var x func(int, string) bool
	
	x = nothing
	Println(x(5, "hi"))
}
```

Si può far variare il comportamento delle funzioni a seconda del codice che viene loro passato:

```go unwrap title:
func product(x int, f func(int) int) int {
	return f(x)
}

func double(x int) int { return 2*x }

func triple(x int) int { return 3*x }

func main() {
	Println(product(5, double))
	Println(product(5, triple))

	f := func(x int) int {
		return x*4
	}
	Println(f(4), product(5, f))

	Println(product(20, func(y int) int { //funzione anonima
		return y*y 
	}))
}
```
Una funzione anonima è una funzione senza nome che può essere definita e utilizzata all'interno del codice. Ti consente di creare e utilizzare funzioni senza dover dichiarare esplicitamente una funzione separata con un nome.

###### Lexical Closure
Le chiusure lessicali sono supportate in golang.
Una funzione anonima può riferirsi a qualunque variabile del contesto lessicale (ossia dello stesso blocco in cui questa funzione anonima è definita) e la funzione può accedervi.

```go unwrap title:
import "sort"

func main() {
	s := []int{0, 5, -2, 10, -4, 8}
	sort.Ints(s)
	Println(s)
	
	sort.Slice(s, func(i, j int) bool {
		return s[i] > s[j]
	}) //la funzione anonima può accedere alla lista s dichiarata in precedenza
	Println(s)
}
```

```go unwrap title:
func g(h func()) {
	h()
}

func main() {
	x := 1
	f := func() {
		x += 1
	}

	g(f) //x = 2
	g(func() { 
		x += 1 //x = 3
	})
	Println(x)
}
```

```go unwrap title:
func main() {
	x := 1
	func (y int) {
		x += y
	}(20)
	Println(x)
}
```


```go unwrap title:
func count() func() int {
	var x int

	return func () int {
		x++
		return x
	}
}

func main() {
	c := count() // c tiene memoria del valore della variabile x
	d := count() // d tiene memoria del valore di un'altra istanza di x
	e := c // e è una forma di aliasing per riferirsi a c
	Println(c(), c(), c(), c())
	Println(d(), d(), c(), c(), d(), e())
}
```
>Una volta che c tiene conto dello stato di x, non è più possibile accedere ad x in nessun modo se non chiamando la funzione c

```go unwrap title:
func gen_fibonacci() func() int {
	var a, b int = 0, 1
	
	return func() int {
		a, b = b, a + b
		return a
	}
}

func main() {
	g := gen_fibonacci()
	h := gen_fibonacci()
	Println(g(), g(), g(), g(), g(), "\n", h(), h(), h(), "\n", g(), g(), g(), g())
}
```
