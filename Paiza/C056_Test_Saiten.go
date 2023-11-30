package main

import "fmt"

func main() {

	var cnt_end int
	var gokakuten int
	var tensu int
	var kesseki int
	var gakusei_bango_list []int

	fmt.Scanf("%d %d", &cnt_end, &gokakuten)
	for gakusei_bango := 1; gakusei_bango <= cnt_end; gakusei_bango++ {
		fmt.Scanf("%d %d", &tensu, &kesseki)

		if (tensu - (kesseki * 5)) >= gokakuten {
			gakusei_bango_list = append(gakusei_bango_list, gakusei_bango)
		}
	}

	for _, num := range gakusei_bango_list {
		fmt.Println(num)
	}
}
