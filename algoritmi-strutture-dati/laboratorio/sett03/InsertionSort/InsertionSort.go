package main
import "fmt"

func main() {
	var n int
	v := make([]int, 0)
	for {
		_, err := fmt.Scan(&n)

		if err != nil || n == 0 {
			break
		}

		// v = append(v, n)

		if len(v) == 0 {
			v = append(v, n)
		} else {
			pos := 0
			for n > v[pos] {
				pos++
			}
			
			v = append(v[:pos+1], v[pos:]...)
			v[pos] = n

		}


	}

	fmt.Println(v)
}