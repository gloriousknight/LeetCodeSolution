import UIKit
//队列和栈
//数组实现栈
class Stack {
    var stack: [Any]
    var isEmpty: Bool {return stack.isEmpty}
    var peek: Any? {return stack.last}
    var size: Int {return stack.count }
    init() {
        stack = [Any]()
    }
    func pop() -> Any? {
        if !isEmpty {
            return stack.removeLast()
        } else {
            return nil
        }
    }
    func push(object: Any) {
        stack.append(object)
    }
}

//数组实现队列
class Queue {
    var queue: [Any]
    var isEmpty: Bool { return queue.isEmpty }
    var peek: Any? { return queue.first }
    var size: Int {return queue.count}
    init() {
        queue = [Any]()
    }
    func deQueue() -> Any? {
        if !isEmpty {
            return queue.removeFirst()
        } else {
            return nil
        }
    }
    func enQueue(object: Any) {
        return queue.append(object)
    }
    
}

//两个栈实现一个队列，讲stackA pop出的数据push到stackB中， enqueue操作就是push数据到stackA中，dequeue操作就是pop stackB的数据
class MyQueue {
    var stackA: Stack
    var stackB: Stack
    var isEmpty: Bool {return stackA.isEmpty && stackB.isEmpty}
    var size: Int {return stackA.size + stackB.size}
    var peek: Any {
        shift()
        return stackB.peek!
    }
    
    func dequeue() -> Any? {
        shift()
        return stackB.pop()
    }
    
    func enqueue(obj: Any) {
        stackA.push(object: obj)
    }
    
    func shift() {
        if stackB.isEmpty {
            while !stackA.isEmpty {
                stackB.push(object: stackA.pop()!)
            }
        }
    }
    
    init() {
        stackA = Stack()
        stackB = Stack()
    }
}
//测试用例
var myqueue = MyQueue()
myqueue.enqueue(obj: 1)
myqueue.enqueue(obj: 2)
myqueue.enqueue(obj: 3)
myqueue.peek
myqueue.dequeue()

/**
 两个队列实现栈，将queueA dequeue出的数据enqueue到queueB中，然后讲queueA和queueB互换
 */
class MyStack {
    var queueA: Queue
    var queueB: Queue
    var isEmpty: Bool {return queueA.isEmpty && queueB.isEmpty}
    var size: Int { return queueA.size }
    init() {
        queueA = Queue()
        queueB = Queue()
    }
    
    var peek: Any? {
        shift()
        let peekobj = queueA.peek
        queueB.enQueue(object: queueA.deQueue()) //把在queueA中的剩下元素添加到queueB中
        swap()
        return peekobj
    }
    
    func push(obj: Any?) {
        queueA.enQueue(object: obj)
    }
    func pop() -> Any? {
        shift()
        let popobj = queueA.deQueue()
        swap()
        return popobj
    }
    
    func shift() {
        while queueA.size != 1 {
            queueB.enQueue(object: queueA.deQueue()!)
        }
    }
    func swap() {
        (queueA, queueB) = (queueB, queueA)
    }
}
//测试用例
var mystack = MyStack()
mystack.push(obj: 1)
mystack.push(obj: 2)
mystack.push(obj: 3)
mystack.push(obj: 4)
mystack.push(obj: 5)
mystack.push(obj: 6)
mystack.peek
mystack.size
mystack.pop()

class Solution {
    /**
     两数之和，返回两个数字的下标
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let lastIndex = dic[target - num] {
                return [lastIndex, i]
            } else {
                dic[num] = i
                print(dic)
            }
        }
        fatalError("No Input")
    }
    /**
     字符串的反转，Hello My World -> World My Hello
     */
    func reverse<T>(_ chars: inout[T], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        //讲字符串的首位交换
        while start < end {
            swap(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    //定义交换的的方法
    func swap<T>(_ chars: inout[T], _ p: Int, _ q: Int) {
        let temp = chars[q]
        chars[q] = chars[p]
        chars[p] = temp
    }
    func reverseString(str: String?) -> String? {
        guard let str = str else {
            return nil
        }
        //讲字符串定义为数组操作
        var chars = Array(str), start = 0
        //讲字符串全部反转
        reverse(&chars, start, chars.count - 1)
        //字符串遍历，反转单词内部
        for i in 0 ..< chars.count {
            //如果已经到达字符串的最后一个数字，或者下一个为空格，则做单词内部的反转
            if i == chars.count - 1 || chars[i + 1] == " " {
                //单词内部反转
                reverse(&chars, start, i)
                //起始的Index加2
                start = i + 2
            }
        }
        return String(chars)
    }
    
}
let solution = Solution()
let nums = [2,7,11,15]
let target = 13
solution.twoSum(nums, target)
var str = "是大v sa asd"
var strT = Array(str)
print("共有\(strT.count)个元素")
solution.reverse(&strT, 0, str.count - 1)
//print(strT)
print(solution.reverseString(str: str))
