#
# @lc app=leetcode.cn id=58 lang=python
#
# [58] 最后一个单词的长度
#
"""
题解：
倒序查询字符串，遇到不是空格时将cnt+1，第二次遇到空格时停止遍历查询
"""
# @lc code=start
class Solution(object):
    def lengthOfLastWord(self, s):
        """
        :type s: str
        :rtype: int
        """
        if len(s) == 0: return 0
        lenth = len(s) - 1
        cnt = 0
        for i in range(lenth, -1, -1):
            if s[i] != " ":
                cnt += 1
            if s[i] == " " and cnt != 0:
                break
        return cnt
# @lc code=end

