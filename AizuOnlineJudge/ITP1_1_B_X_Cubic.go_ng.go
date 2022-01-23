// X Cubic
package main

import (
    "flag"
	"fmt"
	"strconv"
)

func main() {
	flag.Parse()
	var i int
	i, _ = strconv.Atoi(flag.Args()[0])
    fmt.Println(i * i * i)
}


