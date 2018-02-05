var Journal = ["Ivan Ivanov" : 3.45,
               "Petr Petrov" : 4.75,
               "Fedor Sidorov" : 5,
               "Sergey Kolonin" : 3.9,
               "Arina Svetlova" : 4.4]

Journal["Sergey Kolonin"] = 4.1
Journal["Ivan Ivanov"] = 4.2

Journal.updateValue(4.8, forKey: "Arina Svetlova")

Journal["Irina Loeva"] = 4.7
Journal.updateValue(3.1, forKey: "Anna Rusakova")

Journal["Fedor Sidorov"] = nil

var summa : Double = 0
var index = 0

for key in Journal.keys {
    
    let value = Journal[key]
    if let score = value {
        summa += score
        index = index + 1
    }
}

let middleScore = summa / Double(index);

print("summa = \(summa)\tmiddle score = \(middleScore)")

print("------------------")

let daysInMonth = ["January" :  31,
                   "February" : 28,
                   "March" :    31,
                   "April" :    30,
                   "May" :      31,
                   "June" :     30,
                   "Jule" :     31,
                   "August" :   31,
                   "September" :30,
                   "October" :  31,
                   "November" : 30,
                   "December" : 31]

for (key, value) in daysInMonth {
    print("\(key) - \(value) days")
}

print("------------------")

for key in daysInMonth.keys {
    let value = daysInMonth[key]
    if let days = value {
        print("\(key) - \(days) days")
    }
}

print("------------------")

let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
var grid = [String : Bool]()

for indexLetter in 0..<letters.count {
    for number in 1...8 {
        
        let letter = letters[indexLetter]
        let nameCell = letter + String(number)
        
        if indexLetter % 2 != number % 2 {
            
            grid[nameCell] = false
            
        } else {
            
            grid[nameCell] = true
        }
    }
}

print(grid)

