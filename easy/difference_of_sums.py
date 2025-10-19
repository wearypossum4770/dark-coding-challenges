def difference_of_sums(n: int, m: int) -> int:
    lhs, rhs = 0, 0
    for i in range(1, n + 1):
        if i % m == 0:
            rhs += i
        else:
            lhs += i
    return lhs - rhs
