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

	var result string

    sc.Split(bufio.ScanWords)
	a := nextInt()
	b := nextInt()
	c := nextInt()

	if a < b  && b < c{
		result = "Yes"
	} else {
		result = "No"
	}

    fmt.Println(result)
}

