from collections import Counter


def sort_colors(nums: list[int]) -> None:
    """
    Do not return anything, modify nums in-place instead.
    """
    freq = Counter(nums)
    index = 0
    for i in range(3):
        count = freq.get(i, 0)
        while count > 0:
            nums[index] = i
            index += 1
            count -= 1
