#
# @lc app=leetcode.cn id=35 lang=python
#
# [35] 搜索插入位置
#

# @lc code=start
"""
题解：
1. 目标值在数组中：返回target的index
2. 目标值不在数组中：
    a.比第一个数小：返回0
    b.比最后一个数大：返回列表长度
    c.找到恰好比target大数字，返回对应index
"""

class Solution(object):
    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        if target in nums:
            return nums.index(target)
        else:
            if nums[-1] < target:
                return len(nums)
            elif target < nums[0]:
                return 0
            else:
                for i in nums:
                    if i > target:
                        return nums.index(i)
            

# @lc code=end

