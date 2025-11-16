package easy

fun kodeeGetArrayConcatenation(nums: IntArray): IntArray {
    var result = IntArray(nums.size * 2) { 0 }
    for ((i, n) in nums.withIndex()) {
        result[i] = n
        result[i + nums.size] = n
    }
    return result
}
