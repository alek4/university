package main

import (
	"fmt"
	"strings"
	"strconv"
)

type stack struct {
	head *stackNode
}

type stackNode struct {
	next  *stackNode
	value int
}

func newNode(value int) *stackNode {
	node := new(stackNode)
	node.value = value
	return node
}

func push(node *stackNode, list *stack) {
	node.next = list.head
	list.head = node
}

func pop(list *stack) int {
	popValue := list.head.value
	list.head = list.head.next

	return popValue
}

func printStack(list stack) {
	p := list.head

	for p != nil {
		value := p.value
		fmt.Print(value, " ")
		p = p.next
	}

	fmt.Println()
}

func top(s stack) int {
	return s.head.value
}

// espressione postfissa - space separated
func valuta(espressione string, s *stack) (int, bool) {
	tokens := strings.Split(espressione, " ")

	for _, tk := range tokens {
		num, err := strconv.Atoi(tk)
		if err == nil {
			n := newNode(num)
			push(n, s)
		} else {
			n2 := pop(s)
			n1 := pop(s)
			var res int
			switch tk {
				case "+":
					res = n1 + n2

					break
				case "-":
					res = n1 - n2

					break
				case "/":
					res = n1 / n2

					break
				case "*":
					res = n1 * n2

					break
				default:
					return res, false
			}

			n := newNode(res)

			push(n, s)
		}
	}

	return top(*s), true
}

func converti(espressione string) string {
	tokens := strings.Split(espressione, " ")

	for _, tk := range tokens {
		num, err := strconv.Atoi(tk)
		if err == nil {
			fmt.Println(num)
		} else {
			if tk == "+" || tk == "-" || tk == "/" || tk == "*" {
				n := newNode()
				push()
			}
		}
	}
}

func main() {
	s := new(stack)
	// n := newNode(7)
	// push(n, s)
	// n = newNode(2)
	// push(n, s)
	// n = newNode(3)
	// push(n, s)
	
	
	// printStack(*s)

	// popValue := pop(s)

	// printStack(*s)
	// fmt.Println(popValue)

	res, ok := valuta("5 3 -", s)

	fmt.Println(res, ok)
}
