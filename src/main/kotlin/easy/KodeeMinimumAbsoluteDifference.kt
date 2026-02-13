package easy

fun kodeeMinimumAbsoluteDifference(arr: IntArray): List<List<Int>> {
    if (arr.size < 2) return emptyList()
    var result = mutableListOf<List<Int>>()
    arr.sort()
    var i = 0
    var m = Int.MAX_VALUE
    while (i < arr.count() - 1) {
        val lhs = arr[i]
        val rhs = arr[i + 1]
        i++
        val diff = rhs - lhs
        if (m > diff) {
            m = diff
            result.clear()
            result.add(
                listOf(
                    lhs,
                    rhs,
                ),
            )
        } else if (m == diff) {
            result.add(
                listOf(
                    lhs,
                    rhs,
                ),
            )
        }
    }

    return result
}
