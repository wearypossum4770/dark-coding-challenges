def remove_element(nums: [int], subject: int) -> int:
    result = 0
    for index in range(len(nums)):
        if nums[index] == subject:
            nums[index] = None
        else:
            result += 1
    return result
