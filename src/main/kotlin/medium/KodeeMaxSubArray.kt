package medium
import kotlin.math.max

fun kodeeMaxSubArray(nums: IntArray): Int {
    if (nums.isEmpty()) return 0
    var result = nums[0]
    var ending = nums[0]
    for (i in 1..nums.size - 1) {
        ending = max(ending + nums[i], nums[i])
        result = max(result, ending)
    }
    return result
}
