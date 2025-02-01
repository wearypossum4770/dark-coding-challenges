"""
[Leet Code](https://leetcode.com/problems/two-sum/)
Runtime: 0 ms Beats 100.00%
Memory: 19.04 MB Beats 16.67% after refactor 18.90 MB Beats 34.34%
"""

def two_sum(nums: [int], target: int) -> (int, int):
    mapper = {}
    for index in range(len(nums)):
        diff = target - num
        if diff in mapper:
            return (diff, index)
        mapper[num] = index
    return None
