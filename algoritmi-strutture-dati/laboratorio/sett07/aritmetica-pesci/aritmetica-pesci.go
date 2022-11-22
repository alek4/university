package main

import (
	"fmt"
	"strconv"
	"strings"
)

type tree struct {
	root *treeNode
}

type treeNode struct {
	left  *treeNode
	right *treeNode
	value int
}

func newNode(value int) *treeNode {
	return &treeNode{nil, nil, value}
}

func readTree(fishNumber string) *tree {
	stack := []*treeNode{}
	for idx, c := range fishNumber {
		if c == '[' {
			node := newNode(-1)
			stack = append(stack, node)
		} else {
			n, err := strconv.Atoi(string(c))
			if err == nil {
				if stack[len(stack)-1].left == nil {
					stack[len(stack)-1].left = newNode(n)
				} else {
					stack[len(stack)-1].right = newNode(n)
				}
			} else {
				if c == ']' {
					if idx == len(fishNumber)-1 {
						break
					}
					if stack[len(stack)-2].left == nil {
						stack[len(stack)-2].left = stack[len(stack)-1]
					} else {
						stack[len(stack)-2].right = stack[len(stack)-1]
					}

					stack = stack[:len(stack)-1]
				}
			}
		}
	}

  t := &tree{}
  t.root = stack[len(stack) - 1] 
  return t 
}

func printTree(t *treeNode) {
  if t.left == nil && t.right == nil {
    fmt.Print(t.value)
    return
  }

  if t.value == -1 {
    fmt.Print("[")
  }

  printTree(t.left)
  fmt.Print(",")
  printTree(t.right)
  fmt.Print("]")
}

func treeToSlice(t *treeNode, s []*treeNode) []*treeNode {
  if t == nil {
    return s
  }
  
  s = treeToSlice(t.left, s)
  s = treeToSlice(t.right, s)
  if t.value != -1 {
    s = append(s, t)
  }
  return s
}

func add(fishSum string) *tree {
  addends := strings.Split(fishSum, " + ")
  t := &tree{}
  t.root = newNode(-1)

  leftBranch := readTree(addends[0])
  rightBranch := readTree(addends[1])

  t.root.left = leftBranch.root
  t.root.right = rightBranch.root

  return t
}

func explode(sec []*treeNode, pair *treeNode) []*treeNode {
  pairValueLeft := pair.left.value
  pairValueRight := pair.right.value
  pair.value = 0
  pair.left = nil
  pair.right = nil

  var posLeft int
  for posLeft = 0; posLeft < len(sec); posLeft++ {
    if sec[posLeft] == pair {
      break
    }
  }

  posRight := posLeft + 1

  if !(posLeft - 1 < 0) {
    sec[posLeft - 1].value += pairValueLeft
  } 

  sec[posLeft] = pair

  if !(posRight + 1 >= len(sec)) {
    sec[posRight + 1].value += pairValueRight
    sec = append(sec[:posRight], sec[posRight + 1:]...) 
  } else {
    sec = sec[:posRight]
  }

  return sec
}

func findPairToExplode(t *treeNode, depth int) *treeNode {
  var pair *treeNode
  if t == nil {
    return nil 
  }
  
  if depth < 4 {
    pair = findPairToExplode(t.left, depth+1)
    pair = findPairToExplode(t.right, depth+1)
  }

  return pair
}

func reduce(t *tree) *tree {
  pairToExplode := findPairToExplode(t.root, 0)
  fmt.Println(pairToExplode.left, pairToExplode.right)
  return t 
}

func main() {
  example := "[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]"
  //
  // t := readTree(example)
  // printTree(t.root)
  // fmt.Println()
  // s := treeToSlice(t.root, []int{})
  // fmt.Println(s)
  // example := "[[3,4],5] + [1,2]"
  // test := add(example)
  test := readTree(example)
  reduce(test)
}
