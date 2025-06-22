from collections import Counter


def majority_element(nums: list[int]) -> int:
    limit = len(nums) / 2
    for key, value in Counter(nums).items():
        if value >= limit:
            return key
