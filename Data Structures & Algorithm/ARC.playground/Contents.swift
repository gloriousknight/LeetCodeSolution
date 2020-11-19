import UIKit

class People {
    let name: String
    init(name: String) {
        self.name = name
        print("People被创建")
    }
    var apartment: Apartment?              // 人住的公寓属性
deinit {
        print("People被销毁")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
        print("Apartment被创建")
    }
    var tenant: People?                   // 公寓中的人的属性
    deinit {
        print("Apartment被销毁")
    }
}

var people1: People? = People(name: "Dariel")  // 定义两个实例变量
var apartment1: Apartment? = Apartment(unit: "4A")

people1!.apartment = apartment1           // 两者相互引用
apartment1?.tenant = people1              // 而且彼此都是强引用

people1 = nil
apartment1 = nil                          // 两个引用都置为nil了,但实例并没有销毁

func testParameters(waibucanshu waican: Int, dierge ercan: Int) {
    print(waican,ercan)
}

