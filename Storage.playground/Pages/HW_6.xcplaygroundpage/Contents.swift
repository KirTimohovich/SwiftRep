//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

/*
 1. Создать объект “Школа” со свойствами: массив учеников, название школы, адрес (адрес -
 новый объект с координатами x, y, street name) и директор (у директора новые поля:
 experience, рейтинг. Директор наследуется от класса Person (name:surname:age)).
 У ученика хранить имя, фамилию, номер класса, кортеж “название предмета - оценка”.
 Ученик наследуется от Person.
 У ученика сделать конструктор со всеми параметрами, добавить дефолтные значения к
 некоторым из них.
 Написать метод для ученика, выводящий информацию о студенте в формате
 “Фамилия Имя (Класс)
 предмет: оценка
 предмет: оценка”
 .
 Написать метод для школы, который выводит информацию о школе.
 Уделите особое внимание выбору, что использовать: класс или структуру, var или let,
 модификаторы доступа.
 */

class Person {
    let name: String
    let surname: String
    var age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}

class Student: Person {
    var numberOfClass: String = ""
    private var classWithScore: [(subject: String , score: Int )]
    init(name: String = "Иван", surname: String = "Иванов", age: Int = 11, numberOfClass: String = "10А", classWithScore: [(subject: String, score: Int)] = []) {
        self.numberOfClass = numberOfClass
        self.classWithScore = classWithScore
        super.init(name: name, surname: surname, age: age)
    }
    
    func addScore(subject: String, score: Int) {
        classWithScore.append((subject, score))
    }
    
    func studentInfo() {
        print("\(surname) \(name) (\(numberOfClass)) ")
        for grade in classWithScore {
            print("\(grade.subject): \(grade.score)")
        }
    }
}

class Director: Person {
    var experience: Double
    private var rating: Double
    
    init(name: String, surname: String, age: Int, experience: Double, rating: Double) {
        self.experience = experience
        self.rating = rating
        super .init(name: name, surname: surname, age: age)
    }
    
    func evaluate(score: Int) {
        rating = (rating + Double(score)) / 2
    }
    
    func showDirectorRating() {
        print("\(rating)")
    }
}


struct Address {
    let coordinateX: Double
    let coordinateY: Double
    var streetName: String
}


class School {
    let students: [Student]
    let schoolName: String
    let ardess: Address
    var director: Director
    
    init(students: [Student], schoolName: String, ardess: Address, director: Director) {
        self.students = students
        self.schoolName = schoolName
        self.ardess = ardess
        self.director = director
    }
    
    func schoolInfo() {
        print("Название школы: \(schoolName)\nАдрес школы: \(ardess.streetName)\nДиректор школы: \(director.surname) \(director.name)")
    }
}

let schoolBoy = Student(name: "Kirill", surname: "Tim", age: 11, numberOfClass: "10A", classWithScore: [(subject: "Математика", score: 4)])



schoolBoy.addScore(subject: "Русский язык", score: 1)
schoolBoy.studentInfo()

let adressOfSchool = Address(coordinateX: 32.234242, coordinateY: 35.1231, streetName: "Улица культурица")
let schoolDirector = Director(name: "Саня", surname: "Иванов", age: 77, experience: 24, rating: 4.47)

schoolDirector.evaluate(score: 5)
schoolDirector.evaluate(score: 5)
schoolDirector.evaluate(score: 5)

schoolDirector.showDirectorRating()

let school = School(students: [schoolBoy], schoolName: "Гимназия 111", ardess: adressOfSchool, director: schoolDirector)

school.schoolInfo()

/*
 2. Создайте протокол PaymentMethod с требованиями:
 Свойство balance (текущий баланс)
 Метод pay(amount: Double) -> Bool
 Реализуйте протокол в:
 Классе CreditCard (должен списывать сумму + 1% комиссии)
 Структуре CryptoWallet (должен проверять, хватает ли криптовалюты)
 Напишите функцию processPayment(using method: PaymentMethod, amount: Double), которая обрабатывает платеж.
 */

protocol PaymentMethod {
    var balance: Double {get set}
    func pay(amount: Double) -> Bool
    func showBalance()
}

class CreditCard: PaymentMethod {
    private let bankCommission: Double = 1.01
    var balance: Double
    
    init(balance: Double = 0) {
        self.balance = balance
    }
    
    func showBalance() {
        print("Баланс кредитной карты: \(balance)")
    }
    
    func topUpBalance(amount sum: Double) {
        if sum > 0 {
            balance = balance + sum
        }
    }
    
    func pay(amount: Double) -> Bool {
        if amount > 0 && balance >= (amount * bankCommission) {
            balance = balance - (amount * bankCommission)
            return true
        } else {
            return false
        }
    }
}

class CryptoWallet: PaymentMethod {
    var balance: Double
    
    init(balance: Double = 0) {
        self.balance = balance
    }
    
    func showBalance() {
        print("Баланс криптокошелька: \(balance)")
    }
    
    func topUpBalance(amount sum: Double) {
        if sum > 0 {
            balance += sum
        }
    }
    
   func pay(amount: Double) -> Bool {
        if amount > 0 && balance >= amount {
            balance -= amount
            return true
        } else {
            return false
        }
    }
}

func processPayment(using method: PaymentMethod, amount: Double) {
    print("Обработка платежа на сумму: \(amount)")
    if method.pay(amount: amount) {
        print("Платеж успешно завершен")
        method.showBalance()
    } else {
        print("Ошибка обработка платежа, проверьте ваш баланс")
        method.showBalance()
    }
}

var myCreditCard = CreditCard()
myCreditCard.topUpBalance(amount: 100)
var myCriptoWallet = CryptoWallet()
myCriptoWallet.topUpBalance(amount: 10)
myCriptoWallet.showBalance()
processPayment(using: myCreditCard, amount: 10)
processPayment(using: myCriptoWallet, amount: 100)
myCreditCard.showBalance()
