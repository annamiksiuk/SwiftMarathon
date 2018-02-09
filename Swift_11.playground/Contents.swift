//1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.

func empty (block:() -> ()) {
    
    var count = 0
    
    while count < 10 {
        count += 1
        print(count)
    }
    
    block()
}

empty {
    print("End calculate")
    return
}

//2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.
print("------------------------")

let array = [1, 10, 9, 3, 6, -44, 20, 59, 82, 91, -3, -5, 2]

let sortedArray =
array.sorted { (a, b) -> Bool in a > b }

print(sortedArray)

let sortedArray2 =
    array.sorted { (a, b) -> Bool in a < b }

print(sortedArray2)

//3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную. используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.

print("------------------------")

func getValueFromArray (array: [Int], condition: (Int, Int?) -> Bool) -> Int? {
    
    var result : Int?
    
    for value in array {
        if condition(value, result) {
            result = value
        }
    }
    
    return result
    
}

let minElement = getValueFromArray(array: array) { (a, b) -> Bool in
    if let minValue = b {
        return a < minValue
    }
    return true
}

if minElement != nil {
    print("min value - \(minElement!)")
}

let maxElement = getValueFromArray(array: array) { (a, b) -> Bool in b == nil ? true : a > b! }

if maxElement != nil {
    print("max value - \(maxElement!)")
}

//4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы

print("------------------------")

let text = "If the first string (s1) is greater than the second string (s2), the backward(_:_:) function will return true, indicating that s1 should appear before s2 in the sorted array. For characters in strings, greater than means appears later in the alphabet than. This means that the letter B is greater than the letter A, and the string Tom is greater than the string Tim. This gives a reverse alphabetical sort, with Barry being placed before Alex, and so on."

var letters = [Character]()
for char in text {
    letters.append(char)
}

let signs = "\"!@#$%^&*()_+:;-=,.<>/?"
let vowels = "aeyuoiAUIOEY"
let numbers = "0123456789"

let sortedLetters = letters.sorted { (a, b) -> Bool in

    if signs.contains(b) {
        return true
    } else if signs.contains(a) {
        return false
    }
    
    if numbers.contains(b) {
        return true
    } else if numbers.contains(a) {
        return false
    }
    
    if vowels.contains(a) && vowels.contains(b) {
        return a < b
    }
    
    if vowels.contains(a) {
        return true
    } else if vowels.contains(b) {
        return false
    }
 
    return a < b
 
}

var sortedText = String()
for letter in sortedLetters {
    sortedText.append(letter)
}
print(sortedText)

//5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)

print("------------------------")

func getValueFromString (text: String, condition: (Character, Character?) -> Bool) -> Character? {
    
    var result : Character?
    
    for char in text {
        if condition(char, result) {
            result = char
        }
    }
    
    return result
    
}

let text1 = "jkhlkjKJHJKbmb$Z^&*(jnjmb18993poeijnbv"

let minChar = getValueFromString(text: text1) { (a, b) -> Bool in b == nil ? true : a < b! }

if minChar != nil {
    print("min char - \(minChar!)")
}

let maxChar = getValueFromString(text: text1) { (a, b) -> Bool in b == nil ? true : a > b! }

if maxChar != nil {
    print("max char - \(maxChar!)")
}
