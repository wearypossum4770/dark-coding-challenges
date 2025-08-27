def reverse_integer(x: int) -> int:
    res = 0
    negative = 1 if x >= 0 else -1
    x = abs(x)
    while x != 0:
        res = res * 10 + x % 10
        x //= 10
    if res > 0x7FFFFFFF or res < -0x80000000:
        return 0

    return res * negative
