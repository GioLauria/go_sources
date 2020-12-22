package main
import "fmt"
func main(){
	var x string = "This is a string"
	var y string
	y="This is another string"
	fmt.Println(x)
	fmt.Println(y)
	
	var z string
	z=x+y
	fmt.Println(z)
	fmt.Println(x==z)

	w:="3"    // short form. Automatic type inferral
	fmt.Println(w)
}