from functools import reduce


def reducer(growth, year):
    if year % 2 == 0:
        return growth + 1
    else:
        return growth * 2


def utopian_tree(cycles):
    """
    DOCUMENTATION
    """
    growth = 1
    for cycle in range(1, cycles + 1):
        if cycle % 2 == 0:
            growth += 1
        else:
            growth *= 2
    return growth
