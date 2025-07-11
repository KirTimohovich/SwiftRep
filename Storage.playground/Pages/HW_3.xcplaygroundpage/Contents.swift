//: [Previous](@previous)

import Foundation

/*
 1. Написать функцию, которая:
 - Будет просто выводить в консоль ”Hello, world!”
 - Будет принимать аргумент “имя” и выводить в консоль “Hello, имя” (вызов функции
 должен быть следующим - printHi(“Misha”)).
 - Будет принимать аргумент имя и возвращать строку приветствия “Hello! имя”
*/

func printHi(name userName:String) -> () {
    print("Hello, world!")
    print("Hello, \(userName)")
}
printHi(name: "Kiryl")

/*
 2. Написать функцию, которая принимает две строки и возвращает сумму количества символов двух строк.
 */

func symbolCount(firstString str: String, secondString strSec: String) -> Int {
    return str.count + strSec.count
}

print(symbolCount(firstString: "Привет", secondString: "медвед"))

/*
 3. Написать функцию, которая выводит в консоль квадрат переданного числа.
 */

func squared(_ num: Int) -> () {
    print(num * num)
}

squared(10)

/*
 4. Создать функции, которые будут суммировать, вычитать, умножать и делить числа
 sum(num1:num2:).
 */
 
func sum(num1 numOne: Int, num2 numTwo: Int) -> Int {
     numOne + numTwo
}

print(sum(num1: 4, num2: 2))

func sub(num1 numOne: Int, num2 numTwo: Int) -> Int {
    numOne - numTwo
}
print(sub(num1: 4, num2: 2))

func div(num1 numOne: Int, num2 numTwo: Int) -> Int {
    numOne / numTwo
}
print(div(num1: 4, num2: 2))

func mult(num1 numOne: Int, num2 numTwo: Int) -> Int {
    numOne * numTwo
}
print(mult(num1: 4, num2: 2))

 /*
 5. Создать функцию, которая принимает параметры и вычисляет площадь круга.
  */

func circleArea(radius r: Int) -> Double {
    Double.pi * Double(r * r)
}

print(circleArea(radius: 3))

/*
 6. Создать функцию, которая принимает логический тип “ночь ли сегодня” и возвращает
 строку с описанием времени суток.
 */

var isNight: Bool = false

func nightCheck(check night: Bool) -> String {
    if night == true {
        return "Сейчас ночь"
    } else {
        return "Сейчас день"
    }
}

print(nightCheck(check: isNight))

/*
 7. Создать функцию, принимающую 1 аргумент — число от 0 до 100, и возвращающую
 true, если оно простое, и false, если сложное.
 */

let arg: Int = Int.random(in: 1...30)

func simpleArgCheck(argument arg: Int) -> String {
    if arg <= 1 {
        return "Число \(arg) является сложным"
    }
    if arg <= 3 {
        return "Число \(arg) является простым"
    }
    if arg % 2 == 0 || arg % 3 == 0 {
        return "Число \(arg) является сложным"
    }
    var i = 5
        while i * i <= arg {
            if arg % i == 0 {
                return "Число \(arg) является сложным"
            }
            i += 2
        }
        return "Число \(arg) является простым"
    }

print(simpleArgCheck(argument: arg))

/*
 8. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12), и
 возвращающую время года, которому этот месяц принадлежит (зима, весна, лето или
 осень).
 */

func monthDefinition(monthNumber num: Int) -> String {
    switch num {
    case 1, 2, 12:
        return "Зима"
    case 3...5:
        return "Весна"
    case 6...8:
        return "Лето"
    case 9...11:
        return "Осень"
    default:
        return "В году всего 12 месяцев"
    }
}

print(monthDefinition(monthNumber: 12))

/*
 9*
 . Создать функцию, которая считает факториал введённого числа.
 */

func factorial(number num:Int) -> Int {
    if num < 0 {
        return -1
    }
    if num == 0 {
        return 1
    }
        var counter = 1
        
        for n in 1...num {
            counter *= n
        }
        return counter
}

print(factorial(number: 0))
print(factorial(number: -23423))
print(factorial(number: 16))
    
/*
 10*
 . Создать функцию, которая выводит все числа последовательности Фибоначчи до
 введённого индекса. Например fib(n:6) -> 0, 1, 1, 2, 3, 5, 8
 */

func fib(n num: Int) -> [Int] {
    if num < 0 {
        return []
    }
    if num == 0 {
        return [0]
    }
    if num == 1 {
        return [0, 1]
    }
    var order = [0, 1]
    for i in 2...num {
        let numberAppendNext = order[i - 1] + order[i - 2]
        order.append(numberAppendNext)
    }
    return order
}

print(fib(n: 6))

/*
 11* Создать функцию, которая считает сумму цифр четырехзначного числа,
 переданного в параметры функции
*/

func sumOfNum(number num: Int) -> Int {
    let newArray =  String(num).map {
        Int(String($0)) ?? 0
    }
    var finalSum = 0
    for i in newArray {
        finalSum += i
    }
    return finalSum
}

print(sumOfNum(number: 1234))

/*

 Дополнительно(функции высшего порядка:
 1. Есть массив целых чисел. Необходимо получить массив строк, где каждое число возведено в квадрат и записано как текст.
 */

let testArray = [2, 4 ,1 ,5]
let newArray = testArray.map {
    String($0 * $0)
}

print(newArray)
/*
 2. Отфильтровать только чётные числа из массива.
 */

let filtredArray = testArray.filter {
    $0 % 2 == 0
    }

print(filtredArray)
/*
 3. Напечатать каждую строку из массива, добавив к ней её номер (нумерация с 1).
 */

let strArray = ["Тест", "четыре", "что то"]
let incresedArray: () = strArray.enumerated().forEach { (index, value) in
    print("\(value) с нумерацией: \(index + 1)")
}
/*
 4. Преобразовать все слова в массиве в верхний регистр.
 */

let topArray = strArray.map {
    $0.uppercased()
}
print(topArray)
/*
 5. Оставить только те слова в массиве, длина которых больше 5 символов.
 */

let lenghtFive = strArray.filter {
    $0.count > 5
}

print(lenghtFive)
/*
 6. Преобразовать массив чисел в массив строк “четное” / “нечетное”.
 */

let checkArray = testArray.map {num -> String in
    return num % 2 == 0 ? "Четное" : "Нечетное"
}

print(checkArray)
/*
 7. Объединить все слова из массива в одну строку с пробелами.
 */

let sumArray = strArray.joined(separator: " ")

print(sumArray)
