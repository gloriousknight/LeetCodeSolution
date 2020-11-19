/**
 # 题目描述
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
 示例：
 二叉树：[3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]
# 题解
 BFS广度优先搜索
 思想: 按照高度顺序一层一层地访问，高层的结点会比低层的结点先被访问到。
 相当于层次遍历--利用队列的方式
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

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let tree = root else {
            return []
        }
        //创建存储队列
        var queue: [TreeNode] = [tree]
        //创建结果数组
        var res: [[Int]] = []
        //临时存储队列
        var nextLevelQueue: [TreeNode] = []
        while queue.count != 0 {
            var temp: [Int] = []
            //遍历整个队列
            for node in queue {
                //将队列中的每一个元素添加到数组中
                temp.append(node.val)
                //如果存在左右节点，则把左右节点分别添加到临时队列中
                if let left = node.left {
                    nextLevelQueue.append(left)
                }
                if let right = node.right {
                    nextLevelQueue .append(right)
                }
            }
            //结果数组中添加当前层级
            res.append(temp)
            queue.removeAll()
            queue = nextLevelQueue
            nextLevelQueue.removeAll()
        }

        return res
    }
}
