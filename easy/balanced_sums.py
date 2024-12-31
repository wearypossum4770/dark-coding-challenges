from functools import reduce


def balanced_sums(arr: [int]):
    if len(arr) == 1:
        return "YES"
    left, total = 0, sum(arr)
    for num in arr:
        right = total - left - num
        if left == right:
            return "YES"
        left += num
    return "NO"
