/**
 # 题目：排序链表
 给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。
 进阶：
 你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？
 输入：head = [4,2,1,3]
 输出：[1,2,3,4]

 提示：
 链表中节点的数目在范围 [0, 5 * 104] 内
 -105 <= Node.val <= 105
 # 题解
  1 2 3 4 5 6
 */
//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        //判断给定链表是否为空
        if head == nil || head?.next == nil {
            return head
        }
        //找到当前链表的中点并断开，使用快行指针
        var fast = head?.next, slow = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        //右边的链表
        var mid = slow?.next
        //切断链表
        slow?.next = nil
        //定义左边头节点
        var left = sortList(head)
        //定义右边头节点
        var right = sortList(mid)
        var res = mergeSort(left, right)
        return res
    }
    //合并两个链表, 合并方法一：迭代方法
    //728 ms    21.9 MB
    private func mergeSort(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        var dummyNode = ListNode(0)
        var cur = dummyNode, leftTemp = left, rightTemp = right
        while leftTemp != nil && rightTemp != nil {
            if leftTemp!.val <= rightTemp!.val  {
                cur.next = leftTemp
                leftTemp = leftTemp?.next
            } else {
                cur.next = rightTemp
                rightTemp = rightTemp?.next
            }
            //将cur节点向后移动一位
            cur = cur.next!
    }
        //还会剩余一个链表有值，赋值到尾节点
        if leftTemp != nil {
            cur.next = leftTemp
        } else if rightTemp != nil {
            cur.next = rightTemp
        }
        return dummyNode.next
    }
    //合并方法二：递归
    //700 ms    29.8 MB
    private func merge(_ left: ListNode?, _ right: ListNode?)-> ListNode? {
        var left = left, right = right
        //停止条件：当有一个链表为空时，返回另一个链表
        if left == nil {
            return right
        }
        if right == nil {
            return left
        }
        if left!.val <= right!.val {
            left?.next = merge(left?.next, right)
            return left
        } else {
            right?.next = merge(left, right?.next)
            return right
        }
    }
}

