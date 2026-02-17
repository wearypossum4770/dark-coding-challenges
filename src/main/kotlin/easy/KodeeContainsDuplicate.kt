package easy

fun kodeeContainsDuplicate(nums: IntArray): Boolean {
    var unique = mutableSetOf<Int>()
    for (n in nums) {
        if (unique.contains(n)) return true
        unique.add(n)
    }
    return false
}
