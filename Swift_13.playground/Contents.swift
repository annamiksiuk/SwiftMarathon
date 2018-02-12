//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).

struct StudentStruct {
    
    var firstName : String
    var lastName : String
    var yearOfBirth : Int
    var score : Float
    
}

let student1 = StudentStruct(firstName: "Anna", lastName: "Miksiuk", yearOfBirth: 1984, score: 4.5)
let student2 = StudentStruct(firstName: "Alex", lastName: "Ivanov", yearOfBirth: 1980, score: 4.6)
let student3 = StudentStruct(firstName: "Andrey", lastName: "Petrov", yearOfBirth: 1990, score: 4.2)
let student4 = StudentStruct(firstName: "Irina", lastName: "Maslova", yearOfBirth: 1988, score: 3.9)

var journal = [student1, student2, student3, student4]

//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.

func descriptionStudent (student : StudentStruct) -> String {
    
    return "\(student.lastName) \(student.firstName), year of bitrh - \(student.yearOfBirth), average score - \(student.score)"
    
}

func printJournal (list: [StudentStruct]) {
    
    print("------JOURNAL--------")
    var number = 1
    
    for value in list {
        print("\(number). \(descriptionStudent(student: value))")
        number += 1
    }
}

printJournal(list: journal)

//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.

journal.sort { (st1, st2) -> Bool in
    st1.score > st2.score
}
printJournal(list: journal)

//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.

journal.sort { (st1, st2) -> Bool in
    st1.lastName == st2.lastName ? st1.firstName < st2.firstName : st1.lastName < st2.lastName
}
printJournal(list: journal)

//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

var newJournal = journal

newJournal[0].firstName = "Sergey"

printJournal(list: newJournal)
printJournal(list: journal)

//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
print("++++++++++++++++++++++++++++++++++++")
class StudentClass {
    
    var firstName : String
    var lastName : String
    var yearOfBirth : Int
    var score : Float
    
    init(firstName: String, lastName: String, yearOfBirth: Int, score: Float) {
        self.firstName = firstName
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
        self.score = score
    }
 
}

func descriptionStudent (student : StudentClass) -> String {
    
    return "\(student.lastName) \(student.firstName), year of bitrh - \(student.yearOfBirth), average score - \(student.score)"
    
}

func printJournal (list: [StudentClass]) {
    
    print("------JOURNAL--------")
    var number = 1
    
    for value in list {
        print("\(number). \(descriptionStudent(student: value))")
        number += 1
    }
}

let st1 = StudentClass(firstName: "Ivan", lastName: "Korolev", yearOfBirth: 1990, score: 3.0)
let st2 = StudentClass(firstName: "Sergey", lastName: "Laptev", yearOfBirth: 1995, score: 4.8)
let st3 = StudentClass(firstName: "Marina", lastName: "Koroleva", yearOfBirth: 1979, score: 4.9)

var journal2 = [st1, st2, st3]
printJournal(list: journal2)

journal2.sort { (st1, st2) -> Bool in
    st1.score > st2.score
}

printJournal(list: journal2)

journal2.sort { (st1, st2) -> Bool in
    st1.lastName == st2.lastName ? st1.firstName < st2.firstName : st1.lastName < st2.lastName
}
printJournal(list: journal2)

var newJournal2 = journal2

newJournal2[0].firstName = "Sergey"

printJournal(list: newJournal2)
printJournal(list: journal2)

//7. Выполните задание шахмат из урока по энумам используя структуры либо классы
//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур

enum PositionX : Int {
    case A = 1
    case B = 2
    case C = 3
    case D = 4
    case E = 5
    case F = 6
    case G = 7
    case H = 8
}

enum ColorChess : String {
    case White = "White"
    case Black = "Black"
}

enum NamePiece : String {
    
    case King = "King"
    case Queen = "Queen"
    case Knight = "Knight"
    case Bishop = "Bishop"
    case Rook = "Rook"
    case Pawn = "Pawn"
    
}

struct Piece {
    
    var name : NamePiece
    var color : ColorChess
    var position : (x : PositionX, y : Int)
    
}

let piece1 = Piece(name: .King, color: .Black, position: (.H, 8))
let piece2 = Piece(name: .Queen, color: .White, position: (.G, 4))
let piece3 = Piece(name: .Knight, color: .White, position: (.F, 6))
let piece4 = Piece(name: .Rook, color: .White, position: (.C, 7))
let piece5 = Piece(name: .Rook, color: .Black, position: (.E, 5))

var pieces = [piece1, piece2, piece3, piece4, piece5]

//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.

print("------------------------")

func descriptionPiece (piece: Piece) {
    
    print("\(piece.name.rawValue) \(piece.color.rawValue) position: \(piece.position.x)\(piece.position.y)")
    
}

for piece in pieces {
    descriptionPiece(piece: piece)
}

//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)

print("------------------------")

func symbolPiece (piece: Piece) -> Character {
    
    switch (piece.name, piece.color) {
    case (.King, let color) :
        return color == .White ? "\u{2654}" : "\u{265A}"
    case (.Queen, let color) :
        return color == .White ? "\u{2655}" : "\u{265B}"
    case (.Knight, let color) :
        return color == .White ? "\u{2658}" : "\u{265E}"
    case (.Rook, let color) :
        return color == .White ? "\u{2656}" : "\u{265C}"
    case (.Bishop, let color) :
        return color == .White ? "\u{2657}" : "\u{265D}"
    case (.Pawn, let color) :
        return color == .White ? "\u{2659}" : "\u{265F}"
    }
}

func cell (x: Int, y: Int) -> Character {
    
    return x % 2 == y % 2 ? "\u{25FE}" : "\u{25FD}"
    
}

func chessboard (pieces: [Piece]) {
    
    var vert = 8
    
    while vert > 0 {
        
        var row = String()
        
        for hor in 1...8 {
            
            var symbol = cell(x: hor, y: vert)
            
            for piece in pieces {
                
                if piece.position.x.rawValue == hor && piece.position.y == vert {
                    symbol = symbolPiece(piece: piece)
                }
                
            }
            row.append(symbol)
        }
        print(row)
        vert -= 1
    }
}

chessboard(pieces: pieces)

//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.

func canMovePiece(piece: Piece, to: (x: Int, y: Int)) -> Bool {
    
    if to.y < 1 || to.y > 8 {
        return false
    }
    
    if piece.position.x.rawValue == to.x && piece.position.y == to.y {
        return false
    }
    
    let offsetX = abs(piece.position.x.rawValue - to.x)
    let offsetY = abs(piece.position.y - to.y)
    
    switch piece.name {
        
    case .King:
        return (offsetX == 1 && offsetY == 0) || (offsetX == 0 && offsetY == 1)
    case .Queen:
        return (offsetX == 0) || (offsetY == 0) || (offsetY == offsetX)
    case .Knight:
        return (offsetX == 1 && offsetY == 2) || (offsetX == 2 && offsetY == 1)
    case .Bishop:
        return offsetY == offsetX
    case .Rook:
        return (offsetX == 0) || (offsetY == 0)
    case .Pawn:
        return (offsetX <= 1) && (offsetY <= 1)
    }
    
}

func movePiece (piece: inout Piece, toPosition to: (x: PositionX, y: Int)) -> Bool {
    
    if canMovePiece(piece: piece, to: (to.x.rawValue, to.y)) {
        piece.position.x = to.x
        piece.position.y = to.y
        return true
    }
    
    return false
}

print("------------------------")
movePiece(piece: &pieces[0], toPosition: (.H, 7))
chessboard(pieces: pieces)

movePiece(piece: &pieces[1], toPosition: (.F, 7))
movePiece(piece: &pieces[1], toPosition: (.F, 4))

print("------------------------")
chessboard(pieces: pieces)

movePiece(piece: &pieces[3], toPosition: (.C, 1))

print("------------------------")
chessboard(pieces: pieces)

