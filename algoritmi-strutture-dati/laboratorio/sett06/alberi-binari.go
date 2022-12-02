package main
import "fmt"

type bitreeNode struct {
	left *bitreeNode
	right *bitreeNode
	val int
}

type bitree struct {
	root *bitreeNode
}

func newNode(val int) *bitreeNode {
	return &bitreeNode{nil, nil, val}
}

func inorder(node *bitreeNode) {
	if node == nil {
		return
	}

	inorder(node.left)
	fmt.Println(node.val)
	inorder(node.right)
}

func preorder(node *bitreeNode) {
	if node == nil {
		return
	}

	fmt.Println(node.val)
	preorder(node.left)
	preorder(node.right)
}

func postorder(node *bitreeNode) {
	if node == nil {
		return
	}

	postorder(node.left)
	postorder(node.right)
	fmt.Println(node.val)
}

func stampaAlberoASommario ( node * bitreeNode , spaces int) {
	// preorder
	if node == nil {
//		fmt.Println()
		return
	}
	
	for i := 0; i < spaces; i++ { fmt.Print(" ") }

	fmt.Print("* ")


	fmt.Println(node.val)
	
	stampaAlberoASommario(node.left, spaces + 1)
	stampaAlberoASommario(node.right, spaces + 1)
}

func arr2tree(a []int, i int) (root *bitreeNode) {
	if i >= len(a) {
		return nil
	}

	root = newNode(a[i])

	root.left = arr2tree(a, i*2+1) 
	root.right = arr2tree(a, i*2+2)

	return root
}

func main() {
	t := &bitree{nil}
	t.root = &bitreeNode{nil, nil, 50}
	t.root.left = newNode(20)
	t.root.right = newNode(80)
	t.root.left.left = newNode(10)
	t.root.left.left.right = newNode(15)

	//fmt.Println("===in order===")
	//inorder(t.root)

	//fmt.Println("===pre order===")
	//preorder(t.root)

	//fmt.Println("===post order===")
	//postorder(t.root)

	fmt.Println("=== albero prova  ===")
	stampaAlberoASommario(t.root, 0)

//	a := []int{69, 89, 28, 39, 66, 44, 12, 2, 71}	
//	b := &bitree{nil}
//	b.root = arr2tree(a, 0)


	fmt.Println("=== albero slice ===")
	stampaAlberoASommario(b.root, 0)
}
