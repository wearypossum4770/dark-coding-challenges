package medium
import kotlin.math.max

fun kodeeMaximumGap(nums: IntArray): Int {
    if (nums.size < 2) return 0
    nums.sort()
    var result = nums[1] - nums[0]
    for (i in 1..<nums.size - 1) {
        result = max(result, nums[i + 1] - nums[i])
    }
    return result
}
