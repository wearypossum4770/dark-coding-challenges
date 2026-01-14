from collections import Counter


def sort_array(nums: list[int]) -> list[int]:
    if len(nums) == 0:
        return []
    freq = Counter(nums)
    result = [0] * len(nums)
    mini, maxi, index = min(nums), max(nums), 0
    i = mini
    while i <= maxi:
        count = freq.get(i) or 0
        while count > 0:
            count -= 1
            result[index] = i
            index += 1
        i += 1
    return result
