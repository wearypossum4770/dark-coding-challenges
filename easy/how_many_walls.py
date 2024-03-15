def how_many_walls(walls, width, height):
    total = width * height
    (painted := total <= walls)
    return int(walls / total) if painted else 0
