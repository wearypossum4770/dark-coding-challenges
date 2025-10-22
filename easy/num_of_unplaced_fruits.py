def num_of_unplaced_fruits(fruits: list[int], baskets: list[int]) -> int:
    count, replaced = len(fruits), [False] * len(baskets)
    for fruit in fruits:
        for right, basket in enumerate(baskets):
            if basket >= fruit and not replaced[right]:
                replaced[right] = True
                count -= 1
                break
    return count
