#### Funzioni ricorsive
```go unwrap title:"Funzione ricorsiva per il fattoriale"
func factorial(n int) int {
	if n == 0 {
		return 1
	}
	return n * factorial(n - 1)
}

func main() {
	var n int
	Println("Inserisci numero:"); Scan(&n)
	Println(factorial(n))
}
```

```go unwrap title:"Funzione per controllare le parole palindrome"
func palindromoRicorsivo(s []rune) bool {
	if len(s) < 2 { return true }

	if s[0] != s[len(s) - 1] { return false }
	
	return palindromoRicorsivo(s[1:len(s)-1])
}

func palindromoNonRiscorsivo(s []rune) bool {
	for i := 0; i < len(s) / 2; i++ {
		if s[i] != s[len(s) - i - 1] {
			return false
		}
	}
	return true
}

func main() {
	var s string
	Println("Inserisci stringa:"); Scan(&s)
	Println(palindromoRicorsivo([]rune(s)))
}
```

![[20231128_100040.jpg | 500]]
![[Pasted image 20231128102317.png]]
![[Pasted image 20231128102317.png]]

***

	os.Stdin
	os.Stdout
	os.Stderr

