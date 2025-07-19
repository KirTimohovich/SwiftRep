import UIKit

var projectDescription: String = "Приложение для изучения Swift, позволяющее изучать теорию, решать практические задания с проверкой ДЗ и отслеживанием прогресса обучения"

// Функции


func greetingPrints() {
    print("Hello, playground")
}

greetingPrints()


func greetingMessage(message: String) {
    print(message)
}

greetingMessage(message: "Привет")

func great(recipient: String, message: String) {
    print("\(message), \(recipient)")
}

great(recipient: "PETIA", message: "go home")


func findUser(id: Int) -> String {
    if id == 0 {
        return "Kiryl"
    } else {
        return "Guest"
    }
}

print(findUser(id: 0))

func greatingNew(_ message: String) -> String {
    if message == "Kir" {
        return "Tim"
    } else {
        return "Kirill"
    }
}

print(greatingNew("Kir"))

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

// Опционалы

var name: String?
name = "Kiryl"
//print(type(of: name))

// Принудительное извлечение force unwrap

//print(name!)

// Безопасное извлечение

//if let name = name {
//    print(name)
//}

// Guard
//func greet(name: String?) {
//    guard let unwrappedName = name else {
//        print("Значение отсутствует")
//        return
//    }
//    print("\(unwrappedName)")
//}
//
//greet(name: nil)
//greet(name: "Kiryl")

// If let

if let unwrappedNameNew = name {
    print(unwrappedNameNew)
}


enum timeOfYear: Int {
    case noy = 12
    case noy2 = 13
}


print(timeOfYear.noy.rawValue)


// Кортежи (Tuples)
// Используется при возрате нескольких значений из функции

let tuple = (1, "Hello", true, 2.4)

let (number, greeting, check, decimal) = tuple

number
greeting
check
decimal

tuple.0
tuple.1


let(_, _, _, ded) = tuple

var nameTuple = (index: 1, phrase: "Hello", boolValue: true, boubleValue: 2.4)

nameTuple.phrase

nameTuple.index = 2

func getSumAndCount(array: [Int]) -> (sum: Int, count: Int) {
    var sum = 0
    for element in array {
        sum += element
    }
    return (sum, array.count)
}

let result = getSumAndCount(array: [2, 3, 5, 6, 7])

print("Сумма чисел в массиве: \(result.sum), количество чисел: \(result.count)")

// Массив (Array)

let constArray: [String] = ["a", "b", "c", "d"]

constArray.count
constArray[constArray.count - 1]

var array: [String] = ["21"]
if array.isEmpty {
    print("Пустой массив")
}

array += constArray
print(array)

array.append("1231312")

array[0] = "1"

print(array)

array.insert("test", at: 3)
print(array)

array.remove(at: 4)

print(array)

let nnnnumbers = Array(1...20)


let numRepeat = [Int](repeating: 10, count: 5)

let money = [100, 20, 100, 10, 50]
var wallet = 0
for mon in money {
    wallet += mon
}
print(wallet)


var walletSum = 0
for index in 0..<money.count {
    print(money[index])
    walletSum += money[index]
}


for (index, value) in money.enumerated() {
    print(index, value)
}


// Словари (Dictionary)

let dict: [Int: String] = [5: "Иванов", 20: "Петров", 3: "Сидоров"]
dict.isEmpty

var varDict: [String: String] = [:]
varDict["computer"] = "компьютер"
varDict["car"] = "машина"
varDict["apple"] = "яблоко"
varDict.updateValue("тест", forKey: "test")


varDict.sorted(by: <)

varDict.removeValue(forKey: "test")
print(varDict)

for key in varDict.keys {
    print(key, varDict[key]!)
}

for (key, value) in varDict {
    print(key, value)
}


// Set

var set: Set<Int> = [1, 5, 6, 78, 9]
set.insert(9)


let set1: Set = [1, 3, 5, 7, 8]
let set2: Set = [2, 3, 5, 9]

//Пересечения
print(set1.intersection(set2))

//Уникальные значение
print(set1.symmetricDifference(set2).sorted())

//Обьединение
print(set1.union(set2).sorted())

//Вычитание
print(set1.subtracting(set2).sorted())
print(set2.subtracting(set1).sorted())

print(set1.count)
print(set1.contains(2))

// Generics (Дженерики)

func printArray<T>(_ array: [T]) {
    for el in array {
        print(el)
    }
}

printArray(["ä", "b"])
printArray([1, 2, 3])

enum OptionalValue<T> {
    case none
    case some(T)
}

let someInt: OptionalValue<Int> = .some(20)
let noValue: OptionalValue<Int> = .none
