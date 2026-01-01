import sys

sentinel = -sys.maxsize - 1


def third_max(nums: list[int]) -> int:
    unique = set(nums)
    first, second, third = sentinel, sentinel, sentinel
    for n in unique:
        if first < n:
            first, second, third = n, first, second
        elif second < n:
            second, third = n, second
        elif third < n:
            third = n
    if len(unique) < 3:
        return first
    return third
