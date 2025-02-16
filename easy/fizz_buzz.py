def fizz_buzz(n: int) -> [str]:
    return [fizzy(i) for i in range(1, n + 1)]


def fizzy(n: int) -> str:
    if n % 15 == 0:
        return "fizzbuzz"
    if n % 5 == 0:
        return "buzz"
    if n % 3 == 0:
        return "fizz"
    return str(n)
