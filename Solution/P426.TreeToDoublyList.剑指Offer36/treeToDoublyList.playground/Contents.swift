/**
 输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的循环双向链表。要求不能创建任何新的节点，只能调整树中节点指针的指向。

 为了让您更好地理解问题，以下面的二叉搜索树为例：
  
         4
        /    \
       2      5
      /   \
     1     3
 我们希望将这个二叉搜索树转化为双向循环链表。链表中的每个节点都有一个前驱和后继指针。对于双向循环链表，第一个节点的前驱是最后一个节点，最后一个节点的后继是第一个节点。
 下图展示了上面的二叉搜索树转化成的链表。“head” 表示指向链表中有最小元素的节点。
 1 - 2 - 3 - 4 - 5

 特别地，我们希望可以就地完成转换操作。当转化完成以后，树中节点的左指针需要指向前驱，树中节点的右指针需要指向后继。还需要返回链表中的第一个节点的指针。

 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
}
/**
 # 题解
 算法流程：
 dfs(cur): 递归法中序遍历；

 终止条件： 当节点 cur 为空，代表越过叶节点，直接返回；
 递归左子树，即 helper(cur.left) ；
 构建链表：
 1. 当 prepre 为空时： 代表正在访问链表头节点，记为 headhead 。
 2. 当 prepre 不为空时： 修改双向节点引用，即 pre.right = curpre.right=cur ， cur.left = precur.left=pre ；
 3. 保存 curcur ： 更新 pre = curpre=cur ，即节点 curcur 是后继节点的 prepre ；
 递归右子树，即 helper(cur.left) ；

 作者：jyd
 链接：https://leetcode-cn.com/problems/er-cha-sou-suo-shu-yu-shuang-xiang-lian-biao-lcof/solution/mian-shi-ti-36-er-cha-sou-suo-shu-yu-shuang-xian-5/
 */
class Solution {
    var pre, head: TreeNode?
    func treeToDoublyList(root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        helper(cur: root)
        head?.left = pre
        pre?.right = head
        return head
    }
    func helper(cur: TreeNode?) {
        //终止条件
        if cur == nil {
            return
        }
        //递归体
        //中序遍历开始
        helper(cur: cur?.left)
        if cur != nil {
            pre?.left = cur
        } else {
            head = cur
        }
        cur?.left = pre
        pre = cur
        helper(cur: cur?.right)
    }
}

