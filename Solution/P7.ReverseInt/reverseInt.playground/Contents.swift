/**
 # 题目描述
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 示例 1:
 输入: 123
 输出: 321
  示例 2:
 输入: -123
 输出: -321
 示例 3:
 输入: 120
 输出: 21
 注意:
 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 
 # 题解
 直接遍历整数，分别取余后添加到结果res中
 */
class Solution {
    func reverse(_ x: Int) -> Int {
        var num = x
        var res = 0
        while num != 0 {
            let temp = num % 10
            num = num / 10
            res = res * 10 + temp
        }
        if res > Int32.max || res < Int32.min {
            return 0
        }
        return res
    }
}
