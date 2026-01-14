package medium

fun kodeeSortArray(nums: IntArray): IntArray {
    if (nums.isEmpty()) return nums
    var freq = mutableMapOf<Int, Int>()
    var result = IntArray(nums.size) { 0 }
    var index = 0
    var min = nums.min()
    var max = nums.max()
    for (num in nums) {
        freq[num] = (freq[num] ?: 0) + 1
        if (max < num) max = num
        if (min > num) min = num
    }
    for (i in min until max + 1) {
        var count = freq[i] ?: 0
        while (count > 0) {
            count--
            result[index++] = i
        }
    }
    return result
}
