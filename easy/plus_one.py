def plus_one(digits: list[int]) -> list[int]:
    result = digits
    remainder = 1
    for i in range(len(result) - 1, -1, -1):
        if result[i] + remainder <= 9:
            result[i] = result[i] + remainder
            return result
        result[i] = 0
        remainder = 1
    if remainder > 0:
        result.insert(0, 1)
    return result
