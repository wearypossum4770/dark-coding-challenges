def can_make_arithmetic_progression(arr: list[int]) -> bool:
    arr.sort()
    index = 0
    distance = arr[1] - arr[0]
    while index < len(arr) - 1:
        if arr[index + 1] - arr[index] != distance:
            return False
        index += 1
    return True
