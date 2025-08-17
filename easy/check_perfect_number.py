def is_perfect_number(n: int) -> bool:
    if n <= 1:
        return False
    return n == calculate_perfect_number(n)


def classify_perfect_number(n: int) -> str:
    num = calculate_perfect_number(n)
    if n <= 1:
        return "deficient"
    if n < num:
            return "abundant"
    if n > num:
            return "deficient"
    return "perfect"


def calculate_perfect_number(n: int) -> int:
    if n <= 1:
        return 0
    total = 1
    root = int( n**0.5) + 1
    for i in range(2, root):
        if n % i == 0:
            total += i
            factor = n // i
            if factor != i:
                total += factor
    return total
