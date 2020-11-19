import UIKit

//快速排序
func quickSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let pivot = array[array.count / 2]
    let left = array.filter { $0 < pivot }
    let middle = array.filter { $0 == pivot }
    let right = array.filter { $0 > pivot }
    return quickSort(left) + middle + quickSort(right)
}

//归并排序
func mergeSort(_ array: [Int]) -> [Int] {
    var helper = Array(repeating: 0, count: array.count), array = array
    mergeSort(&array, &helper, 0, array.count - 1)
    return array
}
func mergeSort(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
    guard low < high else {
        return
    }
    let middle = (high - low) / 2 + low
    mergeSort(&array, &helper, low, middle)
    mergeSort(&array, &helper, middle + 1, high)
    merge(&array, &helper, low, middle, high)
}
func merge(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
    //cp both values into a helper array
    for i in low ... high {
        helper[i] = array[i]
    }
    var helperLeft = low, helperRight = middle + 1
    var current = low
    
    //iterate through helper array and copy the right one to original array
    while helperLeft <= middle && helperRight <= high {
        if helper[helperLeft] <= helper[helperRight] {
            array[current] = helper[helperLeft]
            helperLeft += 1
        } else {
            array[current] = helper[helperRight]
            helperRight += 1
        }
        current += 1
    }
    
    //handle the rest
    guard middle - helperLeft >= 0 else {
        return
    }
    for i in 0 ... middle - helperLeft {
        array[current + i] = helper[helperLeft + i]
    }
    
}
func partition(_ arr: inout [Int], left: Int, right: Int) -> Int {
//    let middle = (right - left) / 2 + left
    let pivot = arr[right]
    var pivotIndex = left
    for i in left...right - 1 {
        if arr[i] < pivot {
            arr.swapAt(pivotIndex, i)
            pivotIndex += 1
        }
    }
    arr[right] = arr[pivotIndex]
    arr[pivotIndex] = pivot
    return pivotIndex
}
func quickSortManualPr(_ arr: inout [Int], _ left: Int, _ right: Int) -> [Int] {
    guard !arr.isEmpty else {
        return []
    }
    if left < right {
        let pivotIndex = partition(&arr, left: left, right: right)
        quickSortManualPr(&arr, left, pivotIndex - 1)
        quickSortManualPr(&arr, pivotIndex + 1, right)
    }
    return arr
}
func quickSortManual(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else {
        return arr
    }
    var array = arr
    quickSortManualPr(&array, 0, array.count - 1)
    return array
}

var array = [1,23,42,12,422,55,35,21,56,2,12,235,21512,3125,214,512,21,23,5,3,23,24,51,2,5,1,6,3,5,34,2,53,6234,23,46,12,87,3412,4]
print(quickSort(array))
print(mergeSort(array))
print(quickSortManual(array))

var arr: Array<Int> = []
print(quickSortManual(arr))
