//1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.

func heart() -> String {

    return "\u{1F496}"
    
}

func rainbow() -> String {
    
    return "\u{1F308}"
    
}

func showflake() -> String {
    
    return "\u{2744}"
    
}

print(heart() + rainbow() + showflake())

//2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль

func getColorCell(inHorizontal hor: Character, inVertical vert: Int) -> String {
    
    var color = "BLACK"
    
    if vert % 2 == 1 {
        
        if hor == "b" || hor == "d" || hor == "g" || hor == "h" {
            color = "WHITE"
        }
        
    } else {
        
        if hor == "a" || hor == "c" || hor == "e" || hor == "g" {
            color = "WHITE"
        }
    }
    
    return color
}

let cell : (Character, Int) = ("a", 5)

print("cell \(cell.0)\(cell.1) - " + getColorCell(inHorizontal: cell.0, inVertical: cell.1))

//3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.

func inverse (inArray: [Int]) -> [Int] {
    
    var array = inArray
    for index in 0..<array.count / 2 {
        let temp = array[index]
        array[index] = array[array.count - 1 - index]
        array[array.count - 1 - index] = temp
    }
    
    return array
    
}

func inverse (inSequence: Int...) -> [Int] {
    
    var array = [Int]()
    
    for value in inSequence {
        array.append(value)
    }
    return inverse(inArray: array)
    
}

let inArray = [1, 2, 3, 4, 5, 6]
print("in array - \(inArray)   inverse array - \(inverse(inArray: inArray))")
inArray

print("in sequence - 10, 9, 8, 7, 6    inverse array - \(inverse(inSequence: 10, 9, 8, 7, 6))")

//4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

func inverse (array: inout [Int]){
    
    for index in 0..<array.count / 2 {
        let temp = array[index]
        array[index] = array[array.count - 1 - index]
        array[array.count - 1 - index] = temp
    }
    
}

var inArray2 = [11, 12, 13, 14, 15]

print(inArray2)
inverse(array: &inArray2)
print(inArray2)

//5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

func funnyTransform (string: String) -> String {
    
    
    let signs = ".,?!-"
    let vowels = "aeyuoiAUIOEY"
    let numbers = "0123456789"
    let nameNumber : [Character : String] = ["0" : "zero", "1" : "one", "2" : "two", "3" : "three", "4" : "four", "5" : "five", "6" : "six", "7" : "seven", "8" : "eight", "9" : "nine"]
    
    var funny = String()
    
    for char in string {
        
        var symbol = String()
        symbol.append(char)

        switch char {
            
        case _ where signs.contains(char):
            break
            
        case _ where vowels.contains(char):
            funny.append(symbol.uppercased())
            
        case _ where numbers.contains(char):
            funny.append(nameNumber[char]!)
            
        default:
            funny.append(symbol.lowercased())
            break
        }
        
    }
    
    return funny
}


var text = "All of the functions you have encountered so far in this chapter have been examples of global functions, which are defined at a global scope. You can also define                                                           functions inside the bodies of other functions, known as nested functions. Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope. You can rewrite the chooseStepFunction(backward:) example above to use and return nested functions: func chooseStepFunction(backward: Bool) -> (Int) -> Int {func stepForward(input: Int) -> Int { return input + 1 } func stepBackward(input: Int) -> Int { return input - 1 } return backward ? stepBackward : stepForward} var currentValue = -4"

print(funnyTransform(string: text))






