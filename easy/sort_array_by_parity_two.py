def sort_array_by_parity_two(nums: list[int]) -> list[int]:
    result = [0] * len(nums)
    even, odd = 0, 1
    for num in nums:
        if num % 2 == 0:
            result[even] = num
            even += 2
        else:
            result[odd] = num
            odd += 2
    return result
