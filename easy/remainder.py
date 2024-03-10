def divisible_by_five(a):
    return divides_evenly(a, 5)


def divides_evenly(numerator, denominator):
    return remainder(numerator, denominator) == 0


def remainder(numerator, denominator):
    return numerator % denominator
