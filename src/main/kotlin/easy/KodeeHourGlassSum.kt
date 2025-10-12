package easy
import kotlin.math.max

fun kodeeHourGlassSum(matrix: Array<IntArray>): Int {
    if (matrix.size < 3 || matrix.any { it.size < 3 }) {
        return 0
    }
    var result = Int.MIN_VALUE
    for (i in 0 until matrix.size - 2) {
        for (j in 0 until matrix[i].size - 2) {
            val sum = (
                matrix[i][j] +
                    matrix[i][j + 1] +
                    matrix[i][j + 2] +
                    matrix[i + 1][j + 1] +
                    matrix[i + 2][j] +
                    matrix[i + 2][j + 1] +
                    matrix[i + 2][j + 2]
            )
            result = max(result, sum)
        }
    }

    return result
}
