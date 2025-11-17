package easy

fun kodeeShuffleArrayToCoordinates(
    nums: IntArray,
    n: Int,
): IntArray {
    var result = IntArray(nums.size)
    for (i in 0..<n) {
        result[i * 2] = nums[i]
        result[i * 2 + 1] = nums[i + n]
    }

    return result
}
