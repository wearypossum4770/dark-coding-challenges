roman_numerals = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1_000,
}


def roman_to_int(roman: str) -> int:
    total = 0
    for index in range(len(roman) - 1):
        current, next = roman_numerals.get(roman[index], 0), roman_numerals.get(roman[index + 1], 0)
        if current < next:
            total -= current
        else:
            total += current
    return total + roman_numerals.get(roman[-1], 0)
