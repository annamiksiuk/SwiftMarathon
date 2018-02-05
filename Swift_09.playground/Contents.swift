let text = "ERFGDvBJhbnkjednk2837uhjk^&Y*Ijnm<<<Lk,..,ljiekrnebggrd4r b3425 fhfHUHDJK<GMv dfg dg gd gd <>d  f << f fJHKKLRNKN KJkJl   <,.Ijn  r0987654tfd"

var countSigns = 0; var countDigits = 0; var countVowels = 0; var countConsonants = 0

let signs = "!@#$%^&*()_+=-, ./?|"; let digits = "0123456789"; let vowels = "eyuioa"

print("lenght string - \(text.count)")

let textLowercase = text.lowercased()

for character in textLowercase {
    switch character {
        case let char where signs.contains(char):
            countSigns += 1
        case let char where digits.contains(char):
            countDigits += 1
        case let char where vowels.contains(char):
            countVowels += 1
        default:
            countConsonants += 1
            break
    }
}

print("count signs - \(countSigns)")
print("count digits - \(countDigits)")
print("count vowels - \(countVowels)")
print("count consonants - \(countConsonants)")

print("------------------------------")

let age = 10
print("age - \(age)")

switch age {
    case 0...3:
        print("baby")
    case 4...12:
        print("child")
    case 13...18:
        print("teenager")
    case 19...25:
        print("young person")
    case 26...50:
        print("worker person")
    default:
        print("elderly person")
        break
}
print("------------------------------")

let firstName = "Иван"
let patronymic = "Иванович"
let lastName = "Зумов"

var phrase = String()

switch firstName {
    case let name where name.hasPrefix("А") || name.hasPrefix("О") :
        phrase = firstName
    default:
        switch patronymic {
            case let dad where dad.hasPrefix("В") || dad.hasPrefix("Д"):
                phrase = firstName + " " + patronymic
            default:
                switch lastName {
                case let family where family.hasPrefix("Е") || family.hasPrefix("З"):
                    phrase = lastName
                default:
                    phrase = firstName + " " + patronymic + " " + lastName
                    break
                }
                break
        }
        break
}

print(phrase)

print("------------------------------")

let ships = [[(7, 3), (8, 3)],
             [(2, 4), (3, 4), (3, 3)],
             [(3, 7), (3, 8)],
             [(8, 8)]]
let shot = (8, 8)
var result = "fail"

for ship in ships {
    
    switch ship {
        case let array where array.contains(where: { $0 == shot }):
        
            if ship.count == 1 {
                result = "kill"
            } else {
                result = "hit"
            }
        
        default:
            break
        }
    
}

print("result - \(result)")

