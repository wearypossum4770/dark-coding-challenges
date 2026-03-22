package medium

fun kodeeMinSubArray(
    nums: IntArray,
    p: Int,
): Int {
    val total = (nums.sumOf { it.toLong() } % p).toInt()

    if (total == 0) return 0

    var prefixSum = 0
    var result = nums.size

    var map = mutableMapOf(0 to -1)

    for ((i, num) in nums.withIndex()) {
        prefixSum = (prefixSum + num) % p
        map[(prefixSum - total + p) % p]?.let { previous ->
            result = minOf(result, i - previous)
        }
        map[prefixSum] = i
    }
    return if (result == nums.size) -1 else result
}
