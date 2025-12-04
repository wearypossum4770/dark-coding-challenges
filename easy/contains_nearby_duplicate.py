def contains_nearby_duplicate(nums: list[int], k: int) -> bool:
    seen = {}
    for i, num in enumerate(nums):
        n = seen.get(num)
        if n is not None and i - n <= k:
            return True
        seen[num] = i
    return False
