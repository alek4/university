package main
import "fmt"

func algoX ( table []int, x int) (bool, int) {
	for i , el := range table {
		if el == x {
			return true, i
		}
	}

	return false, -1
}

func algoY ( table []int, x int) (bool, int) {
	low , high := 0, len( table ) -1
	for low <= high {
		mid := ( low + high ) / 2
		if table [ mid ] < x {
			low = mid + 1
		} else if table [ mid ] > x {
			high = mid - 1
		} else {
			return true, mid
		}
	}
	return false, -1
}

func main() {
  
}