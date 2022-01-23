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
	W := nextInt()
	H := nextInt()
	x := nextInt()
	y := nextInt()
	r := nextInt()

	result = "Yes"

	// over check : upper Line
	// over check : lower Line
	// over check : left Line
	// over check : right Line
	if (y+r) > H ||
		(y-r) < 0 ||
		(x+r) > W ||
		(x-r) < 0 {
		
		result = "No"
	}
	
    fmt.Println(result)
}

