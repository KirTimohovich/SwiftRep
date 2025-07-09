import UIKit

var projectDescription: String = "Приложение для изучения Swift, позволяющее изучать теорию, решать практические задания с проверкой ДЗ и отслеживанием прогресса обучения"

// Функции

//var greeting = "Hello, playground"
//
//func greetingPrints() {
//    print("Hello, playground")
//}
//
//greetingPrints()
//
//
//func greetingMessage(message: String) {
//    print(message)
//}
//
//greetingMessage(message: "Привет")
//
//func great(recipient: String, message: String) {
//    print("\(message), \(recipient)")
//}
//
//great(recipient: "PETIA", message: "go home")
//
//
//func findUser(id: Int) -> String {
//    if id == 0 {
//        return "Kiryl"
//    } else {
//        return "Guest"
//    }
//}
//
//print(findUser(id: 0))
//
//func greatingNew(_ message: String) -> String {
//    if message == "Kir" {
//        return "Tim"
//    } else {
//        return "Kirill"
//    }
//}
//
//print(greatingNew("Kir"))

func add(x: Int, y: Int) -> Int {
    return x + y
}

add(x: 4,y: 5)

func multiply(x: Int, y: Int) -> Int {
    return x * y
}

multiply(x: 5, y: 5)

func calculate(x: Int, y: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(x, y)
}

calculate(x: 6, y: 7, operation: add)
calculate(x: 5, y: 5, operation: multiply)

// Замыкания

var veryVery: () -> () = {
    print("Testing")
}

veryVery()

let sayHi: () -> String = {
    return "Privet medved"
}

print(sayHi())

var greatPerson: (String) -> String = { name in
    return "Privet, \(name)"
}

print(greatPerson("Kirill"))

func fetchData(completion: (String) -> ()) {
    print("Загрузка...")
    completion("Загрузка выполнена!")
}

fetchData(completion: { result in
    print(result)
})

func counter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}

let encreaseCount = counter()
print(encreaseCount())
print(encreaseCount())

func downloadData(completion: (String, String?) -> ()) {
    print("Пошла загрузка")
    let result = "Данные успешно загружены"
    completion(result, nil)
}

downloadData(completion: {result, _ in
print(result)
})

func logMessage(_ message: String) -> Bool {
    print("Log: \(message)")
    return true
}

logMessage("Ky ky")


// Функции высшего порядка

let numbers = [1, 2, 3, 5]

print(numbers.map { number in
    number + 2
})

print(numbers.map { number in
    number * number
})

let num: (Int, Int) -> Int = {
    $0 * $1
}

print(num(10, 10))
