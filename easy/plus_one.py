from array import array


def plus_one(digits):
    """
    DOCUMENTATION
    Runtime 31 ms Beats 90.55% of users with Python3
    Memory 16.72 MB Beats 46.56% of users with Python3
    """
    carry = 1
    numbers = array("l", [0] * len(digits))
    for index, digit in enumerate(reversed(digits)):
        value = digit + carry
        numbers[index] = value % 10
        carry = value // 10
    if carry:
        numbers.append(carry)
    numbers.reverse()
    return numbers.tolist()
