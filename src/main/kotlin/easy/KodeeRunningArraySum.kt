package easy

fun kodeeRunningArraySum(nums: IntArray): IntArray {
    var result = IntArray(nums.size)

    for (i in nums.indices) {
        if (i == 0) {
            result[i] = nums[i]
        } else {
            result[i] = nums[i] + result[i - 1]
        }
    }
    return result
}
