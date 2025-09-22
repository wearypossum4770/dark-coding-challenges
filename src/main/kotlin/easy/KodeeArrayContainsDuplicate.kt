package easy

fun kodeeArrayContainsDuplicate(nums: IntArray): Boolean {
    var seen = mutableSetOf<Int>()
    for (i in nums) {
        if (seen.contains(i)) return true
        seen.add(i)
    }
    return false
}
