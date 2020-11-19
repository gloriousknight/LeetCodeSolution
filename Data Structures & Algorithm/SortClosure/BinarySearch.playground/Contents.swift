import UIKit

//升序数组实现二分搜索
func binarySearch(_ nums: [Int], _ target: Int) -> Bool {
    var left = 0, mid = 0, right = nums.count - 1
    
    while left <= right {
        mid = (right - left) / 2 + left
        if nums[mid] == target {
            return true
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return false
}
//递归实现二分搜索
func binarySearchRecursion(nums: [Int], target: Int) -> Bool {
    return binarySearchRecursion(nums: nums, target: target, left: 0, right: nums.count - 1)
}

func binarySearchRecursion(nums: [Int], target: Int, left: Int, right: Int) -> Bool {
    guard left <= right else {
        return false
    }
    let mid = (right - left) / 2 + left
    if nums[mid] == target {
        return true
    } else if nums[mid] < target {
        return binarySearchRecursion(nums: nums, target: target, left: mid + 1, right: right)
    } else {
        return binarySearchRecursion(nums: nums, target: target, left: left, right: mid - 1)
    }
}
    


let nums = [1,3,5,6,11,17,21,23,35,56,123,224,2446,21122]
let target = 1
print(binarySearch(nums, target))
print(binarySearchRecursion(nums: nums, target: target))


func recursion(nums: Int) -> Int {
    if nums == 1 {
        return 1
    } else {
        return recursion(nums: nums - 1) * nums
    }
}

var nums1:Int = 4

print(recursion(nums: nums1))
