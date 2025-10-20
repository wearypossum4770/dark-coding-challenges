def find_lucky(arr: list[int]) -> int:
    nums = [0] * (max(arr) + 1)
    i = len(nums) - 1
    for n in arr:
        nums[n] += 1
    while i > 0:
        if nums[i] == i:
            return i
        i -= 1
    return -1
