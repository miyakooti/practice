import UIKit

// ストアドプロパティ
struct Human {

    var name = "hoge" {
        willSet {
            print("\(self.name)が\(newValue)に変更されます。")
            self.name = newValue
        }
        didSet {
            print("Human.nameに\(self.name)がセットされました。")
        }
    }

    mutating func resetName() {
        self.name = "hoge"
    }

}

var human = Human()

human.name = "kousuke"
print(human.name)

human.resetName()
print(human.name)


//　コンピューテッドプロパティ
struct Customer {

    var age: Int!

    var drink:String {
        get {
            if self.age >= 20 {
                return "お酒がおすすめです"
            } else {
                return "ソフトドリンクがおすすめです"
            }
        }
    }

    init?(age: Int) {
        guard age >= 0 && age < 120 else { return nil }
        self.age = age
    }

}

var customer = Customer(age: 20)!
print(customer.drink)

customer.age = 18
print(customer.drink)



class Animal {
    class var needOxygen: Bool {
        get {
            return true
        }
    }
    
}

var lion = Animal()

print(lion.needOxygen) // エラー
print(Animal.needOxygen) //　true
