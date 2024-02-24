import math


def distance(x, y, a, b):
    squared_x = pow(a - x, 2)
    squared_y = pow(b - y, 2)
    return math.sqrt(squared_x + squared_y)


def distance_from_origin(x, y):
    return distance(x, y, 0, 0)


def dart_score(x, y):
    """
    DOCUMENTATION
    """
    point = distance_from_origin(x, y)
    if point <= 10 and point > 5:
        return 1
    if point <= 5 and point > 1:
        return 5
    if point <= 1:
        return 10
    return 0
