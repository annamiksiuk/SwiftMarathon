//Шахматная доска (Легкий уровень) 1. Создайте тип шахматная доска. 2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра). 3. Если юзер ошибся координатами - выдавайте нил

enum ColorCell {
    case White
    case Black
}

struct ChessBoard {
    
    func indexFor(column: String) -> Int? {
        
        if column.count > 1 || column.count == 0 {
            return nil
        }
        switch column {
        case "a":
            return 1
        case "b":
            return 2
        case "c":
            return 3
        case "d":
            return 4
        case "e":
            return 5
        case "f":
            return 6
        case "g":
            return 7
        case "h":
            return 8
        default:
            return nil
        }
    }
    
    subscript (column:String, row: Int)  -> ColorCell? {
        if let col = indexFor(column: column) {
            if row <= 0 || row > 8 {
                return nil
            }
            if col % 2 == row % 2 {
                return ColorCell.Black
            }
            return ColorCell.White
        }
        return nil
    }
    
}

var board = ChessBoard()

let colorCell = board["h",8]

if colorCell != nil {
    print(colorCell!)
} else {
    print("Incorrect")
}

//Крестики нолики (Средний уровень)
//1. Создать тип, представляющий собой поле для игры в крестики нолики На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик Добавьте возможность красиво распечатывать поле
//2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу, причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
//3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
//4. Если хотите, добавте алгоритм, который вычислит победителя

enum TypeCell {
    case Empty
    case Cross
    case Zero
}

struct Field {
    
    var size = 3
    private var cells = [String: TypeCell]()
    
    func keyFor(column: Int, row: Int) -> String {
        return String(column) + String(row)
    }
    
    func valueForCellAt(column: Int, atRow: Int) -> TypeCell {
        if let value = cells[keyFor(column: column, row: atRow)] {
            switch value {
            case .Cross:
                return .Cross
            default:
                return .Zero
            }
        }
        return .Empty
    }
    
    func canSet(value: TypeCell, forColumn col: Int, andRow row: Int) -> Bool {

        if valueForCellAt(column: col, atRow: row) != .Empty {
            return false
        }
        return true
    }
    
    func symbolForCellAt(column: Int, atRow: Int) -> String {
        switch valueForCellAt(column: column, atRow: atRow) {
        case .Empty:
            return "⬜️"
        case .Cross:
            return "✖️"
        case .Zero:
            return "🔘"
        }
    }
    
    func description() {
        
        var row = size
        while row >= 1 {
            var printString = String()
            for col in 1...size {
                printString += symbolForCellAt(column: col, atRow: row)
            }
            print(printString)
            row -= 1
        }
 
        print("")
    }
    
    mutating func clearField() {
        cells.removeAll()
    }
    
    subscript (column: Int, row: Int) -> TypeCell? {
        get {
            if column <= 0 || column > size {
                return nil
            }
            if row <= 0 || row > size {
                return nil
            }
            return valueForCellAt(column: column, atRow: row)
        }
        set {
            if column <= 0 || column > size {
                return
            }
            if row <= 0 || row > size {
                return
            }
            if canSet(value: newValue!, forColumn: column, andRow: row) {
                cells[keyFor(column: column, row: row)] = newValue
            }
        }
    }
}

var myField = Field()

myField.description()
myField[1,1] = TypeCell.Cross
myField[2,2] = TypeCell.Zero
myField.description()
myField[2,2] = TypeCell.Cross
myField.description()
myField[3,3] = TypeCell.Cross
myField[2,1] = TypeCell.Zero
myField[3,2] = TypeCell.Cross
myField[2,3] = TypeCell.Zero
myField.description()

