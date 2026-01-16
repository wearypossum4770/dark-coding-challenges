package medium

data class Rank(
    val index: Int,
    val value: String,
)

fun kodeeSmallestTrimmedNumbers(
    nums: Array<String>,
    queries: Array<IntArray>,
): IntArray {
    var result = IntArray(queries.size) { 0 }
    for (i in queries.indices) {
        val (index, digit) = queries[i]
        var trimmed =
            nums.mapIndexed { idx, str ->
                Rank(idx, str.takeLast(digit))
            }
        trimmed = trimmed.sortedWith(compareBy<Rank> { it.value }.thenBy { it.index })
        result[i] = trimmed[index - 1].index
    }
	
    return result
}
