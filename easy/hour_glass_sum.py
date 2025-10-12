from dark_coding_challenges import MIN_INT


def hour_glass_sum(matrix: list[list[int]]) -> int:
    if len(matrix) < 3:
        return 0
    result = MIN_INT
    for i in range(len(matrix) - 2):
        for j in range(len(matrix[i]) - 2):
            s = (
                matrix[i][j]
                + matrix[i][j + 1]
                + matrix[i][j + 2]
                + matrix[i + 1][j + 1]
                + matrix[i + 2][j]
                + matrix[i + 2][j + 1]
                + matrix[i + 2][j + 2]
            )
            result = max(result, s)
    return result
