def num_identical_pairs(nums: list[int]) -> int:
    count, left = 0, 0
    while left < len(nums):
        right = left + 1
        while right < len(nums):
            if nums[left] == nums[right]:
                count += 1
            right += 1
        left += 1
    return count
