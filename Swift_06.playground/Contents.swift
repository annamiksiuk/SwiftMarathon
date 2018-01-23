import Foundation

print("----------------------")

let str1 = "25"
let str2 = "5gg"
let str3 = "12.05"
let str4 = "96"
let str5 = "1"

let number1 = Int(str1) ?? 0
let number2 = Int(str2) ?? 0
let number3 = Int(str3) ?? 0
let number4 = Int(str4) ?? 0
let number5 = Int(str5) ?? 0

let amount = number1 + number2 + number3 + number4 + number5

let result1 = Int(str1) == nil ? "nil" : str1
let result2 = Int(str2) == nil ? "nil" : str2
let result3 = Int(str3) == nil ? "nil" : str3
let result4 = Int(str4) == nil ? "nil" : str4
let result5 = Int(str5) == nil ? "nil" : str5

print("\(number1) + \(number2) + \(number3) + \(number4) + \(number5) = \(amount)")
print(result1 + " + " + result2 + " + " + result3 + " + " + result4 + " + " + result5 + " = \(amount)")

print("----------------------")

let symbols = "\u{2600} \u{1F31A} \u{23F0} \u{1F4BA} \u{1F457}"

print(symbols)

print("count = \(symbols.count)")
print("lenght = \((symbols as NSString).length)")

print("----------------------")

let alphabetic = "abcdefghijklmnopqrstuvwxyz"
alphabetic.count
let letter : Character = "b"

var index = 0;

for symbol in alphabetic {
    if letter == symbol {
        print("index letter \(letter) = \(index)")
        break
    }
    index = index + 1
}

