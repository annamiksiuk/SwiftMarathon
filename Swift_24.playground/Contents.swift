/*
 1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool
 2. Добавьте проперти, которое возвращает количество символов в числе
 3. Добавьте сабскрипт, который возвращает символ числа по индексу:
 let a = 8245
 a[1] // 4
 a[3] // 8
*/

extension Int {
  
  var isNegative: Bool {
    return self < 0
  }
  
  var isPositive: Bool {
    return self > 0
  }
  
  var zero: Bool {
    return !isNegative && !isPositive
  }
  
  var length: Int {
    return self.string.count
  }
  
  init? (_ ch: Character) {
    let string = String(ch)
    self.init(string)
  }
  
  private var string: String {
    return self.isNegative ? String(-self) : String(self)
  }
  
  subscript (index: Int) -> Int? {
    get {
      if index >= 0 || index < self.length {
        var i = 0
        for ch in self.string {
          if index == self.string.count - 1 - i {
            return Int(ch)
          }
          i += 1
        }
      }
      return nil
    }
    set {
      if index >= 0 || index < self.length {
        var i = 0
        var newSelf = ""
        for ch in self.string {
          if index == self.string.count - 1 - i {
            guard let value = newValue else { break }
            newSelf += String(value)
          } else {
            newSelf += String(ch)
          }
          i += 1
        }
        if let correctedValue = Int(newSelf) {
          self = correctedValue
        }
      }
    }
  }
}

var a = 123
a.isPositive
a.isNegative
a.zero

a.length

a[0]

a[2] = 9

a

//4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его
//5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие: let s = "Hi hi hi" s.truncate(4) // Hi h...  s.truncate(10) // Hi hi hi
extension String {
  subscript(range: CountableRange<Int>) -> Substring {
    get {
      return self[index(startIndex, offsetBy: range.lowerBound)..<index(startIndex, offsetBy: range.upperBound)]
    }
    set {
      let start = self[..<index(startIndex, offsetBy: range.lowerBound)]
      let finish = self[index(startIndex, offsetBy: range.upperBound)...]
      self = String(start) + newValue + String(finish)
    }
  }
  func truncate(count: Int) -> String {
    switch count {
    case _ where count < self.count:
      return self[0..<count] + "..."
    default:
      return self
    }
  }
}

var test = "qwerty"
test[1..<3]
test[4..<5] = "aaa"
test
test[0..<3] = "QWE"
test

test.truncate(count: 10)
test.truncate(count: 2)
test.truncate(count: 0)
test.truncate(count: 8)
test.truncate(count: 7)
test.truncate(count: 3)


