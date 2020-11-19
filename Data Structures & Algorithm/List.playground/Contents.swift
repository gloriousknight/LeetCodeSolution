import UIKit

//链表的实现
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class LinkedList {
    var head: ListNode?
    var tail: ListNode?
    //尾插法
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    //头插法
    }
    func appendToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
}

var newLinkedList = LinkedList()
newLinkedList.appendToTail(1)
newLinkedList.appendToTail(5)
newLinkedList.appendToTail(3)
newLinkedList.appendToTail(2)
newLinkedList.appendToTail(4)
newLinkedList.appendToTail(2)
//给定一个链表和一个X，要求只保留链表中的小于X的值
func getLeftList(_ head: ListNode?, _ x: Int) -> ListNode? {
    let dummy = ListNode(0)
    var pre = dummy, node = head
    while node != nil {
        if node!.val < x {
            pre.next = node
            pre = node!
        }
        node = node!.next
    }
    //防止构成环
    pre.next = nil
    return dummy.next
}

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    //引入dummy节点
    let prevDummy = ListNode(0), postDummy = ListNode(0)
    var prev = prevDummy, post = postDummy
    var node = head
    //使用尾插法处理左右两边的数据
    while node != nil {
        if node!.val < x {
            prev.next = node
            prev = node!
        } else {
            post.next = node
            post = node!
        }
        node = node!.next
    }
    //防止构成环
    post.next = nil
    //左右拼接
    prev.next = postDummy.next
    return prevDummy.next
}
var leftListNode = getLeftList(newLinkedList.head, 3)
//var resultLinkedList = partition(newLinkedList.head, 3)
print(type(of: ListNode(0)))
//print(resultLinkedList?.next?.next?.next)
print(leftListNode?.next?.next?.next)
var arr = [1,2,3,4,5,6]
print(Array(arr[1..<3]))
