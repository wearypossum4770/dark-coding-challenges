def common_factors(a: int, b: int) -> int:
    count = 0
    m = max(a, b) + 1
    for i in range(1, m):
        if a % i == 0 and b % i == 0:
            count += 1
    return count
