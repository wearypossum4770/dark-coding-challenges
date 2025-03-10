def armstrong_numbers(n: int) -> int:
    if n < 0:
        return 0
    total = 0
    num = str(n)
    for value in num:
        total += pow(int(value), len(num))

    return 1 if total == n else 0
