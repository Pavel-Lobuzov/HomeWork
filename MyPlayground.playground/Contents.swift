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

//4
func sum (numb1: Double , numb2: Double ) -> Double {
    return numb1 + numb2
}
print(sum(numb1: 35.5, numb2: 14.5))
//
func minus (numb1: Int , numb2: Int ) -> Int {
    numb1 - numb2
}
print(minus(numb1: 2, numb2: 3))
//
func multiply (numb1: Int , numb2: Int ) -> Int {
    numb1 * numb2
}
print(multiply(numb1: 2, numb2: 3))
//
func divide (numb1: Int , numb2: Int ) -> Int {
    numb1 / numb2
}
print(divide(numb1: 2, numb2: 3))

//5
func circloud (r: Int) -> Double {
    return 3.14 * Double(r) * Double(r)
}
print("радиус круга r равен \(circloud(r: 5))")

//6
func isNight (time: Int) -> String {
    if time >= 20 || time <= 6 {
        return String("Сейчас ночь")
    } else {
        return String("Сейчас день")
    }
}
print(isNight(time: 20 ))
/*
func isNight (Day: String) -> Bool {
    if Day == "ночь" {
        return true
    } else {
        return false
    }
}
print (isNight(Day: "ночь"))
*/
