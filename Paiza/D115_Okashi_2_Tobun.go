package main

import (
	"fmt"
	"math"
)

func main() {
	var a float64
	fmt.Scan(&a)

	fmt.Println(math.Trunc(a / 2))
}
