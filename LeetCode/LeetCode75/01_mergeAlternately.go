package main

import (
	"fmt"
	"strings"
)

func mergeAlternately(word1 string, word2 string) string {
	ary1 := strings.Split(word1, "")
	ary2 := strings.Split(word2, "")

	ans := ""

	for len(ary1) != 0 || len(ary2) != 0 {
		if len(ary1) != 0 {
			ans += ary1[0]
			ary1 = ary1[1:]
		}
		if len(ary2) != 0 {
			ans += ary2[0]
			ary2 = ary2[1:]
		}
	}

	return ans
}

func main() {
	fmt.Println(mergeAlternately("abc", "pqr"))
	fmt.Println(mergeAlternately("ab", "pqrs"))
	fmt.Println(mergeAlternately("abcd", "pq"))
}
