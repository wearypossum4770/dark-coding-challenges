def find_missing_and_repeated_values(
    grid: list[list[int]],
) -> list[int]:
    store = set()
    n = len(grid)
    repeated = 0
    expected = (pow(n, 2) * (pow(n, 2) + 1)) // 2
    for row in grid:
        for cell in row:
            if cell in store:
                repeated = cell
            else:
                store.add(cell)
                expected -= cell

    return [repeated, expected]
