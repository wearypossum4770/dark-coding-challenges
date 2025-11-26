def maximum_gap(nums: list[int]) -> int:
    if len(nums) < 2:
        return 0
    nums.sort()
    result = nums[1] - nums[0]
    for i in range(1, len(nums) - 1):
        result = max(result, nums[i + 1] - nums[i])
    return result
