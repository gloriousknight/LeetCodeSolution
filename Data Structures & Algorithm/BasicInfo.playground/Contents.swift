import UIKit

/**
 斐波那契数列，青蛙跳格子，一只青蛙一次可以跳上1级台阶，也可以跳上2级。求该青蛙跳上一个n 级的台阶总共有多少种跳法
对于第n个台阶来说，只能从n-1或者n-2的台阶跳上来，所以F(n) = F(n-1) + F(n-2)*/

func Jump(target: Int) -> Int {
    if target == 1 {
        return 1
    } else if target == 2 {
        return 2
    } else {
        return Jump(target: target - 1) + Jump(target: target - 2)
        
    }
}

///一只青蛙一次可以跳上1级台阶，也可以跳上2级……它也可以跳上n级。求该青蛙跳上一个n级的台阶总共有多少种跳法
/// - Parameter target: 目标台阶
/// - Returns: 几种跳法
func Jump2 (target: Int) -> Int {
    if target == 1 {
       return 1
    } else if target == 2 {
        return 2
    }else {
        var result = 0
        for i  in 1...target - 1 {
            result += Jump2(target: i)
        }
        return result + 1
    }
}

var target = 2

print("第一种方式有\(Jump(target: target))种跳法")
print("第二种方式有\(Jump2(target: target))种跳法")

/**
    遍历字符串j讲大小写字母互换
 */

func changeStringToUpper(string: String) -> String {
    var result = ""
    for char in string {
        if char >= "a" && char <= "z" {
            result.append(String(char.uppercased()))
        } else if char >= "A" && char <= "Z" {
            result.append(String(char.lowercased()))
        } else {
            result.append(String(char))
        }
    }
    return result
}

var helloWorld = "Hey Hello World! @"

print(changeStringToUpper(string: helloWorld))
