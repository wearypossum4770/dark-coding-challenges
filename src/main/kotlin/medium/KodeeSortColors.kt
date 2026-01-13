package medium

fun kodeeSortColors(nums: IntArray) {
    var freq = mutableMapOf<Int, Int>()
    for (num in nums) {
        freq[num] = (freq[num] ?: 0) + 1
    }
    var index = 0
    for (i in 0 until 3) {
        var count = freq[i] ?: 0
        while (count-- > 0) {
            nums[index++] = i
        }
    }
}
