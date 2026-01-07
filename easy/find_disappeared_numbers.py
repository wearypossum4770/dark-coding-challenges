def find_disappeared_numbers(nums: list[int]) -> list[int]:
    if len(nums) == 0:
        return []
    for i in range(len(nums)):
        index = abs(nums[i]) - 1
        if nums[index] > 0:
            nums[index] = -nums[index]
    return [i + 1 for i, n in enumerate(nums) if n >= 0]
