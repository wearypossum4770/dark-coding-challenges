def two_sum(nums: [int], target: int) -> (int, int):
    mapper = {}
    for index in range(len(nums)):
        diff = target - num
        if diff in mapper:
            return (diff, index)
        mapper[num] = index
    return None
