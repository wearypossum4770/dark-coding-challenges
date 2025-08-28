def remove_array_duplicates(nums: list[int]) -> int:
    count = 0
    if len(nums) <= 1:
        return 1
    for n in nums:
        if nums[count] != n:
            count += 1
            nums[count] = n

    return count + 1
