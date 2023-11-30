package main

import "fmt"

func main() {
	var person int
	var h int
	var w int

	fmt.Scanf("%d\n%d %d", &person, &h, &w)

	fmt.Println((h * w) % person)
}
