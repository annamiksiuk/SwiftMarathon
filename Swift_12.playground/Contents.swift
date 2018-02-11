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

enum Piece : RawRepresentable {
    
    case King   (color: ColorChess, positionX: PositionX, positionY: Int)
    case Queen  (color: ColorChess, positionX: PositionX, positionY: Int)
    case Knight (color: ColorChess, positionX: PositionX, positionY: Int)
    case Bishop (color: ColorChess, positionX: PositionX, positionY: Int)
    case Rook   (color: ColorChess, positionX: PositionX, positionY: Int)
    case Pawn   (color: ColorChess, positionX: PositionX, positionY: Int)
    
    init? (rawValue: String) {
        
        switch rawValue {
        case "King":
            self = .King(color: .White, positionX: .D, positionY: 1)
        case "Queen":
            self = .Queen(color: .White, positionX: .E, positionY: 1)
        case "Knight":
            self = .Knight(color: .White, positionX: .B, positionY: 1)
        case "Bishop":
            self = .Bishop(color: .White, positionX: .C, positionY: 1)
        case "Rook":
            self = .Rook(color: .White, positionX: .A, positionY: 1)
        case "Pawn":
            self = .Pawn(color: .White, positionX: .A, positionY: 2)
        default:
            return nil
        }

    }
 
    var rawValue: String {
        
        switch self {
        case .King:
            return "King"
        case .Queen:
            return "Queen"
        case .Knight:
            return "Knight"
        case .Bishop:
            return "Bishop"
        case .Rook:
            return "Rook"
        case .Pawn:
            return "Pawn"
        }
    }
    
}

let figure = Piece.King(color: .Black, positionX: .H, positionY: 8)
let figure2 = Piece.Queen(color: .White, positionX: .G, positionY: 4)
let figure3 = Piece.Knight(color: .White, positionX: .F, positionY: 6)
let figure4 = Piece.Rook(color: .White, positionX: .C, positionY: 7)
let figure5 = Piece.Rook(color: .Black, positionX: .E, positionY: 5)

var figures = [figure, figure2, figure3, figure4, figure5]


//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.

print("------------------------")

func descriptionPiece (piece: Piece) {
    
    switch piece {
    case .King (let color, let X, let Y):
        print("\(piece.rawValue) \(color) position: \(X)\(Y)")
    case .Queen (let color, let X, let Y):
        print("\(piece.rawValue) \(color) position: \(X)\(Y)")
    case .Knight  (let color, let X, let Y):
        print("\(piece.rawValue) \(color) position: \(X)\(Y)")
    case .Rook (let color, let X, let Y):
        print("\(piece.rawValue) \(color) position: \(X)\(Y)")
    case .Bishop (let color, let X, let Y):
        print("\(piece.rawValue) \(color) position: \(X)\(Y)")
    case .Pawn (let color, let X, let Y):
        print("\(piece.rawValue) \(color) position: \(X)\(Y)")
    }
    
}

for piece in figures {
    descriptionPiece(piece: piece)
}

//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)

print("------------------------")

func symbolPiece (piece: Piece) -> Character {

    switch piece {
    case .King (let color, _, _):
        return color == .White ? "\u{2654}" : "\u{265A}"
    case .Queen (let color, _, _):
        return color == .White ? "\u{2655}" : "\u{265B}"
    case .Knight (let color, _, _):
        return color == .White ? "\u{2658}" : "\u{265E}"
    case .Rook (let color, _, _):
        return color == .White ? "\u{2656}" : "\u{265C}"
    case .Bishop (let color, _, _):
        return color == .White ? "\u{2657}" : "\u{265D}"
    case .Pawn (let color, _, _):
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
                
                switch piece {
                    
                case .King (_, let X, let Y) where X.rawValue == hor && Y == vert:
                    symbol = symbolPiece(piece: piece)
                case .Queen (_, let X, let Y) where X.rawValue == hor && Y == vert:
                    symbol = symbolPiece(piece: piece)
                case .Knight (_, let X, let Y) where X.rawValue == hor && Y == vert:
                    symbol = symbolPiece(piece: piece)
                case .Bishop (_, let X, let Y) where X.rawValue == hor && Y == vert:
                    symbol = symbolPiece(piece: piece)
                case .Rook (_, let X, let Y) where X.rawValue == hor && Y == vert:
                    symbol = symbolPiece(piece: piece)
                case .Pawn (_, let X, let Y) where X.rawValue == hor && Y == vert:
                    symbol = symbolPiece(piece: piece)
                default:
                    break
                }

            }
            row.append(symbol)
        }
        print(row)
        vert -= 1
    }
}

chessboard(pieces: figures)

//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.

func canMovesKing(fromPosition from: (Int, Int), toPosition to: (Int, Int)) -> Bool {
    
    if from == to {
        return false
    }
    
    let offsetX = abs(from.0 - to.0)
    let offsetY = abs(from.1 - to.1)
    
    return (offsetX == 1 && offsetY == 0) || (offsetX == 0 && offsetY == 1)
    
}

func canMovesQueen(fromPosition from: (Int, Int), toPosition to: (Int, Int)) -> Bool {
    
    if from == to {
        return false
    }
    
    let offsetX = abs(from.0 - to.0)
    let offsetY = abs(from.1 - to.1)
    
    return (offsetX == 0) || (offsetY == 0) || (offsetY == offsetX)
    
}

func canMovesKnight(fromPosition from: (Int, Int), toPosition to: (Int, Int)) -> Bool {
    
    if from == to {
        return false
    }
    
    let offsetX = abs(from.0 - to.0)
    let offsetY = abs(from.1 - to.1)
    
    return (offsetX == 1 && offsetY == 2) || (offsetX == 2 && offsetY == 1)
    
}

func canMovesRook(fromPosition from: (Int, Int), toPosition to: (Int, Int)) -> Bool {
    
    if from == to {
        return false
    }
    
    let offsetX = abs(from.0 - to.0)
    let offsetY = abs(from.1 - to.1)
    
    return (offsetX == 0) || (offsetY == 0)
    
}

func canMovesBishop(fromPosition from: (Int, Int), toPosition to: (Int, Int)) -> Bool {
    
    if from == to {
        return false
    }
    
    let offsetX = abs(from.0 - to.0)
    let offsetY = abs(from.1 - to.1)
    
    return (offsetY == offsetX)
    
}

func canMovesPawn(fromPosition from: (Int, Int), toPosition to: (Int, Int)) -> Bool {
    
    if from == to {
        return false
    }
    
    let offsetX = abs(from.0 - to.0)
    let offsetY = abs(from.1 - to.1)
    
    return (offsetX <= 1) && (offsetY <= 1)
    
}

func movePiece (piece: inout Piece, toPosition to: (x: PositionX, y: Int)) -> Bool {
    
    if to.y < 1 || to.y > 8 {
        return false
    }
    
    switch piece {
        
    case .King (let color, let X, let Y) where canMovesKing(fromPosition: (X.rawValue, Y), toPosition: (to.x.rawValue, to.y)):
        piece = Piece.King(color: color, positionX: to.x, positionY: to.y)
        return true
    case .Queen (let color, let X, let Y) where canMovesQueen(fromPosition: (X.rawValue, Y), toPosition: (to.x.rawValue, to.y)):
        piece = Piece.Queen(color: color, positionX: to.x, positionY: to.y)
        return true
    case .Knight (let color, let X, let Y) where canMovesKnight(fromPosition: (X.rawValue, Y), toPosition: (to.x.rawValue, to.y)):
        piece = Piece.Knight(color: color, positionX: to.x, positionY: to.y)
        return true
    case .Bishop (let color, let X, let Y) where canMovesBishop(fromPosition: (X.rawValue, Y), toPosition: (to.x.rawValue, to.y)):
        piece = Piece.Bishop(color: color, positionX: to.x, positionY: to.y)
        return true
    case .Rook (let color, let X, let Y) where canMovesRook(fromPosition: (X.rawValue, Y), toPosition: (to.x.rawValue, to.y)):
        piece = Piece.Rook(color: color, positionX: to.x, positionY: to.y)
        return true
    case .Pawn (let color, let X, let Y) where canMovesPawn(fromPosition: (X.rawValue, Y), toPosition: (to.x.rawValue, to.y)):
        piece = Piece.Pawn(color: color, positionX: to.x, positionY: to.y)
        return true
    default:
        break
    }
    
    return false
}

print("------------------------")
movePiece(piece: &figures[0], toPosition: (.H, 7))
chessboard(pieces: figures)

movePiece(piece: &figures[1], toPosition: (.F, 7))
movePiece(piece: &figures[1], toPosition: (.F, 4))

print("------------------------")
chessboard(pieces: figures)

movePiece(piece: &figures[3], toPosition: (.C, 1))

print("------------------------")
chessboard(pieces: figures)
