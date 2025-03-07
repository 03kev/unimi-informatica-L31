package main

import . "fmt"

func fibonacci(n int) int {
    if n <= 1 {
        return n
    } else {
        return fibonacci(n-1) + fibonacci(n-2)
    }
}

func main() {
	n := 9

	m := fibonacci(n)
	Println(m, 1)
}
