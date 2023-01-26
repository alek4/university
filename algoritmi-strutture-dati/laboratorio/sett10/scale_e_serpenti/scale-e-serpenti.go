package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func minMosse(board []int) int {
	pos := 0
	nMoves := 0

	for pos < 29 {
		nMoves++

		if pos + 7 >= 29 {
			break
		}

		// caselle raggiungibili con un tiro di dadi
		rangeCaselle := board[pos:pos+7]
		max := 0
		for _, v := range rangeCaselle {
			if max < v {
				max = v
			}
		}

		// ho trovato solo serpenti e forse qualche zero, cerco lo zero più distante
		zeroPos := -1
		if max - 1 < pos {
			for i, v := range rangeCaselle {
				if v == 0 && i != 0 {
					zeroPos = i
				}
			}		

			// trovato, ci vado
			if zeroPos != -1 {
				pos += zeroPos
			} else { // non l'ho trovato, vado per il meno peggio
				pos = max - 1
			}
		} else {
			// se tutte le prossime 6 caselle son 0
			if max == 0 {
				pos += 6
			} else {
				pos = max - 1
			}
		}
	}

	return nMoves
}

func main() {
	sc := bufio.NewScanner(os.Stdin)
	
	sc.Scan()
	line := sc.Text()
	lineSlice := strings.Split(line, " ")
	r, _ := strconv.Atoi(lineSlice[0])
	c, _ := strconv.Atoi(lineSlice[1])

	fmt.Println(r, c)

	board := make([]int, r*c)

	for sc.Scan() {
		line := sc.Text()
		fmt.Println(line)
		lineSlice := strings.Split(line, " ")
		from, _ := strconv.Atoi(lineSlice[0])
		to, _ := strconv.Atoi(lineSlice[1])

		board[from-1] = to
	}

	fmt.Println(board)

	fmt.Println(minMosse(board))
}
