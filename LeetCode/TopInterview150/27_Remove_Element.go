package main

import (
	"fmt"
)

func removeElement(nums []int, val int) int {

	size := 0
	for i := 0; i < len(nums); i++ {
		if nums[i] == val {
			for j := len(nums) - 1; j > i; j-- {
				if nums[j] != val {
					tmp_num := nums[i]
					nums[i] = nums[j]
					nums[j] = tmp_num
				}
			}
		}
	}

	for k := 0; k < len(nums); k++ {
		if nums[k] != val {
			size++
		} else {
			break
		}
	}
	return size
}

func main() {
	nums1 := []int{3, 2, 2, 3}
	size := removeElement(nums1, 3)
	fmt.Printf("%v %d\n", nums1, size)

	nums1 = []int{0, 1, 2, 2, 3, 0, 4, 2}
	size = removeElement(nums1, 2)
	fmt.Printf("%v %d\n", nums1, size)

	nums1 = []int{4, 5}
	size = removeElement(nums1, 4)
	fmt.Printf("%v %d\n", nums1, size)
}
