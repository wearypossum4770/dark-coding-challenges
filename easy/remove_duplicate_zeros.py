def remove_duplicate_zeros(arr: list[int]):
    if len(arr) < 1:
        pass
    left, right = 0, len(arr) - 1
    while left <= right:
        r = right
        if arr[left] == 0:
            while r > left:
                arr[r] = arr[r - 1]
                r -= 1
            left += 1
        left += 1
