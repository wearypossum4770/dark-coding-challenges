def shuffle_array_to_coordinates(nums: list[int], n: int) -> list[int]:
    result = [0] * len(nums)
    for i in range(0, n):
        result[2 * i] = nums[i]
        result[2 * i + 1] = nums[i + n]
    return result
