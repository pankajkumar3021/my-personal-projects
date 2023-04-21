package main

import "fmt"

func add(x int, y int) int {
	return x + y

}

func ReturnVars() (n int, name string) {
	n = 42
	name = "saket"
	return

}

func scoped() func(a, b int) int {
	outer := 122
	foo := func(a, b int) int {

		return outer + a + b
	}
	return foo

}

func main() {
	fmt.Println(add(100, 200))
	var num, name = ReturnVars()
	fmt.Println(num, name)
	myfoo := scoped()
	fmt.Println(myfoo(100, 200))
}
