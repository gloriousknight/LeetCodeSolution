/**
 # 题目
 给定两个字符串 s 和 t，它们只包含小写字母。
 字符串 t 由字符串 s 随机重排，然后在随机位置添加一个字母。
 请找出在 t 中被添加的字母。
 示例 1：
 输入：s = "abcd", t = "abcde"
 输出："e"
 解释：'e' 是那个被添加的字母。
 示例 2：
 输入：s = "", t = "y"
 输出："y"
 示例 3：
 输入：s = "a", t = "aa"
 输出："a"
 示例 4：
 输入：s = "ae", t = "aea"
 输出："a"
 提示：0 <= s.length <= 1000
 t.length == s.length + 1
 s 和 t 只包含小写字母
 # 题解
 使用位运算的思路，将s字符串转换为ascii码并逐个异或，然后将t字符串也进行同样的操作，返回Unicode码
 */
class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var asciiValue: UInt8 = 0
        for c in s {asciiValue ^= c.asciiValue!}
        for c in t { asciiValue ^= c.asciiValue!}
        return Character(UnicodeScalar(asciiValue))
    }
}
var a = 3, b = 5
var temp = a ^ b
a = temp ^ a
b = temp ^ b
print(a)
print(b)
