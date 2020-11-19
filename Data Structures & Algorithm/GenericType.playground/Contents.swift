import UIKit
//定义泛型T交换两个变量
func exchange<T> (param1: inout T, param2: inout T) {
    let temp = param1
    param1 = param2
    param2 = temp
}
var p1 = [12,32,24]
var p2 = [22,2,2,2]
exchange(param1: &p1, param2: &p2)
print(p1,p2)

//使用泛型定义栈结构体
struct Stack<ItemType> {
    var items: [ItemType] = []
    mutating func push(param: ItemType) {
        self.items.append(param)
    }
    mutating func pop() -> ItemType {
        if items.isEmpty {
            return self.items as! ItemType
        } else {
            return self.items.removeLast()
        }
    }
}
var obj = Stack<Int>()
obj.push(param: 11)
obj.push(param: 12)
obj.push(param: 13)
print(obj.items)
let podpobj = obj.pop()
print("出栈元素",podpobj)
