package easy
import kotlin.math.abs

fun kodeeContainsNearbyDuplicate(
    nums: IntArray,
    k: Int,
): Boolean {
    var seen = mutableMapOf<Int, Int>()
    for ((i, n) in nums.withIndex()) {
        val num = seen[n]
        if (num != null && abs(i - num) <= k) return true
        seen[n] = i
    }
    return false
}
