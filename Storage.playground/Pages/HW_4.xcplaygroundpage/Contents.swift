//: [Previous](@previous)

import Foundation



/*
 1. Создать enum с временами года.
 */
enum TimesOfYear {
    case spring
    case summer
    case autumn
    case winter
}

/*
2. Написать функцию, которая будет принимать номер месяца (Int) и возвращать enum
с временем года этого месяца.
 */

func season(numberOfMonth num: Int) -> TimesOfYear {
    switch num {
    case 12, 1, 2:
        return .winter
    case 3...5:
        return .spring
    case 6...8:
        return .summer
    case 9...11:
        return .autumn
    default:
        fatalError("Ошибка определения месяца, проверьте данные")
    }
}

print(season(numberOfMonth: 3))

/*
3. Написать метод, который принимает variadic parameter String?. (или массив опцианальных строк [String?]) Метод возвращает
количество nil объектов и печатает в консоль одну строку всех объединенных не nil
объектов.
 */

func joinder(array arr: [String?]) -> Int {
    var nilCounter: Int = 0
    var stringJoiner: String = ""
    
    for str in arr {
        if let str {
            stringJoiner = stringJoiner + str
        } else {
            nilCounter += 1
        }
    }
    print("Обьединение всех не nil обьектов: \(stringJoiner)")
    print("Количество nil обьектов: \(nilCounter)")
    return nilCounter
}

joinder(array: ["1231", nil, nil, "gasgasgasga"])

/*
4. Объявить опцианал, и сделать его разворачивание разными способами.
*/

let testEnum: String? = "Опционал развернут"

//Принудительное извлечение
print("Первый способ, не безопасное извлечение: \(testEnum!)")

//Guard let
func guarderReturn() -> String {
    guard let guardedEnum = testEnum else {
        fatalError("Значение nil")
    }
    return guardedEnum
}
print(guarderReturn())

// If let
if let testEnum {
    print("Безопасное извлечение через if let: \(testEnum)")
}

//Значение по дефолту
let value = testEnum ?? ""
print(value)
