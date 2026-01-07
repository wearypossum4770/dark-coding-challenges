package medium

fun kodeeFindDuplicateNumber(nums: IntArray): Int {
    var result = IntArray(nums.size) { 0 }
    for (num in nums) {
        if (result[num - 1] > 0) return num
        result[num - 1]++
    }

    return 0
}
