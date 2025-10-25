def is_boomerang(points: list[list[int]]) -> bool:
    if len(set([f"{x},{y}" for x, y in points])) != 3:
        return False
    x1, y1 = points[0]
    x2, y2 = points[1]
    x3, y3 = points[2]
    return abs(x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) != 0
