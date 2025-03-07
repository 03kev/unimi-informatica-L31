package main

import . "fmt"

func reverseArray(n int, v []int) {
	if n < 1 {
		return
	} 
	
	v[n-1], v[0] = v[0], v[n-1]
	reverseArray(n-2, v[1:n-1])
}

func main() {
	n := 10
	v := []int{4, 5, 1, 3, 5, 7, 10, 13, 1, 0}

	reverseArray(n, v)
	Println(v)
}

// RECURSIVE REVERSE SORTING ALGORITHM IN GOLANG