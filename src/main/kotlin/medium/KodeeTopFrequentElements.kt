package medium

fun kodeeTopFrequentElements(
    nums: IntArray,
    k: Int,
): IntArray {
    var freq = mutableMapOf<Int, Int>()
    for (n in nums) {
        freq[n] = freq.getOrDefault(n, 0) + 1
    }
    return freq.entries
        .sortedByDescending { it.value }
        .map { it.key }
        .slice(0..<k)
        .toIntArray()
}
