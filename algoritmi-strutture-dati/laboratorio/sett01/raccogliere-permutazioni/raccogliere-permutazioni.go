package main

import (
	"fmt"
	"strconv"
	"bufio"
	"os"
	"strings"
)

func main() {
	// var input string
	m := make(map[int]string)

	scanner := bufio.NewScanner(os.Stdin)
	scanner.Split(bufio.ScanLines)

	for scanner.Scan() {

		s := scanner.Text()
		lineSlice := strings.Split(s, " ")
		keyS := lineSlice[0]
		name := lineSlice[1]
		key, _ := strconv.Atoi(keyS)
		// num, _ := strconv.Atoi(s)
		// fmt.Println(key, name)
		m[key] = name
	}

	for i := len(m); i > 0; i-- {
		fmt.Println(i, m[i])
	}
	

}