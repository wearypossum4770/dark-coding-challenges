def find_error_nums(nums: list[int]) -> list[int]:
    target = [0, 0]
    result = [0] * len(nums)
    for n in nums:
        if result[n - 1] > 0:
            target[0] = n
        else:
            result[n - 1] = n
    for i in range(len(result)):
        if result[i] == 0:
            target[1] = i + 1
            return target
    return target
