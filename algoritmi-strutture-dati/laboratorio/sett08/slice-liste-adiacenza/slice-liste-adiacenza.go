package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type linkedList struct {
	head *nodeLinkedList
}

type nodeLinkedList struct {
	value int
	next  *nodeLinkedList
}

func newLinkedNode(n int) *nodeLinkedList {
	return &nodeLinkedList{n, nil}
}

type graph struct {
	n         int // numero di vertici
	adiacenti []*linkedList
}

func newGraph(n int) *graph {
	arr := make([]*linkedList, n)
	for i := 0; i < n; i++ {

		arr[i] = &linkedList{nil}
	}
	return &graph{n, arr}
}

func graphFromInput() *graph {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanLines)

	sc.Scan()
	n, _ := strconv.Atoi(sc.Text())

  g := newGraph(n)
	for sc.Scan() {
    row := sc.Text()
    
    idx, _ := strconv.Atoi(strings.Split(row, ",")[0])
    adc, _ := strconv.Atoi(strings.Split(row, ",")[1])

    if g.adiacenti[idx].head == nil {
      g.adiacenti[idx].head = newLinkedNode(adc)
    } else {
      node := newLinkedNode(adc)
      node.next = g.adiacenti[idx].head
      g.adiacenti[idx].head = node
    }

  }
	return g
}

func printList(l linkedList) {
  p := l.head
  for p != nil {
    fmt.Print(p.value, " ")
    p = p.next
  }
}

func areConnected(g graph, x, y int) bool {
  p := g.adiacenti[x].head

  for p != nil { 
    if p.value == y {
      return true
    }

    p = p.next
  }

  p = g.adiacenti[y].head

  for p != nil { 
    if p.value == x {
      return true
    }

    p = p.next
  }

  return false
}

func printGraph(g graph) {
  for idx, adcList := range g.adiacenti {
    fmt.Print("[", idx, "]: ")
    printList(*adcList)
    fmt.Println()
  }
}

func main() {
	// fmt.Println("--------")

	// fmt.Println(input)

	g := graphFromInput()
  printGraph(*g)

  fmt.Println(areConnected(*g, 0, 1))
  fmt.Println(areConnected(*g, 1, 0))
  fmt.Println(areConnected(*g, 2, 1))
}
