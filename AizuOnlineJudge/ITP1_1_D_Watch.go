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
	var sec int
	var minute int
	var hour int
	var result string

    sc.Split(bufio.ScanWords)
	in_sec := nextInt()

	hour = in_sec / (60 * 60)
	minute = (in_sec - (hour * (60 * 60))) / 60
	sec = (in_sec - (hour * 60 * 60) - (minute * 60))
	
	result = strconv.Itoa(hour) + ":" + strconv.Itoa(minute) + ":" + strconv.Itoa(sec)

    fmt.Println(result)
}

