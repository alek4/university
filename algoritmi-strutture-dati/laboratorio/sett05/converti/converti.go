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
	value string
}

func newNode(value string) *stackNode {
	node := new(stackNode)
	node.value = value
	return node
}

func push(node *stackNode, list *stack) {
	node.next = list.head
	list.head = node
}

func pop(list *stack) string {
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

func top(s stack) string {
	return s.head.value
}

func converti(espressione string, s *stack) string {
	res := ""
	tokens := strings.Split(espressione, " ")

	for _, tk := range tokens {
		num, err := strconv.Atoi(tk)
		if err == nil {
			fmt.Println(num)
			res = fmt.Sprint(res, num, " ")
		} else {
			if tk == "+" || tk == "-" || tk == "/" || tk == "*" {
				n := newNode(tk)
				push(n, s)
			} else if tk == ")" {
				op := pop(s)
				fmt.Println(op)
				res = fmt.Sprint(res, op, " ")

			}
		}
	}

	return res
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

	res := converti("( ( 5 + 3 ) - 7 )", s)
	fmt.Println(res)
}
