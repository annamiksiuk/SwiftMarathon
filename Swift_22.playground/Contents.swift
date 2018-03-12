/*
 есть семья - папа, мама и дети.
 Папа глава семьи, у него есть Мама, Мама контролирует детей, т.е. иерархия: Папа - Мама - Дети, Дети на одном уровне.
 Дети могут вызывать друг друга и они могут искать пути, как общаться с другими Детьми, например говорить "дай игрушку", спрашивать Маму: "Мама, дай конфетку", общаться с Папой: "Папа, купи игрушку".
 Вся эта иерархия лежит в объекте класса Семья, у которого есть методы, например распечатать всю Семью, т.е. метод вернёт массив всех членов Семьи.
 У Папы есть 3 кложера (closures) - 1. когда он обращается к Семье - распечатать всю Семью, 2. распечатать Маму, 3. распечатать всех Детей.
 Создать всю иерархию со связями. При выходе из зоны видимости все объекты должны быть уничтожены.
*/

class Human {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Child: Human {
  weak var child: Child?
  weak var mother: Mother!
  weak var father: Father!
  
  init(name: String, father: Father, mother : Mother) {
    self.mother = mother
    self.father = father
    super.init(name: name)
  }
  
  deinit {
    print("Child \(name) deinit")
  }
  
  func giveToy() {
    if let anotherChild = child {
      [print("Child \(anotherChild.name) give toy")]
    }
  }
  
  func giveCandy() {
    print("Mother \(mother.name) give candy")
  }
  
  func buyToy() {
    print("Father \(father.name) buy toy")
  }
  
}

class Mother: Human {
  var children = [Child]()
  
  func add(child: Child) {
    children.append(child)
  }
  
  deinit {
    print("Mother \(name) deinit")
  }
  
  func printChildren() {
    var description = "Children: "
    for child in children {
      description += child.name + " "
    }
    print(description)
  }
  
}

class Father: Human {
  weak var mother: Mother!
  
  init(name: String, mother: Mother) {
    self.mother = mother
    super.init(name: name)
  }
  
  deinit {
    print("Father \(name) deinit")
  }
  
  lazy var printFamily: () -> () = {
  }
  
  lazy var printMother: () -> () = {
    [unowned self] in
    print("mother of family: \(self.mother.name)")
  }
  
  lazy var printChildren: () -> () = {
    [unowned self] in
    self.mother.printChildren()
  }
}

class Family {
  weak var father : Father!
  weak var mother : Mother!
  var children = [Child]()
  
  init(father : Father, mother : Mother, children : [Child]) {
    self.father = father
    self.mother = mother
    self.children = children
  }
  
  deinit {
    print("Family deinit")
  }
  
  func description() {
    var array: [Human] = [father, mother]
    for child in children {
      array.append(child)
    }
    var description = "Family: \t"
    for human in array {
      description += human.name + "\t"
    }
    print(description)
  }
}

var execute = true
//execute = false

if execute {
  
  let mother = Mother(name: "Irina")
  let father = Father(name: "Max", mother: mother)
  
  let child1 = Child(name: "Nikita", father: father, mother: mother)
  let child2 = Child(name: "Larisa", father: father, mother: mother)
  child1.child = child2
  child1.giveToy()
  child1.buyToy()
  child1.giveCandy()
  
  mother.add(child: child1)
  mother.add(child: child2)
  
  let family = Family(father: father, mother: mother, children: mother.children)
  
  father.printFamily = {
    [unowned family] in
    family.description()
  }
  
  father.printMother()
  father.printChildren()
  
}

print("Exit")
