package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// serve un puntatore alla slice
// perche' il tipo slice non puo' essere usato come chiave per una mappa
// type item string

type vertex struct {
  key string
}

type graph struct {
  verteces map[string]*vertex
  adjacent map[vertex][]*vertex
}

func newVertex(key string) *vertex {
  return &vertex{key}
}

func graphNew(n int) *graph {
  vrtx := make(map[string]*vertex, n)
  adj := make(map[vertex][]*vertex, 0)

  return &graph{vrtx, adj}
}

func graphFromInput() *graph {
  sc := bufio.NewScanner(os.Stdin) 
  sc.Split(bufio.ScanLines)

  sc.Scan()
  n, _ := strconv.Atoi(sc.Text())

  g := graphNew(n)
  for sc.Scan() {
    row := sc.Text()
    if !strings.Contains(row, ":") {
      // crea le relazioni
      rowSlice := strings.Split(row, ",")
      follower := rowSlice[0]
      followed := rowSlice[1]

      // se non esistono nella mappa dei vertici, li aggiungo
      if _, ok := g.verteces[follower]; !ok {
        g.verteces[follower] = newVertex(follower)
      }

      if _, ok := g.verteces[followed]; !ok {
        g.verteces[followed] = newVertex(followed)
      }

      followerVrtx := g.verteces[follower]
      g.adjacent[*followerVrtx] = append(g.adjacent[*followerVrtx], g.verteces[followed])
    } else {}
  }

  return g
}

func printGraph(g graph) {
  for user, followed := range g.adjacent {
    fmt.Print(user.key, ": ")
    for _, fl := range followed {
      fmt.Print(fl.key, " ")
    }
    fmt.Println()
  }
}

func dfs1(g graph, v vertex, aux map[vertex]bool) {
  fmt.Print(v, " ")
  aux[v] = true

  for _, v2 := range g.adjacent[v] {
    if !aux[*v2] {
      dfs1(g, *v2, aux)
    }
  }
}

func bfs1(g graph, v vertex, aux map[vertex]bool) {
  coda := []vertex{v}
  aux[v] = true

  for len(coda) > 0 {
    v := coda[0]
    coda = coda[1:]
    fmt.Print(v, " ")

    for _, v2 := range g.adjacent[v] {
      if !aux[*v2] {
        coda = append(coda, *v2)
        aux[*v2] = true
      }
    }
  }
}

func main() {
  g := graphFromInput()
  printGraph(*g)
  fmt.Println("==== DFS ====")
  dfs1(*g, *g.verteces["A"], map[vertex]bool{})
  fmt.Println()
  fmt.Println("==== BFS ====")
  bfs1(*g, *g.verteces["A"], map[vertex]bool{})
  fmt.Println()

}
