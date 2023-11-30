package main

import (
	"fmt"
)

func kidsWithCandies(candies []int, extraCandies int) []bool {
	is_geatest_ls := []bool{}
	for i, candies_cnt := range candies {
		is_greatest := true
		for j, candies_cnt2 := range candies {
			if i != j && candies_cnt+extraCandies < candies_cnt2 {
				is_greatest = false
			}
		}
		is_geatest_ls = append(is_geatest_ls, is_greatest)
	}

	return is_geatest_ls
}

func main() {
	fmt.Println(kidsWithCandies([]int{2, 3, 5, 1, 3}, 3))
	fmt.Println(kidsWithCandies([]int{4, 2, 1, 1, 2}, 1))
	fmt.Println(kidsWithCandies([]int{12, 1, 12}, 10))
}
