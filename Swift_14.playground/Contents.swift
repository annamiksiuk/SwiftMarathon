import Foundation
//1. Самостоятельно повторить проделанное в уроке
//2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)

struct MyDate {
    
    var day : Int
    var month : Int
    var year : Int
    
}

class Student {
    
    var firstName : String {
        
        didSet {
            
            firstName = firstName.capitalized
        }
    }
    
    var lastName : String {
        
        didSet {
        
            lastName = lastName.capitalized
        }
    }
    
    var fullName : String {
        
        get {
            
            return firstName + " " + lastName
            
        }
        
        set {
            
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0];
            }
            
            if words.count > 1 {
                lastName = words[1];
            }
        }
    }
    
    var dateOfBirth : MyDate
    
    var age : Int {
        
        get {
            
            return 2018 - dateOfBirth.year
        }
    }
    
    var study : Int {
        
        get {
            
            if age <= 6 {
                return 0
                
            } else if age > 23 {
                return 11 + 5
                
            } else {
                return age - 6
                
            }
            
        }
     
    }
    
    init(firstName: String, lastName: String, dateOfBirth: MyDate) {
        
        self.firstName = firstName.capitalized
        self.lastName = lastName.capitalized
        self.dateOfBirth = dateOfBirth
        
    }
}

var st1 = Student(firstName: "annn", lastName: "dkffj", dateOfBirth: MyDate(day: 30, month: 15, year: 1998))

st1.firstName
st1.lastName
st1.fullName
st1.age
st1.study

//3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)

//4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B

struct MyPoint {
    var X : Float
    var Y : Float
}

struct Segment {
    var startPoint : MyPoint
    var endPoint : MyPoint
    
    var middlePoint : MyPoint {
        
        get {
            
            return MyPoint(X: (startPoint.X + endPoint.X) / 2, Y: (startPoint.Y + endPoint.Y) / 2)
            
        }
        
        set {
            
            let offsetX = newValue.X - middlePoint.X
            let offsetY = newValue.Y - middlePoint.Y
            startPoint.X += offsetX
            startPoint.Y += offsetY
            endPoint.X += offsetX
            endPoint.Y += offsetY
            
        }
        
        
    }
    
    var length : Float {
        
        get {
            
            return sqrt(pow(endPoint.Y - startPoint.Y, 2) + pow(endPoint.X - startPoint.X, 2))

        }
        
        set {
            
            endPoint.Y = (endPoint.Y - startPoint.Y) * newValue / length + startPoint.Y
            endPoint.X = (endPoint.X - startPoint.X) * newValue / length + startPoint.X
            
        }
    }
}

let startPoint = MyPoint(X: 1, Y: 1)
let endPoint = MyPoint(X: 3, Y: 3)

var segment = Segment(startPoint: startPoint , endPoint: endPoint)

print("\(segment.startPoint) - \(segment.endPoint), length - \(segment.length), middle - \(segment.middlePoint)")

segment.length = 2
print("new length")
print("\(segment.startPoint) - \(segment.endPoint), length - \(segment.length), middle - \(segment.middlePoint)")

print("new middle point")
segment.middlePoint = MyPoint(X: 1, Y: 1)
print("\(segment.startPoint) - \(segment.endPoint), length - \(segment.length), middle - \(segment.middlePoint)")

