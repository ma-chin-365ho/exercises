package main

import "fmt"

func main() {

	var cnt_strike int
	var cnt_ball int
	var cnt_end int
	var str string
	var str_slice []string

	fmt.Scanf("%d", &cnt_end)
	for i := 0; i < cnt_end; i++ {
		fmt.Scanf("%s", &str)
		str_slice = append(str_slice, str)
	}

	for _, buf := range str_slice {

		if buf == "ball" {
			cnt_ball++
			if cnt_ball == 4 {
				fmt.Println("fourball!")
			} else {
				fmt.Println("ball!")
			}
		} else if buf == "strike" {
			cnt_strike++
			if cnt_strike == 3 {
				fmt.Println("out!")
			} else {
				fmt.Println("strike!")
			}
		}
	}

}
