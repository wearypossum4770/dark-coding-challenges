def string_integer_is_balanced(num: str) -> bool:
    even, odd = 0, 0
    for i, val in enumerate(num):
        digit = int(val)
        if i % 2 == 0:
            even += digit
        else:
            odd += digit
    return even == odd
