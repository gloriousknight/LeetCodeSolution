import UIKit
/**
 已知有很多会议，如果这些会议的时间有重叠，就将他们合并
 如果一个会议时间是3-6点，另一个会议时间是4-7点，那么将两个会议时间合并为3-7点
*/
public class MeetingTime {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func sortInPlace(meetingTimes: inout [MeetingTime]) -> [MeetingTime] {
    meetingTimes.sort() {
        if $0.start != $1.start {
            return $0.start < $1.start
        } else {
            return $0.end < $1.end
        }
    }
    return meetingTimes
}

func merge(_ meetingTimes: inout [MeetingTime]) -> [MeetingTime] {
    //处理特殊情况
    guard meetingTimes.count > 1 else {
        return meetingTimes
    }
    
    //排序
    sortInPlace(meetingTimes: &meetingTimes)
    
    var res: [MeetingTime] = [MeetingTime]()
    res.append(meetingTimes[0])
    //遍历排序后的原数组，并与结果数组归并
    for i in 1..<meetingTimes.count {
        let last = res[res.count - 1]
        let current = meetingTimes[i]
        if current.start > last.end {
            res.append(current)
        } else {
            last.end = max(last.end, current.end)
        }
    }
    return res
}

let meetingTimes1 = MeetingTime(1, 3)
let meetingTimes2 = MeetingTime(2, 6)
let meetingTimes3 = MeetingTime(5, 8)
let meetingTimes4 = MeetingTime(4, 9)
let meetingTimes5 = MeetingTime(2, 10)

var meetingTimeArray = [meetingTimes2,meetingTimes1,meetingTimes3,meetingTimes4,meetingTimes5]

sortInPlace(meetingTimes: &meetingTimeArray)
merge(&meetingTimeArray)
/**
 冒泡排序
 */
//func bubbleSort(_ arr: inout Array<Any>) -> Array<Any> {
//    for i in 0..<arr.count {
//        for j in 0..<arr.count - i - 1 {
//            if (arr[j] < arr[j+1]) {
//                (arr[j],arr[j+1]) = (arr[j+1], arr[j])
//            }
//        }
//    }
//    return arr
//}

var arr = [1,2,3,4,5,6,7,8,9,10]

func bubbleSort(_ arr: inout Array<Int>) -> Array<Int> {
    for i in 0..<arr.count {
        for j in 0..<arr.count - i - 1 {
            if arr[j] < arr[j+1] {
                (arr[j],arr[j+1]) = (arr[j+1], arr[j])
            }
        }
    }
    return arr
}
print(bubbleSort(&arr))
//func swap(paramA: Any, paramB: Any) {
//    var temp = paramA
//    paramA = paramB
//    paramB = temp
//}
