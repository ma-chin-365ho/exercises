package main

import "fmt"

func main() {
	var n float64
	fmt.Scan(&n)

	fmt.Println(n * (n - 1) / 2)
}
