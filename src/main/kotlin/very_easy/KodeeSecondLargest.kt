package veryeasy

fun kodeeSecondLargest(nums: IntArray): Int {
    val arr = nums.toSet()
    var first = Int.MIN_VALUE
    var second = first
    for (i in arr) {
        if (first < i) {
            second = first
            first = i
        }
        if (second < i && i < first) {
            second = i
        }
    }
    return second
}
