package easy

fun kodeeArrayPairSum(nums: IntArray): Int {
    var total = 0
    val arr = nums.sorted().reversed()
    for (i in (arr.size - 2) downTo 0 step 2) {
        total += minOf(arr[i], arr[i + 1])
    }
    return total
}
