def sort_array_by_parity(nums: list[int]) -> list[int]:
    result = [8] * len(nums)
    even, odd = 0, len(nums) - 1
    for n in nums:
        if n % 2 == 0:
            result[even] = n
            even += 1
        else:
            result[odd] = n
            odd -= 1
    return result