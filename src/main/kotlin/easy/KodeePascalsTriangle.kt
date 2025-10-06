package easy

fun kodeePascalsTriangle(numRows: Int): List<List<Int>> {
    if (numRows < 0) return emptyList()
    val result = mutableListOf<List<Int>>()
    result.add(listOf(1))
    for (i in 1 until numRows) {
        var row = MutableList(i + 1) { 1 }
        for (j in 1 until i) {
            row[j] = result[i - 1][j - 1] + result[i - 1][j]
        }
        result.add(row)
    }
    return result
}
