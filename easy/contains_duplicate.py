def contains_duplicate(nums: list[int]) -> bool:
    unique = set()
    for n in nums:
        if n in unique:
            return True
        unique.add(n)
    return False
