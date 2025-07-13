import UIKit

//1

func greeting() {
    print("hello world")
}
greeting()
//
func sayHello(_ name: String) {
    print("Привет \(name)")
}
print(sayHello("Паша"))
//
func sayHello2 (_ name: String = "Паша") -> String   {
    return String ("Привет! \(name)")
}
print(sayHello2())
