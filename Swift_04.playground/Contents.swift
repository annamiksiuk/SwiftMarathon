let text1 = "152" ; let text2 = "Anna" ; let text3 = "25"
let text4 = "A1b8"; let text5 = "0"

var summa = 0

if let number1 = Int(text1) {
    summa += number1
} else {
    print("value text1 is not Int\n")
}

let number2 : Int? = Int(text2)
if number2 != nil {
    summa = summa + number2!
} else {
    print("value text2 is not Int\n")
}

if Int(text3) != nil {
    let number3 = Int(text3)
    summa += number3!
} else {
    print("value text3 is not Int\n")
}

if Int(text4) != nil {
    summa += Int(text4)!
} else {
    print("value text4 is not Int\n")
}

let number5 : Int? = Int(text5)
if number5 != nil {
    summa = summa + number5!
} else {
    print("value text5 is not Int\n")
}

print("summa values = \(summa)\n")

//----------------------------------

let response1 = (statusCode: 250, error: "", errorMessage: "error message")

if response1.statusCode >= 200 && response1.statusCode <= 300 {
    
    print(response1.errorMessage)
    
} else {
    
    print(response1.error)
}
let errorMessage : String? = nil
let error : String? = "error"

let response2 = (error: error, errorMessage: errorMessage)

if response2.error != nil {
    print("response error = \(response2.error!)")
}
if response2.errorMessage != nil {
    print("response error message = \(response2.errorMessage!)")
}

//-----------------------------------
var name : String? = nil
var numberCar : String? = nil
var score: Float? = nil

var student1 = (name: name, numberCar: numberCar, score: score)
var student2 = (name: name, numberCar: numberCar, score: score)
var student3 = (name: name, numberCar: numberCar, score: score)
var student4 = (name: name, numberCar: numberCar, score: score)
var student5 = (name: name, numberCar: numberCar, score: score)

student1.name = "Anna"
student2.name = "Ivan"
student3.name = "Max"
student4.name = "Irina"
student5.name = "Alex"

student2.numberCar = "er4563"
student4.numberCar = "as2587"
student5.numberCar = "fg47852"

student1.score = 5.0
student2.score = 4.1
student4.score = 3.4

print("\nStudent1:\nname - \(student1.name!)")
if student1.numberCar != nil {
    print("number car - \(student1.numberCar!)")
}
if student1.score != nil {
    print("score - \(student1.score!)")
}
//---
print("\nStudent2:\nname - \(student2.name!)")
if student2.numberCar != nil {
    print("number car - \(student2.numberCar!)")
}
if student2.score != nil {
    print("score - \(student2.score!)")
}
//---
print("\nStudent3:\nname - \(student3.name!)")
if student3.numberCar != nil {
    print("number car - \(student3.numberCar!)")
}
if student3.score != nil {
    print("score - \(student3.score!)")
}
//---
print("\nStudent4:\nname - \(student4.name!)")
if student4.numberCar != nil {
    print("number car - \(student4.numberCar!)")
}
if student4.score != nil {
    print("score - \(student4.score!)")
}
//---
print("\nStudent5:\nname - \(student5.name!)")
if student5.numberCar != nil {
    print("number car - \(student5.numberCar!)")
}
if student5.score != nil {
    print("score - \(student5.score!)")
}
