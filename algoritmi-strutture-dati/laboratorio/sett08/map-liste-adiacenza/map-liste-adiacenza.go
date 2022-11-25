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
type item *[]string

type vertex struct {
  key string
  value item
}

type graph struct {
  verteces map[string]*vertex
  adjacent map[vertex][]*vertex
}

func newVertex(key string) *vertex {
  value := []string{}
  return &vertex{key, &value}
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
    } else {
      // aggiungi gli hobby
      rowSlice := strings.Split(row, ": ")
      user := rowSlice[0]
      hobbiesString := rowSlice[1]
      hobbies := strings.Split(hobbiesString, ",")
      addHobbies(g.verteces[user], hobbies)
    }
  }

  return g
}

func printGraph(g graph) {
  for user, followed := range g.adjacent {
    fmt.Print(user.key, " follows: ")
    for _, fl := range followed {
      fmt.Print(fl.key, " ")
    }
    fmt.Println()
  }
}

func addHobbies(u *vertex, hobbies []string) {
  *u.value = append(*u.value, hobbies...)
}

func printFollowedHobbies(g graph, user vertex) {
  fmt.Print(user.key, ": ")
  fmt.Println(*user.value)
  for _, fl := range g.adjacent[user] {
    fmt.Println("\t", fl.key)
    fmt.Println("\t\t", *fl.value)
  }
}

func isFollowerOf(followedSlice []*vertex, user vertex) bool {
  for _, usx := range followedSlice {
    if usx.key == user.key {
      return true
    }
  }

  return false
}

func printFollowerHobbies(g graph, user vertex) {
  fmt.Print(user.key, ": ")
  fmt.Println(*user.value)

  for vrtx, adj := range g.adjacent {
    if vrtx.key != user.key && isFollowerOf(adj, user) {
      fmt.Println("\t", vrtx.key)
      
      fmt.Println("\t\t", *vrtx.value)
    }
  }
}

func main() {
  g := graphFromInput()
  printGraph(*g)
  // printFollowedHobbies(*g, *g.verteces["anna"])
  printFollowerHobbies(*g, *g.verteces["sara"])
}
