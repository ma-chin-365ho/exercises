// Rectangle
package main

import (
	"bufio"
	"fmt"
	"strconv"
	"os"
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
	var area int
	var perimeter int
	var result string

    sc.Split(bufio.ScanWords)
	x := nextInt()
	y := nextInt()

	area = x * y
	perimeter = (x * 2) + (y * 2)
	
	result = strconv.Itoa(area) + " " + strconv.Itoa(perimeter)

    fmt.Println(result)
}

