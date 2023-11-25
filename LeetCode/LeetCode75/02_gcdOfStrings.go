package main

import (
	"fmt"
	"strings"
	"unicode/utf8"
)

func gcdOfStrings(str1 string, str2 string) string {

	tmp_str := str1
	if utf8.RuneCountInString(str1) > utf8.RuneCountInString(str2) {
		tmp_str = str2
	}

	is_hit := false
	seed_str := ""

	for i := 0; i < utf8.RuneCountInString(tmp_str); i++ {
		seed_str = tmp_str[i:]

		if (len(strings.Replace(str1, seed_str, "", -1)) == 0) && (len(strings.Replace(str2, seed_str, "", -1)) == 0) {
			is_hit = true
			break
		}
	}

	if is_hit == true {
		return seed_str
	} else {
		return ""
	}
}

func main() {
	fmt.Println(gcdOfStrings("ABCABC", "ABC"))
	fmt.Println(gcdOfStrings("ABABAB", "ABAB"))
	fmt.Println(gcdOfStrings("LEET", "CODE"))
	fmt.Println(gcdOfStrings("AAA", "AA"))
	fmt.Println(gcdOfStrings("AAAA", "AA"))
}
