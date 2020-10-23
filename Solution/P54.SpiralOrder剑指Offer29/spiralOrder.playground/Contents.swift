/**
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。
 示例 1：
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 示例 2：
 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
 限制：
 0 <= matrix.length <= 100
 0 <= matrix[i].length <= 100
 # 题解
 空值处理： 当 matrix 为空时，直接返回空列表 [] 即可。
 初始化： 矩阵 左、右、上、下 四个边界 l , r , t , b ，用于打印的结果列表 res 。
 循环打印： “从左向右、从上向下、从右向左、从下向上” 四个方向循环，每个方向打印中做以下三件事 ；
 根据边界打印，即将元素按顺序添加至列表 result 尾部；
 边界向内收缩 1 （代表已被打印）；
 判断是否打印完毕（边界是否相遇），若打印完毕则跳出。
 返回值： 返回 result。
 | 打印方向 | 1. 根据边界打印 | 2. 边界向内收缩 | 3. 是否打印完毕 |
 | 从左向右 |左边界l ，右边界 r| 上边界t加1 | 是否 t > b |
 |   从上向下  | 上边界 t ，下边界b |   右边界 r 减 1 |   是否 l > r  |
 |  从右向左   | 右边界 r ，左边界l   |下边界 b 减 1 |    是否 t > b
 |  从下向上  |  下边界 b ，上边界t  |  左边界 l 加 1 |    是否 l > r |
 */
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty {
            return []
        }
        var firstArr:[Int]? = matrix.first
        if firstArr == nil {
            return []
        }
        var l = 0
        var r = firstArr!.count - 1
        var t = 0
        var b = matrix.count - 1
        var result = [Int]()
        while true   {
            //1.top行从左到右
            for i in l...r {
                result.append(matrix[t][i])
            }
            //top移动到下一行 ，并对边界进行检测
            t += 1
            if t > b {
                break
            }
            //2.right从上往下遍历
            for i in t...b {
                result.append(matrix[i][r])
            }
            //right 左移一列，并对边界进行检测
            r -= 1
            if l > r {
                break
            }
            //3.bottom 从右往左遍历
            for i in (l...r).reversed() {
                result.append(matrix[b][i])
            }
            //bottom 往上移动一行
            b -= 1
            if b < t {
                break
            }
            
            //4.left 从下往上移动
            for i in (t...b).reversed() {
                result.append(matrix[i][l])
            }
            //left 右移一列
            l += 1
            if l > r {
                break
            }
        }
        return result
    }
}
