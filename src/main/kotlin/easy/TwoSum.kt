fun twoSum(
    nums: IntArray,
    target: Int,
): IntArray {
    val seen = mutableMapOf<Int, Int>()
    for ((index, num) in nums.withIndex()) {
        val complement = seen.get(target - num)
        if (complement != null) {
            return intArrayOf(complement, index)
        }
        seen[num] = index
    }
    return intArrayOf()
}
