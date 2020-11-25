
/**
 # P21.合并两个有序列表
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 示例：
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/**
 方法一：递归
 时间复杂度：O(n + m)O(n+m)，其中 nn 和 mm 分别为两个链表的长度。因为每次调用递归都会去掉 l1 或者 l2 的头节点（直到至少有一个链表为空），函数 mergeTwoList 至多只会递归调用每个节点一次。因此，时间复杂度取决于合并后的链表长度，即 O(n+m)O(n+m)。

 空间复杂度：O(n + m)O(n+m)，其中 nn 和 mm 分别为两个链表的长度。递归调用 mergeTwoLists 函数时需要消耗栈空间，栈空间的大小取决于递归调用的深度。结束递归调用时 mergeTwoLists 函数最多调用 n+mn+m 次，因此空间复杂度为 O(n+m)O(n+m)。
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2
        //停止条件：当l1或l2为空
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        //递归内容：比较两个链表头部的值，如果l1小，则l1的next链接排序好的链表头
        if l1!.val < l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
        //返回值为排序好的链表头
    }
}
/**
 方法二：迭代
 
 */
class Solution2 {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2
        //定义一个dummyNode
        var dummyNode = ListNode(0)
        //定义一个当前节点用于创建新的一个链表
        var cur = dummyNode
//        对l1和l2进行遍历比较，
        while l1 != nil && l2 != nil {
            //如果l1小于l2的值，将l1接到cur节点之后，否则将l2接到cur之后。并将l1，和l2向后移动一位
            if l1!.val <= l2!.val {
                cur.next = l1
                l1 = l1?.next
            } else {
                cur.next = l2
                l2 = l2?.next
            }
            //将cur向后移动一位
            cur = cur.next!
        }
        //最后还会剩余一个链表为非空，需要把最后一个元素接到当前链表的后面
        if l1 != nil {
            cur.next = l1
        } else if l2 != nil {
            cur.next = l2
        }
        return dummyNode.next
    }
}
