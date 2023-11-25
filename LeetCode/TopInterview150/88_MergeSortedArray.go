package main

import (
	"fmt"
	"sort"
)

func merge(nums1 []int, m int, nums2 []int, n int) {
	for i := m; i < m+n; i++ {
		nums1[i] = nums2[i-m]
	}

	sort.Slice(nums1, func(i, j int) bool {
		return nums1[i] < nums1[j]
	})
}

func main() {
	nums1 := []int{1, 2, 3, 0, 0, 0}
	merge(nums1, 3, []int{2, 5, 6}, 3)
	for _, v := range nums1 {
		fmt.Printf("%d", v)
	}
	fmt.Println("")

	nums1 = []int{1}
	merge(nums1, 1, []int{}, 0)
	for _, v := range nums1 {
		fmt.Printf("%d", v)
	}
	fmt.Println("")

	nums1 = []int{0}
	merge(nums1, 0, []int{1}, 1)
	for _, v := range nums1 {
		fmt.Printf("%d", v)
	}
	fmt.Println("")
}
