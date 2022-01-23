// Rectangle
package main

import (
	"bufio"
	"fmt"
	"strconv"
	"os"
	"sort"
)

var sc = bufio.NewScanner(os.Stdin)

func nextInt() int {
    sc.Scan()
    i, e := strconv.Atoi(sc.Text())
    if e != nil {
        panic(e)
    }
    return i
}

func main() {

	var result string

    sc.Split(bufio.ScanWords)
	a := nextInt()
	b := nextInt()
	c := nextInt()

	i_ary := []int{a, b, c}
	sort.Sort(sort.IntSlice(i_ary))

	result = strconv.Itoa(i_ary[0]) + " " + strconv.Itoa(i_ary[1]) + " " + strconv.Itoa(i_ary[2])

    fmt.Println(result)
}

