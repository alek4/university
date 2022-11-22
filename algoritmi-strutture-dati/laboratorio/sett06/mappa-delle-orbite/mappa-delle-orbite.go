package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

type treeNode struct {
	parent *treeNode
	value  string
}

type tree struct {
	root *treeNode
}

var countP = 0
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Split(bufio.ScanLines)

  childToParent := map[string]*treeNode{}

	for scanner.Scan() {
		wd := scanner.Text()
		in := strings.Split(wd, ")")


		parentVal := in[0]
		childVal := in[1]
    
    parentNode := &treeNode{nil, parentVal}
    if val, ok := childToParent[parentVal]; ok {
      parentNode = &treeNode{val, parentVal}
    }    
    childNode := &treeNode{parentNode, childVal}
    childToParent[childNode.value] = parentNode
    // fmt.Println(childNode.value, childVal)
	}

  for _, value := range childToParent {
    // countP++
    // fmt.Print(key, ": ")
    // printParent(value)
    countParent(value)
    // fmt.Println()
  }

  fmt.Println(countP)
}


func countParent(node *treeNode) {
  if node == nil {
    return 
  }
  countP++
  countParent(node.parent)
}

func printParent(node *treeNode) {
  if node.parent == nil {
    return
  }

  fmt.Print(node.value, " ")
  printParent(node.parent)
}
