"""
[Leet Code](https://leetcode.com/problems/two-sum/)
Runtime: 0 ms Beats 100.00%
Memory: 19.04 MB Beats 16.67% after refactor 18.90 MB Beats 34.34%
"""


def two_sum(nums: [int], target: int) -> (int, int):
    mapper = {}
    for index, num in enumerate(nums):
        val = mapper.get(target - num)
        if val is not None:
            return (val, index)
        mapper[num] = index

    return None
