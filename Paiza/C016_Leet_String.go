package main

import "fmt"

func main() {
	var str string
	leet := ""
	var leet_c string

	fmt.Scanf("%s", &str)

	for _, str_c := range str {

		switch str_c {
		case 'A':
			leet_c = "4"
		case 'E':
			leet_c = "3"
		case 'G':
			leet_c = "6"
		case 'I':
			leet_c = "1"
		case 'O':
			leet_c = "0"
		case 'S':
			leet_c = "5"
		case 'Z':
			leet_c = "2"
		default:
			leet_c = string(str_c)
		}

		leet += leet_c
	}

	fmt.Println(leet)
}
