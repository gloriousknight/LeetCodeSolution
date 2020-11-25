 /**
  # P147.对链表进行插入排序。
  示例 1：
  输入: 4->2->1->3
  输出: 1->2->3->4
  示例 2：
  输入: -1->5->3->4->0
  输出: -1->0->3->4->5

  插入排序的动画演示如上。从第一个元素开始，该链表可以被认为已经部分排序（用黑色表示）。
  每次迭代时，从输入数据中移除一个元素（用红色表示），并原地将其插入到已排好序的链表中。
  插入排序算法：

  插入排序是迭代的，每次只移动一个元素，直到所有元素可以形成一个有序的输出列表。
  每次迭代中，插入排序只从输入数据中移除一个待排序的元素，找到它在序列中适当的位置，并将其插入。
  重复直到所有输入数据插入完为止。
  */
 
 // Definition for singly-linked list.
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }
 
class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        //判断给定链表是否为空
        guard head != nil else {
            return nil
        }
        //创建dummyHead，便于再head之前插入节点
        var dummyHead: ListNode = ListNode(-1)
        dummyHead.next = head
        //创建已排序的链表lastSorted为链表已经排序部分的最后一个节点，初始为head
        var lastSorted: ListNode? = head
        //创建当前节点，比较判断前后节点的值
        var cur : ListNode? = head?.next
        //循环比较lastSorted和cur的值。如果前值lastSorted小于后值cur，说明cur应该再lastSorted后面，将lastSorted后移一位，curr成为新的lastSorted。否则从头节点开始往后遍历链表中的节点，寻找插入cur的位置，令prev为插入cur的前一个节点。
        while cur != nil {
            if lastSorted!.val <= cur!.val {
                lastSorted = lastSorted?.next
            } else {
                var prev: ListNode = dummyHead
                //从头遍历一遍链表，找到比cur小的节点的位置prev
                while prev.next!.val < cur!.val {
                    prev = prev.next!
                }
                //先把cur的下一节点给lastSorted的下一节点，把cur提取出
                lastSorted?.next = cur?.next
                //把cur和lastSorted链接在一起。将prev的下一跳（lastSorted）赋值给cur的下一跳,
                cur?.next = prev.next
                //把prev和cur链接在一起。prev的下一跳变成cur
                prev.next = cur
            }
            //把待插入的值cur更新为lastSorted的下一跳
            cur = lastSorted?.next
        }
        return dummyHead.next
    }
}
