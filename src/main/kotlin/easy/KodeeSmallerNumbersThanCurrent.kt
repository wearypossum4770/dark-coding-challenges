package easy

fun kodeeSmallerNumbersThanCurrent(nums: IntArray): IntArray {
    var result = IntArray(nums.size) { 0 }
    for (i in nums.indices) {
        for (j in nums.indices) {
            if (nums[i] > nums[j]) {
                result[i]++
            }
        }
    }
    return result
}
