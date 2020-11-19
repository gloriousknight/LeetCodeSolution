import UIKit

var str = "Hello, playground"
func mySort(array: inout Array<Any>, sortClosure:(Int, Int) -> Bool) -> Array<Any> {
    //冒泡排序
    for indexI in array.indices {
        //最后一个元素直接返回
        if indexI == array.count - 1 {
            break
        }
        //冒泡排序
        for indexJ in 0...(array.count - 1) - indexI - 1 {
            //调用传递进来的闭包算法
            if sortClosure(indexJ, indexJ + 1) {

            } else {
                //进行元素交换
                array.swapAt(indexJ, indexJ + 1)
            }
        }
    }
    return array
}

var array: Array<Any> = [1,4,5,6,12,3,2,10]

mySort(array: &array) { (index, nextIndex) in
    return (array[index] as! Int) > (array[nextIndex] as! Int) }

print(array)
