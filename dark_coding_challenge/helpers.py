from functools import reduce


def summation(a, b):
    print(a, b)
    return a + b


def num_array_reducer(array_like):
    return reduce(summation, array_like)
