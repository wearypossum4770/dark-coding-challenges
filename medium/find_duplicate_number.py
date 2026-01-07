def find_duplicate_number(nums: list[int]) -> int:
    result = [0] * len(nums)
    for i in nums:
        index = i - 1
        if result[index] > 0:
            return i
        result[index] += 1
    return 0
