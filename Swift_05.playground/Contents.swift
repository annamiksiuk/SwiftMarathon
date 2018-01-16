let myDate = (day: 30, month: 4, year: 2018)

var days = 0

for month in 1...(myDate.month - 1) {
    
    if month == 2 {
        
        if myDate.year % 4 == 0 {
            days += 29
        } else {
            days += 28
        }
        
    } else if (month <= 7 && month % 2 == 1) || (month > 7 && month % 2 == 0) {
        days += 31
    } else {
        days += 30
    }
    
}

days += myDate.day

let seconds = days * 24 * 60 * 60

print("Between the beginning of the year and my birthday is \(seconds) seconds\n")

//-------------------------------

if myDate.month <= 3 {
    print("I was born in the 1st quarter\n")
} else if myDate.month <= 6 {
    print("I was born in the 2st quarter\n")
} else if myDate.month <= 9 {
    print("I was born in the 3st quarter\n")
} else {
    print("I was born in the 4st quarter\n")
}

//-------------------------------

let apples = 5
let orange = 7
let carrot = 3

let friutsPrice = 2
let vegetablesPrice = 5

let total = (apples + orange) * friutsPrice + carrot * vegetablesPrice
print("total = \(total)")

//--------------------------------

let verticalValue = 1
let horizontalValue = "h"
var result = "BLACK"

if verticalValue % 2 == 1 {
    
    if horizontalValue == "b" || horizontalValue == "d" || horizontalValue == "g" || horizontalValue == "h" {
        result = "WHITE"
    }
    
} else {
    
    if horizontalValue == "a" || horizontalValue == "c" || horizontalValue == "e" || horizontalValue == "g" {
        result = "WHITE"
    }
}

print("Color cell \(horizontalValue)\(verticalValue) is \(result)")


