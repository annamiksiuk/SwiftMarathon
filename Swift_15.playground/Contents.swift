/*
1. Создать структуру “Описание файла” содержащую свойства:
- путь к файлу
    - имя файла
        - максимальный размер файла на диске
            - путь к папке, содержащей этот файл
- тип файла (скрытый или нет)
- содержимое файла (можно просто симулировать контент)
*/

import Foundation

struct FileDescription {
    
    var path : String
    var name : String? {
        
        get {
            
            let componentsPath = path.components(separatedBy: "/")
            return componentsPath.last
        }
    }
    
    static let maxSize = 1024
    
    var pathFolder : String? {
        
        get {
            
            var componentsPath = path.components(separatedBy: "/")
            
            if componentsPath.count > 0 {
                
                componentsPath.removeLast()
                return componentsPath.joined(separator: "/")
            } else {
                
                return nil
            }
        }
    }
    
    var hidden = false
    lazy var contents = "This is the contents of your file"
    
    init(path: String, hidden: Bool) {
        self.path = path
        self.hidden = hidden
    }
    
}

var thisProject = FileDescription(path: "/Users/admin/Documents/Projects/Swift/Swift Marathon/Swift_15.playground", hidden: true)

print(thisProject.path)

if let fileName = thisProject.name {
    print(fileName)
}

if let folderPath = thisProject.pathFolder {
    print(folderPath)
}

print(thisProject.hidden)
print(thisProject.contents)

print("--------------------------")

//2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.

enum ColorSchemeGreen : Int, Hashable {
    
    case Pale = 0xd3e6d5
    case Khaki = 0xbec200
    case Spring = 0x7ecf01
    case Herbal = 0x2d6b01
    case Dark = 0x092201
    
    static var countColor : Int {
        
        return ColorSchemeGreen.lastColor.hashValue + 1
        
    }
    
    static func cases() -> AnySequence<ColorSchemeGreen> {
        return AnySequence { () -> AnyIterator<ColorSchemeGreen> in
            var raw = 0
            return AnyIterator {
                let current: ColorSchemeGreen = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: self, capacity: 1) { $0.pointee } }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        }
    }
    
    static var allValues: [ColorSchemeGreen] {
        return Array(self.cases())
    }
    
    static var firstColor : ColorSchemeGreen {
        
        return ColorSchemeGreen.allValues.first!
        
    }
    
    static var lastColor : ColorSchemeGreen {
        
        return ColorSchemeGreen.allValues.last!
        
    }
    
}

print("count color in ColorSchemeGreen - \(ColorSchemeGreen.countColor)")
print("first color in ColorSchemeGreen - \(ColorSchemeGreen.firstColor) 0x\(String(format:"%2X", ColorSchemeGreen.firstColor.rawValue))")
print("last color in ColorSchemeGreen - \(ColorSchemeGreen.lastColor) 0x\(String(format:"%2X", ColorSchemeGreen.lastColor.rawValue))")

print("--------------------------")

/*
    3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
    - минимальный и максимальный возраст каждого объекта
        - минимальную и максимальную длину имени и фамилии
            - минимально возможный рост и вес
                - самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
*/

class Human {
    
    var firstName : String {
        
        didSet {
            
            if firstName.count + lastName.count < Human.minLengthName || firstName.count + lastName.count > Human.maxLengthName {
                firstName = oldValue
            }
            
        }
    }
    var lastName : String {
        
        didSet {
            
            if firstName.count + lastName.count < Human.minLengthName || firstName.count + lastName.count > Human.maxLengthName {
                lastName = oldValue
            }
            
        }
        
    }
    var age : Int {
        
        didSet {
            
            if age < Human.minAge || age > Human.maxAge {
                age = oldValue
            }
            
        }
        
    }
    
    var height : Float {
        
        didSet {
            
            if height < Human.minHeight {
                
                height = oldValue
            }
            
        }
        
    }
    
    var weight : Float {
        
        didSet {
            
            if weight < Human.minWeight {
                
                weight = oldValue
            }
            
        }
        
    }
    
    static let minAge = 0
    static let maxAge = 115
    static let minLengthName = 6
    static let maxLengthName = 50
    static let minHeight : Float = 0.4
    static let minWeight : Float = 1.9
    
    static var countHumans = 0
    
    init(firstName: String, lastName: String, age: Int, height: Float, weight: Float) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.height = height
        self.weight = weight
        Human.countHumans += 1
    }
    
}

var man = Human(firstName: "Dmitry", lastName: "Ivanov", age: 34, height: 1.78, weight: 71.5)
var woman = Human(firstName: "Natalia", lastName: "Sidorova", age: 7, height: 1.20, weight: 23.1)

print("count Humans - \(Human.countHumans)")

print("\(man.firstName) \(man.lastName), age -  \(man.age), height - \(man.height), weight - \(man.weight)")
man.weight = 1.88
man.age = -90
man.firstName = "ffffffffffffffffffffffffffffffgghjk,mnbvcxsrtyuikl,mnbvcxdtyuiol,mnbvcxstyuilkm,nbvcdyuilkmnbvcd"
man.firstName = "Andy"
man.lastName = "L"
print("\(man.firstName) \(man.lastName), age -  \(man.age), height - \(man.height), weight - \(man.weight)")

print("--------------------------")
print("\(woman.firstName) \(woman.lastName), age -  \(woman.age), height - \(woman.height), weight - \(woman.weight)")
woman.age = 14
woman.height = 180
woman.weight = 120
print("\(woman.firstName) \(woman.lastName), age -  \(woman.age), height - \(woman.height), weight - \(woman.weight)")

