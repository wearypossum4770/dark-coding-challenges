import sys

min_val = -sys.maxsize - 1


def second_largest(nums: list[int]) -> int:
    first, second = min_val, min_val
    for n in nums:
        print(first, second)
        if first < n:
            first, second = n, first
        elif second < n < first:
            second = n
    return second
