from functools import reduce


def simple_array_sum(sample):
    return reduce(lambda x, y: x + y, sample)
