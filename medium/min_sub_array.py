def min_sub_array(nums: list[int], p: int) -> int:
    total = sum(nums) % p
    if total == 0:
        return 0

    result = len(nums)
    prefix = 0
    seen = {0: -1}

    for i, num in enumerate(nums):
        prefix = (prefix + num) % p
        lookup = (prefix - total + p) % p
        if lookup in seen:
            previous = seen[lookup]
            length = i - previous
            if 0 < length < result:
                result = length
        seen[prefix] = i

    return -1 if result == len(nums) else result
