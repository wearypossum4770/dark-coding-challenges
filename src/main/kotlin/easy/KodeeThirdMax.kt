package easy

fun kodeeThirdMax(nums: IntArray): Int {
    val set = nums.toSet()
    if (set.size < 3) return set.maxOrNull()!!

    var first = Int.MIN_VALUE
    var second = first
    var third = first
    for (n in set) {
        when {
            n > first -> {
                third = second
                second = first
                first = n
            }

            n > second -> {
                third = second
                second = n
            }

            n > third -> {
                third = n
            }
        }
    }
    return third
}
