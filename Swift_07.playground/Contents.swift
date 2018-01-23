let countDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

for month in 0..<countDays.count {
    
    print("count days in \(month + 1) month - \(countDays[month])")
}
print("---------------")

let monthNames = ["January", "February", "March", "April", "May", "June", "Jule", "August", "September", "October", "November", "December"]

for month in 0..<countDays.count {
    
    print("count days in \(monthNames[month]) - \(countDays[month])")
}
print("---------------")

let months = [(name:"January", count:31),
              (name:"February", count:28),
              (name:"March", count:31),
              (name:"April", count:30),
              (name:"May", count:31),
              (name:"June", count:30),
              (name:"Jule", count:31),
              (name:"August", count:31),
              (name:"September", count:30),
              (name:"October", count:31),
              (name:"November", count:30),
              (name:"December", count:31)]

for month in months {
    print("count days in \(month.name) - \(month.count)")
}
print("--------------")

for var index in 0..<months.count {
    let month = months[months.count - 1 - index]
    print("count days in \(month.name) - \(month.count)")
}
print("--------------")

let date = (month:2, day:5)
var days = 0

for month in 0..<months.count {
    if month + 1 < date.month {
        days += months[month].count
    } else {
        days += date.day
        break
    }
}

print("count days - \(days)")
print("-------------------------------")

let arrayString = ["15", "12.5", "lkj", "96d", "32"]
var sum = 0

for element in arrayString {
    
    let number = Int(element)
    if number != nil {
        sum += number!
    }
    
}
print("sum = \(sum)")
print("--------------")

sum = 0
for element in arrayString {
    
    let value = Int(element)
    if let number = value {
        sum += number
    }
    
}
print("sum = \(sum)")
print("--------------")

sum = 0
for element in arrayString {
    
    let number = Int(element) ?? 0
    sum += number
    
}
print("sum = \(sum)")
print("-------------------------------")

let alphabetic = "abcdefghijklmnopqrstuvwxyz"

var array = [String]()

for char in alphabetic {
    
    let str = String(char)
    array.append(str)
    
}

print(array)
