package easy

fun kodeeMajorityElement(nums: IntArray): Int {
    val half = nums.size / 2
    val freq = mutableMapOf<Int, Int>()
    for (ch in nums) {
        freq[ch] = (freq[ch] ?: 0) + 1
    }
    for ((k, v) in freq) {
        if (v > half) {
            return k
        }
    }
    return 0
}
