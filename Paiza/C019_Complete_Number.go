package main

import "fmt"

func main() {

	var cnt_end int
	var trgint int
	var trgint_list []int
	var sum_yakusu int

	fmt.Scanf("%d", &cnt_end)
	for i := 0; i < cnt_end; i++ {
		fmt.Scanf("%d", &trgint)
		trgint_list = append(trgint_list, trgint)
	}

	for _, num := range trgint_list {

		sum_yakusu = 0
		for child_num := 1; child_num <= (num / 2); child_num++ {

			if (num % child_num) == 0 {
				sum_yakusu += child_num
			}
		}

		if num == sum_yakusu {
			fmt.Println("perfect")
		} else if (num == sum_yakusu+1) || (num == sum_yakusu-1) {
			fmt.Println("nearly")
		} else {
			fmt.Println("neither")
		}
	}
}
