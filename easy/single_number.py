from functools import reduce


def single_number(nums: list[int]) -> int:
    return reduce(lambda x, y: x ^ y, nums)
