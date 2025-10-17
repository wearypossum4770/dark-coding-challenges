package easy

import kotlin.math.max

fun kodeeFindMaxConsecutiveOnes(nums: IntArray): Int {
    var count = 0
    var m = 0
    for (n in nums) {
        if (m < count) {
            m = count
        }
        if (n == 1) {
            count++
        } else {
            count = 0
        }
    }

    return max(m, count)
}
