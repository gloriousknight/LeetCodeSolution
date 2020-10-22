/**
 # 题目描述
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 # 题解
 终止条件：当前节点为 null 时返回
 递归块：交换当前节点的左右节点，再递归的交换当前节点的左节点，递归的交换当前节点的右节点
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        //终止条件：节点是空节点时返回
        if root == nil {
            return nil
        }
        //将左右节点互换
        var temp = root?.left
        root?.left = root?.right
        root?.right = temp
        //递归交换左节点
        invertTree(root?.left)
        //递归交换右节点
        invertTree(root?.right)
        //返回根节点
        return root
    }
}
