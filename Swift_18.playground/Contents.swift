//1. У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление. Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод "выступление"
class Artist {
    var firstName : String
    var lastName : String
    var fullName : String {
        return firstName + " " + lastName
    }
    func perfomance() -> String {
        return "My name is " + fullName + ". I'm speaking!"
    }
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
class Dancer : Artist {
    override func perfomance() -> String {
        return "My name is " + fullName + ". - I really dance good!"
    }
}
class Singer : Artist {
    override func perfomance() -> String {
        return "My name is " + fullName + ". - I really sing beautiful!"
    }
}
class Painter : Artist {
    override func perfomance() -> String {
        return "My name is Lolly - I draw the best pictures!"
    }
}
let artist = Artist(firstName: "Nikolay", lastName: "Petrov")
let dancer = Dancer(firstName: "Alina", lastName: "Samojlova")
let singer = Singer(firstName: "Bogena", lastName: "Lo")
let painter = Painter(firstName: "Andry", lastName: "Initza")
let artists = [artist, dancer, singer, painter]
for person in artists {
    print(person.perfomance())
}

//2. Создать базовый клас "транспортное средство" и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок). Используем полиморфизм

import Foundation

class Transport {
  var name : String {
    return "Transport"
  }
  var speed : Float {
    return 0
  }
  var capacity : Int {
    return 0
  }
  var cost : Float {
      return 1
  }
  func calculateCost(distance:Int, countPerson:Int) -> (time: Float, cost: Float, count: Int) {
    let countTrip = lroundf(Float(countPerson / capacity)) + 1
    let time = Float(distance) / speed
    let totalTimeTrip = time * Float(countTrip)
    let totalCost = Float(countTrip) * cost
    return (totalTimeTrip, totalCost, countTrip)
  }
}

class Airplane : Transport {
  override var name : String {
    return "Airplane"
  }
  override var speed: Float {
    return 220.4
  }
  override var capacity : Int {
    return 65
  }
  override var cost : Float {
    return 1500
  }
}

class Ship : Transport {
  override var name : String {
    return "Ship"
  }
  override var speed: Float {
    return 90.5
  }
  override var capacity : Int {
    return 120
  }
  override var cost : Float {
    return 890
  }
}

class Helicopter : Transport {
  override var name : String {
    return "Helicopter"
  }
  override var speed: Float {
    return 120.4
  }
  override var capacity : Int {
    return 7
  }
  override var cost : Float {
    return 1800
  }
}

class Car : Transport {
  override var name : String {
    return "Car"
  }
  override var speed: Float {
    return 70
  }
  override var capacity : Int {
    return 5
  }
  override var cost : Float {
    return 50
  }
}

let airplane = Airplane()
let ship = Ship()
let helicopter = Helicopter()
let car = Car()

let transports = [airplane, ship, helicopter, car]
let distance = 500
let countPerson = 400

for transport in transports {
  
  let result = transport.calculateCost(distance: distance, countPerson: countPerson)
  print("\(transport.name) transport \(countPerson) people: total time - \(result.time), total cost - \(result.cost), total trip - \(result.count)")
  
}

