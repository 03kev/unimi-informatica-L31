package main

import . "fmt"

func findMax(n int, v []int) int {
	m := 0
	mIndex := 0
	for i := 0; i < n; i++ {
		if m < v[i] {
			m = v[i]
			mIndex = i
		}
	}
	return mIndex
}

func sort(n int, v []int) {
	for i := 0; i < n; i++ {
		m := findMax(n - i, v[i:])
		v[i], v[m+i] = v[m+i], v[i]
	}
}

func main() {
	n := 10
	v := []int{4, 5, 1, 3, 5, 7, 10, 13, 1, 0}

	sort(n, v)
	Println(v)
}