def sum_of_multiples(num: int) -> int:
    total = 0
    for n in range(1, num + 1):
        if n % 3 == 0 or n % 5 == 0 or n % 7 == 0:
            total += n
    return total


def array_of_multiples(n: int, size: int) -> list[int]:
    return [(i + 1) * n for i in range(0, size)]
