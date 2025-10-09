def distribute_candies(candy_type: list[int]) -> int:
    return min(len(candy_type) // 2, len(set(candy_type)))
