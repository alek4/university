package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"sort"
	"strconv"
	"strings"
)

type intervallo struct {
  i, f, peso int
}

func p(j int, intev []intervallo) int {
  intervalloJ := intev[j]
  
  max := -1
  for i := 0; i < j; i++ {
    intervalloI := intev[i]
    if intervalloI.f <= intervalloJ.i {
      if max < i {
        max = i
      }
    }
  }

  return max
}

func Opt(j int, intev []intervallo) int {
  if j == 0 {
    return 0
  }  else {
    return int(math.Max(float64(intev[j].peso) + float64(Opt(p(j, intev), intev)), float64(Opt(j-1, intev))))
  }
}

func M_Opt(j int, intev []intervallo, M *[]int) int {
  if j == 0 {
    return 0
  }  else if (*M)[j] != 0 {
    return (*M)[j]
  } else {
    (*M)[j] = int(math.Max(float64(intev[j].peso) + float64(M_Opt(p(j, intev), intev, M)), float64(M_Opt(j-1, intev, M))))
    return (*M)[j]
  }
}

func findSolution(j int, M *[]int)  {
  if j == 0 {
  } else {
    if (*M)[j].peso + M[p(j)]
  }
}

func main() {
  sc := bufio.NewScanner(os.Stdin)

  intervalli := []intervallo{}
  for sc.Scan() {
    line := sc.Text()
    lineSplit := strings.Split(line, " ")
    peso, _ := strconv.Atoi(lineSplit[2])
    i, _ := strconv.Atoi(lineSplit[0])
    f, _ := strconv.Atoi(lineSplit[1])

    intervalli = append(intervalli, intervallo{i,f,peso})
  }

  fmt.Println(intervalli)

  sort.Slice(intervalli, func(i, j int) bool { return intervalli[i].f < intervalli[j].f })
  fmt.Println(intervalli)

  fmt.Println(intervalli[p(2, intervalli)])
}
