def find_max_consecutive_ones(nums: list[int]) -> int:
    count, m = 0, 0
    for n in nums:
        if n == 1:
            count += 1
        else:
            m = max(m, count)
            count = 0
    return max(m, count)
