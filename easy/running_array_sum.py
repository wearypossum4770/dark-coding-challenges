def running_array_sum(nums: list[int]) -> list[int]:
    result = [None] * len(nums)
    for i in range(len(nums)):
        if i == 0:
            result[i] = nums[i]
        else:
            result[i] = result[i - 1] + nums[i]
    return result
