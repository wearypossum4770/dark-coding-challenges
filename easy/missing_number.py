from functools import reduce


def missing_number(nums: [int]) -> int:
    total = reduce(lambda x, y: x + y, nums)
    expected = len(nums) * (len(nums) + 1) // 2
    return expected - total
