package main

import (
	"fmt"
	"strconv"
	"bufio"
	"os"
	// "strings"
)

func main() {
	// var input string
	slice := make([]int, 0)

	scanner := bufio.NewScanner(os.Stdin)
	scanner.Split(bufio.ScanWords)

	for scanner.Scan() {

		s := scanner.Text()
		num, _ := strconv.Atoi(s)
		
		slice = append(slice, num)
	}

	fmt.Println(slice)

	count := 0
	for i := 1; i < len(slice) - 1; i++ {
		prev := slice[i - 1]
		next := slice[i + 1]

		if prev > slice[i] && next > slice[i] {
			count++
		}
	}

	fmt.Println(count)
}