def smaller_numbers_than_current(nums: list[int]) -> list[int]:
    result = [0] * len(nums)
    for i in range(len(nums)):
        for j in range(len(nums)):
            if nums[i] > nums[j]:
                result[i] += 1
    return result
