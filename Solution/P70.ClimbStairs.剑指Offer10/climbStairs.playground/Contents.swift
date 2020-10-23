/**
 # 题目
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 注意：给定 n 是一个正整数。
 示例 1：
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 # 解法一：递归（会重复计算多次同一数值，时间复杂度O(2^n)）
 F(n) = F(n-1) + F(n - 2)

 # 解法二：记忆化递归(判断每次递归是否已经计算过值，将计算的值保存在字典中)
 #解法三：动态规划
 利用滚动数组的思路每次只计算3个数值。例如：n = 5
 循环5次;(pre = 0, next = 0, result = 1)
 pre = next, next = result, result = pre + next
 1. 第一次循环：pre: 0    next: 1     result: 1
 1. 第二次循环：pre: 1    next: 1     result: 2
 1. 第三次循环：pre: 1    next: 2     result: 3
 1. 第四次循环：pre: 2    next: 3     result: 5
 1. 第五次循环：pre: 3    next: 5     result: 8
 
 */
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        } else if n == 2{
            return 2
        } else {
            return climbStairs(n - 2) + climbStairs(n - 1)
        }
    }
}
class Solution1 {
    var dic = [Int:Int]()

    func climbStairs(_ n: Int) -> Int {
       if n <= 3 {
         return n
       }
       if dic[n] == nil {
         dic[n] = climbStairs(n-1) + climbStairs(n-2)
       }
       return dic[n]!
    }
}
class Solution2 {
    func climbStairs(_ n: Int) -> Int {
        var pre = 0
        var next = 0
        var result = 1
        for _ in 0..<n {
            pre = next
            next = result
            result = pre + next
        }
        return result
    }
}

