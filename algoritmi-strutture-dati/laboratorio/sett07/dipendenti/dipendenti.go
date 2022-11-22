package main

import "fmt"

type treeNode struct {
	parent   *treeNode
	value    string
	children []*treeNode
}

type tree struct {
	root *treeNode
}

func newNode(value string) *treeNode {
	return &treeNode{nil, value, []*treeNode{}}
}

func stampaSubordinati(node treeNode) {
	for _, sub := range node.children {
		fmt.Println(sub.value)
	}

}

func quantiSenzaSubordinati(parent treeNode, count int) int {

	for _, sub := range parent.children {
		count = quantiSenzaSubordinati(*sub, count)
	}
	if len(parent.children) == 0 {
		count++
		return count
	}
	return count
}

func supervisore(node treeNode) string {
  return node.parent.value
}

func stampaImpiegatiSopra(node treeNode) {
  if node.parent == nil {
    return
  }

  fmt.Println(supervisore(node)) 
  stampaImpiegatiSopra(*node.parent)
}

func main() {
	forest := []*tree{}
	anna := &tree{}
	forest = append(forest, anna)
	anna.root = newNode("anna")
	bruno := newNode("bruno")
	carlo := newNode("carlo")
	daniela := newNode("daniela")
	anna.root.children = append(anna.root.children, bruno, carlo, daniela)

	bruno.parent = anna.root
	carlo.parent = anna.root
	daniela = anna.root

	enrico := newNode("enrico")
	francesco := newNode("francesco")
	bruno.children = append(bruno.children, enrico, francesco)

	enrico.parent = bruno
	francesco.parent = bruno

	harry := newNode("harry")
	gianni := &tree{}
	forest = append(forest, gianni)
	gianni.root = newNode("gianni")
	gianni.root.children = append(gianni.root.children, harry)

	harry.parent = gianni.root

	irene := newNode("irene")
	francesco.children = append(francesco.children, irene)
	irene.parent = francesco

	stampaSubordinati(*anna.root)
  count := 0
  for _, sup := range forest {
    count = quantiSenzaSubordinati(*sup.root, count)
  }
  fmt.Println(count)

  stampaImpiegatiSopra(*irene)

}
