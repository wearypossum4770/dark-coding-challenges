def max_sub_array(nums: list[int]):
    if len(nums) == 0:
        return 0
    result, ending = nums[0], nums[0]
    for i in range(1, len(nums)):
        ending = max(ending + nums[i], nums[i])
        result = max(result, ending)
    return result
