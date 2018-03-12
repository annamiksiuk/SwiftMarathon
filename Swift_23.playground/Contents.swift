/*
 1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).
 Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
 Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд
 2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
 У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
 Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
 3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
 Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
 Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
 Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
*/

class Pet {
  func sound() {
  }
}

class Cat : Pet {
  override func sound() {
    print("Miau")
  }
}

class Dog : Pet {
  override func sound() {
    print("Hau")
  }
}

class Parrot : Pet {
  override func sound() {
    print("UUUUU")
  }
}

class Person {
  
  enum Relative {
    case Cousin
    case Aunt
    case Uncle
    case Nephew
    case Children
  }
  
  var firstName: String
  weak var father: Man?
  weak var mother: Woman?
  var brothers: [Person]?
  var sisters: [Person]?
  var children: [Person]?
  
  var pets: [Pet]?
  
  init(firstName: String) {
    self.firstName = firstName
  }
  
  func calculate(relative: Relative) -> Int {
    var count = 0
    switch relative {
    case .Children:
      if let countChildren = children?.count {
        count = countChildren
      }
    case .Nephew:
      if let sisterChildren = sisters {
        for sister in sisterChildren {
          count += sister.calculate(relative: .Children)
        }
      }
      if let brotherChildren = brothers {
        for brother in brotherChildren {
          count += brother.calculate(relative: .Children)
        }
      }
    case .Cousin:
      if let countNephew = mother?.calculate(relative: .Nephew) {
        count += countNephew
      }
      if let countNephew = father?.calculate(relative: .Nephew) {
        count += countNephew
      }
    case .Aunt:
      if let auntFather = father?.sisters?.count {
        count += auntFather
      }
      if let auntMother = mother?.sisters?.count {
        count += auntMother
      }
    case .Uncle:
      if let uncleFather = father?.brothers?.count {
        count += uncleFather
      }
      if let uncleMother = mother?.brothers?.count {
        count += uncleMother
      }
    }
    return count
  }
}

class Woman : Person {
  func cook() {
    print("\(firstName) cooking dinner")
  }
}

class Man : Person {
  func fix() {
    print("\(firstName) fixing")
  }
}

var execute = true
//execute = false

if execute {
  let alina = Woman(firstName: "Alina")
  let max = Man(firstName: "Max")
  let marina = Woman(firstName: "Marina")
  let alex = Man(firstName: "Alex")
  let andrey = Man(firstName: "Andrey")
  let nik = Man(firstName: "Nik")
  let sasha = Man(firstName: "Sasha")
  let anna = Woman(firstName: "Anna")
  let karolina = Woman(firstName: "Karolina")
  let nikas = Man(firstName: "Nikas")
  let lori = Woman(firstName: "Lori")
  let persi = Man(firstName: "Persi")
  let tima = Man(firstName: "Tima")
  let toma = Woman(firstName: "Toma")
  let masha = Woman(firstName: "Masha")
  let ivan = Man(firstName: "Ivan")
  let roma = Man(firstName: "Roma")
  let ruslan = Man(firstName: "Ruslan")
  let nadia = Woman(firstName: "Nadia")
  let ula = Woman(firstName: "Ula")
  //--------------------------------
  
  alina.father = max
  alina.mother = marina
  alina.sisters = [anna, karolina]
  marina.children = [alina, anna, karolina]
  max.children = [alina, anna, karolina]
  marina.brothers = [persi]
  persi.sisters = [marina]
  persi.father = tima
  tima.children = [persi]
  persi.children = [ula, ruslan]
  ula.father = persi
  ruslan.father = persi
  ula.brothers = [ruslan]
  ruslan.sisters = [ula]
  max.sisters = [toma]
  toma.brothers = [max]
  toma.children = [nadia]
  nadia.mother = toma
  nadia.father = roma
  roma.brothers = [ivan]
  ivan.brothers = [roma]
  ivan.mother = masha
  ivan.children = [lori, nikas, sasha]
  lori.father = ivan
  nikas.father = ivan
  sasha.father = ivan
  lori.brothers = [nikas, sasha]
  nikas.sisters = [lori]
  nikas.brothers = [sasha]
  sasha.sisters = [lori]
  sasha.brothers = [nikas]
  nikas.children = [nik]
  nik.father = nikas
  alina.children = [andrey, alex]
  andrey.brothers = [alex]
  alex.brothers = [andrey]
  andrey.mother = alina
  alex.mother = alina
  
  print(alina.calculate(relative: .Children))
  print(alina.calculate(relative: .Cousin))
  print(alina.calculate(relative: .Aunt))
  print(alina.calculate(relative: .Uncle))
  print(alina.calculate(relative: .Nephew))
  print(toma.calculate(relative: .Nephew))
  
  let family : [Person] = [alina, alex, andrey, anna, lori, sasha, nik, nikas, nadia, ivan, toma, tima, max, masha, marina, ula, karolina, ruslan, persi, roma]
  print(family.count)
  var countWoman = 0
  var countMan = 0
  for person in family {
    if let woman = person as? Woman {
      countWoman += 1
      woman.cook()
    } else if let man = person as? Man {
      countMan += 1
      man.fix()
    }
  }
  print("count woman - \(countWoman)")
  print("count man - \(countMan)")
  
  let cat1 = Cat()
  let cat2 = Cat()
  let cat3 = Cat()
  let dog1 = Dog()
  let dog2 = Dog()
  let dog3 = Dog()
  let dog4 = Dog()
  let parrot1 = Parrot()
  let parrot2 = Parrot()
  max.pets = [cat1, cat2]
  toma.pets = [parrot1]
  ruslan.pets = [dog1, dog2, dog3]
  persi.pets = [cat3]
  alex.pets = [dog4]
  nadia.pets = [parrot2]
  
  var allPets = [Pet]()
  
  for person in family {
    if let pets = person.pets {
      for pet in pets {
        allPets.append(pet)
      }
    }
  }
  
  var countCat = 0
  var countDog = 0
  var countParrot = 0
  for pet in allPets {
    if pet is Cat {
      countCat += 1
    } else if pet is Dog {
      countDog += 1
    } else if pet is Parrot {
      countParrot += 1
    }
    pet.sound()
  }
  print("cats - \(countCat), dogs - \(countDog), paroots - \(countParrot)")
  
}
