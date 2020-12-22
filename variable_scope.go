package main
import "fmt"

var x="Out of the main"   // it works ok, global variable

func main(){
	fmt.Println(x)
	f()
}

func f(){
	fmt.Println("Accessing variable",x)
}