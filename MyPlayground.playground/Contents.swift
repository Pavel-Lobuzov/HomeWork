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


//8
          
func seasons (month: Int) -> String {
    if month == 12 || month <= 2 {
        return String("зима")
    } else if month >= 3 && month <= 5 {
        return String("весна")
    } else if month >= 6 && month <= 8 {
        return String("лето")
    } else if  month >= 7 && month <= 11 {
        return String("осень")
        } else {
    return String("неверное значение")
}
}
print("сейчас \(seasons(month: 8))")
//
func seasons2 (month: Int) -> String {
    switch month {
    case 12, 1, 2:
        return "зима"
    case 3, 4, 5:
        return "весна"
    case 6, 7, 8:
        return "лето"
    case 9, 10, 11:
        return "осень"
    default: return "неверное значение"
    }
}
print(seasons2(month: 13))


//func seasons3(month: Int) -> String {
//    switch month {
//    case 12...2:
//        return "зима"
//    case 3...5:
//        return "весна"
//    case 6...8:
//        return "лето"
//    case 9...11:
//        return "осень"
//    default:
//        return "неверное значение"
//    }
//    }
//print(seasons3(month: 13)) ошибка , нет верхней и нижней границы ?



