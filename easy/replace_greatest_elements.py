def replace_greatest_elements(arr: list[int]) -> list[int]:
    max, right = -1, len(arr) - 1
    while right >= 0:
        temp = arr[right]
        arr[right] = max
        if temp > max:
            max = temp
        right -= 1
    return arr

