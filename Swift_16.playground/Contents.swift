//1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
//2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
//Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
//3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
//4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)
//5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)

import Foundation

class Subject {
    
    var X : Int {
        didSet {
            if X <= 0 {
                X = oldValue
            }
        }
    }
    var Y : Int {
        didSet {
            if Y <= 0 {
                Y = oldValue
            }
        }
    }
    
    init(X:Int, Y:Int) {
        self.X = X
        if self.X <= 0 {
            self.X = 1
        }
        self.Y = Y
        if self.Y <= 0 {
            self.Y = 1
        }
    }
    
}

class Room {
    
    var width : Int {
        didSet {
            if width <= 0 {
                width = oldValue
            }
        }
    }
    
    var height : Int {
        didSet {
            if height <= 0 {
                height = oldValue
            }
        }
    }

    var person : Subject
    var box : Subject
    var goal : Subject
    
    enum Direction {
        case Top
        case Bottom
        case Left
        case Right
    }

    init(width:Int, height:Int, person:Subject, box: Subject, goal: Subject) {
        self.width = width < 0 ? 0 : width
        self.height = height < 0 ? 0 : height
        self.person = person
        if self.person.X > width {
            self.person.X = width
        }
        if self.person.Y > height {
            self.person.Y = height
        }
        self.box = box
        if self.box.X > width {
            self.box.X = width
        }
        if self.box.Y > height {
            self.box.Y = height
        }
        self.goal = goal
        if self.goal.X > width {
            self.goal.X = width
        }
        if self.goal.Y > height {
            self.goal.Y = height
        }
    }
    
    func showRoom() {
        
        var currentString = String()

        for w in 1...width {
            currentString = ""
            for h in 1...height {
                
                if person.X == h && person.Y == w {
                    currentString += "🤾‍♂️"
                } else if box.X == h && box.Y == w {
                    currentString += "⚽️"
                } else if goal.X == h && goal.Y == w {
                    currentString += "🥅"
                } else {
                    currentString += "⬜️"
                }
            }
            print(currentString)
        }
    }
    
    func movePerson(inDirection: Direction) {
        
        let prevPosPerson = Subject(X: person.X, Y: person.Y)
        
        switch inDirection {
        case .Top:
            person.Y -= 1
        case .Bottom:
            if person.Y < height {
                person.Y += 1
            }
        case .Left:
            person.X -= 1
        case .Right:
            if person.X < width {
                person.X += 1
            }
        }
        
        if person.X == box.X && person.Y == box.Y {
            
            let isMove = moveBox(inDirection: inDirection)
            if !isMove {
                person = prevPosPerson
            }
        }
    }
    
    func moveBox(inDirection: Direction) -> Bool {
        
        let prevPosBox = Subject(X: box.X, Y: box.Y)
        switch inDirection {
        case .Top:
            box.Y -= 1
        case .Bottom:
            if box.Y < height {
                box.Y += 1
            }
        case .Left:
            box.X -= 1
        case .Right:
            if box.X < width {
                box.X += 1
            }
        }
        
        if goal.X == box.X && goal.Y == box.Y {
            goal = Subject(X: Int(arc4random_uniform(9) + 1), Y: Int(arc4random_uniform(9) + 1))
        }
        if prevPosBox.X == box.X && prevPosBox.Y == box.Y {
            return false
        }
        return true
    }
    
}
var myRoom = Room(width: 10, height: 10, person: Subject(X:5, Y:5), box: Subject(X: 3, Y: 3), goal: Subject(X: 3, Y: 2))

myRoom.showRoom()
myRoom.movePerson(inDirection: .Left)
print("")
myRoom.showRoom()
myRoom.movePerson(inDirection: .Left)
print("")
myRoom.showRoom()
myRoom.movePerson(inDirection: .Top)
print("")
myRoom.showRoom()
myRoom.movePerson(inDirection: .Top)
print("")
myRoom.showRoom()



