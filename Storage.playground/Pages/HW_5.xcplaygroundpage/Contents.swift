//: [Previous](@previous)

import Foundation

/*
1. Создайте два массива. Первый от 0 до 14, второй от 14 до 30. Объедините их в один
массив.
 */
 
let firstArray = Array(0...14)
let secondArray = Array(14...30)
let mergedArray = firstArray + secondArray
print(mergedArray)

 /*
2. Создать функцию, которая принимает массив int. Возвести все Int в квадрат.
Возвратить новый массив.
  */

func arraySquared(array arr: [Int]) -> [Int] {
    let newArray = arr.map {
        $0 * $0
    }
    return newArray
}

print(arraySquared(array: firstArray))

/*
3. Создать функцию, которая принимает массив int. Возвратить новый массив с только
четными элементами.
 */

func evenNumbers(array arr: [Int]) -> [Int] {
    return arr.filter {
        $0 % 2 == 0
    }
}

print(evenNumbers(array: firstArray))

/*
1. Создайте кортеж с информацией о книге: название, автор, год издания.

Напишите функцию, принимающую такой кортеж и выводящую красиво оформленную строку:
“Книга ‘Название’ автора Автор, издана в Год.”
 */

let newTuple = (name: "Война и мир", author: "Толстой", year: 1863)

func tuplePrint(yourTuple tup: (name: String, author: String, year: Int)) -> () {
    print("Книга '\(tup.name)' автора \(tup.author), издана в \(tup.year)")
}
 
tuplePrint(yourTuple: newTuple)
/*
2. Создайте массив из 5 ваших любимых фильмов.
*/

var moviesTitles: [String] = [
    "Крестный отец",
    "Побег из Шоушенка",
    "Темный рыцарь",
    "Форрест Гамп",
    "Начало"
]
 
/*
Добавьте ещё один фильм.
*/

moviesTitles.append("12 лет рабства")
print(moviesTitles)
/*
Удалите первый фильм из массива.
*/

moviesTitles.removeFirst()
print(moviesTitles)

/*
Напечатайте список фильмов с номерами, начиная с 1:
 1. Название фильма
 */

for (index, name) in moviesTitles.enumerated() {
    print("\(index + 1). \(name)")
}

/*
3. Создайте словарь, где ключ — это название страны, а значение — её столица.
*/

var capitalOfCountry: [String: String] = ["Italy": "Rome", "Russia": "Moscow", "Belarus": "Minsk"]
print(capitalOfCountry)

/*
Добавьте в словарь минимум 3 страны.
*/

capitalOfCountry.updateValue("Vilnius", forKey: "Lithuania" )
capitalOfCountry.updateValue("Washington", forKey: "USA")
capitalOfCountry.updateValue("Paris", forKey: "France")
print(capitalOfCountry.values)

/*
 
Реализуйте функцию, которая принимает страну и возвращает строку:
“Столица страны — [столица]”,
или сообщение: “Информация о стране не найдена.”
*/

let userCountry = "France"

func countryInfo(country: String, cntr: [String: String]) -> () {
    for city in cntr {
        if country == city.key {
            print("Столица страны - \(city.value)")
        }
    }
}
countryInfo(country: userCountry, cntr: capitalOfCountry)
/*
4. Создайте два множества:
любимые фрукты
фрукты, которые есть дома
Найдите пересечение (что из любимого есть дома).
Найдите разницу (какие любимые фрукты отсутствуют дома).
*/
var favoriteFruits: Set<String> = ["Banana", "Apple", "Pear"]
var fruitsAtHome: Set<String> = ["Apple", "Orange"]

let intersection = favoriteFruits.intersection(fruitsAtHome)
print(intersection)
let substraction = favoriteFruits.subtracting(fruitsAtHome)
print(substraction)

/*
5. Реализуйте функцию areEqual<T: Equatable>(_ a: T, _ b: T) -> Bool, которая возвращает true, если два значения равны.

Проверьте эту функцию с Int, String и Bool.
*/

func areEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
   return a == b
}

print(areEqual("A", "B"))
print(areEqual(1, 1))
print(areEqual(true, true))
