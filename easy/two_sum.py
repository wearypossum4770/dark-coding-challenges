def two_sum(nums, target):
    """
    Source: Leet-Code
    Problem: #1
    """
    holding = {}
    for index, num in enumerate(nums):
        post_summation = target - num
        if post_summation not in holding:
            holding[num] = index
        else:
            return [holding[post_summation], index]
