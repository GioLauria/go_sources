package main
import "fmt"

var x="Out of the main"   // it works ok, global variable

func main(){
	fmt.Println(x)
	f()
}

func f(){
	const y string="This is a constant"   // constant definition
	fmt.Println("Accessing variable",x)
	// y:="Trying to change a constant"  // Failing!!!
	fmt.Println(y)
}