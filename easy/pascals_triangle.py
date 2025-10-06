def pascals_triangle(num_rows: int) -> list[list[int]]:
    if num_rows < 1:
        return []
    result = [[1]]
    for i in range(1, num_rows):
        row = [1]
        for j in range(1, i):
            row.append(result[i - 1][j - 1] + result[i - 1][j])
        row.append(1)
        result.append(row)

    return result
