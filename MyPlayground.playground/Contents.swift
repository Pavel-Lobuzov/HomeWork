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


//2

      func names (_ first: String, last: String) -> Int {
    return first.count + last.count
}
print(names("Pavel", last: "Lobuzov"))

//3

func square(_ x: Int) -> Int {
    return x * x
}
print(square(2))
