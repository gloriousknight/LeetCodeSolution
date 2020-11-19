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

var array: Array<Int> = [1,4,5,6,12,3,2,10]

//mySort(array: &array) { (index, nextIndex) in
//    return (array[index] as! Int) > (array[nextIndex] as! Int) }
//
//print(array)

//快速排序
func quickSort(_ array: [Int]) -> [Int] {
    var preArray: Array<Int> = array
    return quick(&preArray, left: 0, right: array.count - 1)
}
func quick(_ array: inout [Int], left: Int, right: Int) -> [Int] {
    guard !array.isEmpty else {
        return []
    }
    if left < right {
        let middle = partition(&array, left: left, right: right)
        quick(&array, left: left, right: middle - 1)
        quick(&array, left: middle + 1, right: right)
    }
    return array
}
func partition(_ array: inout [Int], left: Int, right: Int) -> Int {
    let pivot = array[left] //选择范围左边的第一个数字为基准
    var index = left + 1 //设定插入的位置
    for i in left...right {
        if array[i] < pivot {
            array.swapAt(i, index)
            index += 1
        }
    }
    let middle = index - 1
    array.swapAt(left, middle)
    return middle
}
print(quickSort(array))
