def palindrome_number(x: int) -> bool:
    if x < 0 or (x % 10 == 0 and x != 0):
        return False
    number = str(x)
    right = len(number) - 1
    for left in range(right):
        if number[left] != number[right - left]:
            return False
    return True
