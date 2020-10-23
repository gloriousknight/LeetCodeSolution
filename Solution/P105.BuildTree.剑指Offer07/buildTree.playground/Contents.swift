/**
 # 题目描述
 根据一棵树的前序遍历与中序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7
 */


// Definition for a binary tree node.
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
     方法一：直接利用数组递归
 */
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        
        //构建二叉树根结点
        let result1: TreeNode? = TreeNode.init(preorder[0])
        
        //对中序序列进行遍历
        for (index, num) in inorder.enumerated() {
            // 如果找到根节点
            if num == preorder[0] {
                //左子树递归建立
                result1?.left = buildTree(
                                Array(preorder[1..<index+1]),
                                Array(inorder[0..<index])
                            )
                //右子树递归建立
                result1?.right = buildTree(
                                Array(preorder[index+1..<preorder.endIndex]),
                                Array(inorder[index+1..<inorder.endIndex])
                            )
            }
        }
        
        return result1
        
    }
}
/**
 # 题解：
    方法二：
 前序遍历特点： 节点按照 [ 根节点 | 左子树 | 右子树 ] 排序，以题目示例为例：[ 3 | 9 | 20 15 7 ]
 中序遍历特点： 节点按照 [ 左子树 | 根节点 | 右子树 ] 排序，以题目示例为例：[ 9 | 3 | 15 20 7 ]
 ## 递推参数：
 前序遍历中根节点的索引pre_root、中序遍历左边界in_left、中序遍历右边界in_right。
 ## 终止条件：
 当 in_left > in_right ，子树中序遍历为空，说明已经越过叶子节点，此时返回 nullnull 。
 ## 递推工作：
 1. 建立根节点root： 值为前序遍历中索引为pre_root的节点值。
 2. 搜索根节点root在中序遍历的索引i： 利用循环寻找相等的值，每次搜索的时间复杂度为 O(1)O(1)。
 构建根节点root的左子树和右子树： 通过调用 recur() 方法开启下一层递归。
 左子树： 根节点索引为 pre_root + 1 ，中序遍历的左右边界分别为 in_left 和 i - 1。
 右子树： 根节点索引为 i - in_left + pre_root + 1（即：根节点索引 + 左子树长度 + 1），中序遍历的左右边界分别为 i + 1 和 in_right。
 ##返回值：
 返回 root，含义是当前递归层级建立的根节点 root 为上一递归层级的根节点的左或右子节点。
 作者：jyd
 链接：https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/solution/mian-shi-ti-07-zhong-jian-er-cha-shu-di-gui-fa-qin/
 */
class Solution1 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var dic:[Int: Int] = [:]
        for (index, num) in inorder.enumerated() {
            dic[index] = num
        }
        print(dic)
        return recusion(0, 0, inorder.count - 1, preorder, inorder,dic: dic)
    }
    func recusion(_ preRoot: Int, _ inLeft: Int, _ inRight: Int, _ preorder: [Int], _ inorder: [Int], dic : [Int: Int]) -> TreeNode? {
        //结束条件
        if inLeft > inRight {
            return nil
        }
        //递归体
        //初始化root树
        let root: TreeNode? = TreeNode(preorder[preRoot])
        //找到跟节点在中序遍历中的索引index
        var index: Int = 0
//        for (i, num) in inorder.enumerated() {
//            if num == preorder[preRoot] {
//                index = i
//            }
//        }
        index = Int(dic[preorder[preRoot]]!)
        //构建左子树
        root?.left = recusion(preRoot+1, inLeft, index - 1, preorder, inorder,dic: dic)
        //构建右子树
        root?.right = recusion(index - inLeft + preRoot + 1, index + 1, inRight, preorder, inorder,dic: dic)
        //返回值
        return root
    }
}

