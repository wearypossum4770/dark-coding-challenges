package easy

fun kodeeMissingNumber(nums: IntArray): Int {
    val approximation = nums.size * (nums.size + 1) / 2
    return approximation - nums.sum()
}
