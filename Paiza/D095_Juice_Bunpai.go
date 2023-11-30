package main

import "fmt"

func main() {
	var n int
	var m int

	fmt.Scanf("%d\n%d", &n, &m)

	fmt.Println(int(float64(n / m)))
}
