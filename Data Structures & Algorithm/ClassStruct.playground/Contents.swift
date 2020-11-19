import UIKit

struct structCar {
    //设置价格和品牌两个属性
    var price: Int
    var brand: String
    //油量
    var petrol: Int
    //驾驶方法
    mutating func drive() {
        if petrol > 0 {
            petrol -= 1
            print("Drive 10 meters")
        }
    }
    
    //加油方法
    mutating func addPetrol() {
        petrol += 10
        print("Add 10 Petrol")
    }
}

class classCar {
    //设置价格和品牌两个属性
    var price: Int
    var brand: String
    //油量
    var petrol: Int
    //驾驶方法
    func drive() {
        if petrol > 0 {
            petrol -= 1
            print("Drive 10 meters")
        }
    }
    
    //加油方法
    func addPetrol() {
        petrol += 10
        print("Add 10 Petrol")
    }
    //构造方法
    init(price: Int, brand: String, petrol: Int) {
        self.price = price
        self.brand = brand
        self.petrol = petrol
    }
}
//struct是值类型，修改另一个不会影响原值
var carStruct = structCar(price: 1000, brand: "奔驰", petrol: 10)
var carStruct2 = carStruct
carStruct2.brand = "宝马"
carStruct2.price = 200
carStruct2.petrol = 20
print(carStruct.brand,carStruct.petrol,carStruct.price)
print(carStruct2.brand,carStruct2.petrol,carStruct2.price)
//Class是引用类型，修改另一个会直接改变之前的变量
var carClass = classCar(price: 1000, brand: "奔驰", petrol: 10)
var carClass2 = carClass
carClass2.brand = "宝马"
carClass2.price = 200
carClass2.petrol = 20
print(carClass.brand,carClass.petrol,carClass.price)
print(carClass2.brand,carClass2.petrol,carClass2.price)

