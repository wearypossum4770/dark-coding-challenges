from math import pi


def parallelogram_area(a, b):
    return a * b


def triangle_area(base, height):
    return parallelogram_area(base, height) / 2


def ellipse_area(a, b):
    return parallelogram_area(a, b) * pi


def trapezoid_area(a, b, height):
    return 0.5 * (a + b) * height


def rectangle_area(width, height):
    return parallelogram_area(width, height)


def circle_circumference(radius):
    return pi * pow(radius, 2)


def sector_area(radius, degrees):
    return 0.5 * radius * degrees


def shape_area(a, b, shape):
    match shape:
        case "triangle":
            return triangle_area(a, b)
        case "parallelogram":
            return parallelogram_area(a, b)
        case _:
            return 0
