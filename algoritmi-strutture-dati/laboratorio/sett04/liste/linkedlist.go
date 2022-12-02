package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type linkedList struct {
	head *listNode
}

type listNode struct {
	next  *listNode
	value int
}

func newNode(value int) *listNode {
	node := new(listNode)
	node.value = value
	return node
}

func addNewNode(node *listNode, list *linkedList) {
	node.next = list.head
	list.head = node
}

func printList(list linkedList) {
	p := list.head

	for p != nil {
		value := p.value
		fmt.Print(value, " ")
		p = p.next
	}

	fmt.Println()
}

func searchList(value int, l linkedList) *listNode {
	p := l.head

	for p != nil && p.value != value {
		p = p.next
	}

	return p
}

func removeItem(node *listNode, l *linkedList) bool {
	if node != nil {
		var curr, prev *listNode = l.head, nil
		for curr != nil {
			if curr == node {
				if prev == nil {
					l.head = l.head.next
				} else {
					prev.next = curr.next
				}
			}

			prev = curr
			curr = curr.next
		}
	}

	return false
}

func main() {
	l := new(linkedList)
	// n := newNode(3)
	// addNewNode(n, l)
	// n = newNode(5)
	// addNewNode(n, l)
	// n = newNode(6)
	// addNewNode(n, l)
	// n = newNode(1)
	// addNewNode(n, l)
	// printList(*l)

	// // fmt.Println(searchList(123, *l))

	// removeItem(searchList(6, *l), l)
	// printList(*l)

	scanner := bufio.NewScanner(os.Stdin)
	scanner.Split(bufio.ScanLines)

	for scanner.Scan() {
		s := scanner.Text()

		in := strings.Split(s, " ")

		op := in[0]
		switch op {
		case "+":
			n, _ := strconv.Atoi(in[1])
			found := searchList(n, *l)

			if found == nil {
				node := newNode(n)
				addNewNode(node, l)
			}
			break
		case "-":
			n, _ := strconv.Atoi(in[1])
			removeItem(searchList(n, *l), l)
			break
		case "?":
			n, _ := strconv.Atoi(in[1])
			found := searchList(n, *l)

			if found == nil {
				fmt.Println("numero non trovato")
			} else {
				fmt.Println("numero trovato")
			}
			break
		case "c":
			counter := 0
			p := l.head

			for p != nil {
				counter++
				p = p.next
			}

			fmt.Println(counter)
			break
		case "p":
			printList(*l)
			break
		case "o":
			slice := []int{}
			p := l.head

			for p != nil {
				slice = append([]int{p.value}, slice...)
				p = p.next
			}

			fmt.Println(slice)
			break
		case "d":
			l.head = nil
			break
		case "f":
			fmt.Println("fine programma")
			return
		}
	}
}
