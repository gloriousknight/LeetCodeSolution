import UIKit
//二叉树相关
class TreeNode {
    var val: Int
    var LeftNode: TreeNode?
    var RightNode: TreeNode?
    init(_ val: Int, _ LeftNode: TreeNode?, _ RightNode: TreeNode?) {
        self.val = val
        self.LeftNode = LeftNode
        self.RightNode = RightNode
    }
}

//计算树的最大深度
func maxDepth(root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    return max(maxDepth(root: root.LeftNode), maxDepth(root: root.RightNode)) + 1
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        invertTree(root?.LeftNode)
        invertTree(root?.RightNode)
        let temp = root?.LeftNode
        root?.LeftNode = root?.RightNode
        root?.RightNode = temp
        return root
    }
}
//定义二叉树
var treeNode9 = TreeNode(9 ,nil, nil)
var treeNode8 = TreeNode(8 ,nil, nil)
var treeNode7 = TreeNode(7 ,nil, nil)
var treeNode6 = TreeNode(6 ,nil, nil)
var treeNode5 = TreeNode(5 ,treeNode9, nil)
var treeNode4 = TreeNode(4 ,treeNode7, treeNode8)
var treeNode3 = TreeNode(3 ,treeNode6, nil)
var treeNode2 = TreeNode(2 ,treeNode4, treeNode5)
var treeNode1 = TreeNode(1 ,treeNode2, treeNode3)
//前序遍历：先访问根节点，在访问左子节点，最后访问右子节点
//结果为1-2-4-7-8-5-9-3-6
func preorder(root: TreeNode?) {
    if root != nil {
        if let val = root?.val {
            print("\(val)\t")
            preorder(root: root?.LeftNode)
            preorder(root: root?.RightNode)
        }
    }
}
//中序遍历：先访问左子节点，在访问根节点，最后访问右子节点
//结果为7-4-8-2-9-5-6-3-1
func inorder(root: TreeNode?) {
    if root != nil {
        if let val = root?.val {

            inorder(root: root?.LeftNode)
            print("\(val)\t")
            inorder(root: root?.RightNode)
        }
    }
}
//后序遍历：先访问左子节点，在访问右子节点，最后访问根节点
//结果为7-8-4-9-5-2-6-3-1
func postorder(root: TreeNode?) {
    if root != nil {
        if let val = root?.val {

            postorder(root: root?.LeftNode)
            postorder(root: root?.RightNode)
            print("\(val)\t")
        }
    }
}


//preorder(root: treeNode1)
//inorder(root: treeNode1)
//postorder(root: treeNode1)









//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//   }
//}
//
//class Solution {
//    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
//        let result1: TreeNode? = TreeNode(preorder[0])
//        if preorder.count == 0 || inorder.count == 0 {
//            return nil
//        }
//        for (index, num) in inorder.enumerated() {
//            if num == preorder[0] {
//                result1?.left = buildTree(
//                    Array(preorder[1..<index+1]),
//                    Array(inorder[0..<index])
//                )
//                result1?.right = buildTree(Array(preorder[index+1..<preorder.endIndex]),
//                                          Array(inorder[index+1..<inorder.endIndex])
//                )
//            }
//
//        }
//        return result1
//}
//
//
//    class Solution1 {
//        func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
//            if preorder.count == 0 || inorder.count == 0 {
//                return nil
//            }
//
//            //构建二叉树根结点
//            let root: TreeNode? = TreeNode.init(preorder[0])
//
//            //对中序序列进行遍历
//            for (index, num) in inorder.enumerated() {
//                // 如果找到根节点
//                if num == preorder[0] {
//                    root?.left = buildTree(
//                                    Array(preorder[1..<index+1]),
//                                    Array(inorder[0..<index])
//                                )
//                    root?.right = buildTree(
//                                    Array(preorder[index+1..<preorder.endIndex]),
//                                    Array(inorder[index+1..<inorder.endIndex])
//                                )
//                }
//            }
//
//            return root
//
//        }
//    }
//}
