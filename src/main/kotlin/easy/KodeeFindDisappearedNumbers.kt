package easy

fun kodeeFindDisappearedNumbers(nums: IntArray): IntArray {
    var result = IntArray(nums.size) { 0 }
    for (num in nums) {
        result[num - 1] = num
    }
    return result
        .flatMapIndexed { index, value -> if (value == 0) listOf(index + 1) else emptyList() }
        .toIntArray()
}
