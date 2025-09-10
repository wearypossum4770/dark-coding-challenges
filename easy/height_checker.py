def height_checker(heights: list[int]) -> int:
    count = 0
    arr = sorted(heights)
    for i in range(len(heights)):
        if heights[i] != arr[i]:
            count += 1
    return count
