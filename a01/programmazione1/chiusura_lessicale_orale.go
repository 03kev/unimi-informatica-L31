package main

import . "fmt"

func g(f func()) func() { // chiusura lessicale che mi ha chiesto all'esame
	return f
}

func h(g func(f func()) func()) func(f func()) func() {
	return g
}

func h2(g func() func()) func() {
	return g()
} 

func main() {
	x := 0
	f := func() {
		x++
	}

	g2 := func() func() {
		return f
	}

	Println(x) // 0
	g(f)() // ++
	h(g)(f)() // ++
	h2(g2)() // ++
	Println(x) // 3
}
