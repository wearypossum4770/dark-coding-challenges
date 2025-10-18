package easy

fun kodeeFindEvenDigitNumbers(nums: IntArray): Int = nums.filter { it -> it.toString().length % 2 == 0 }.count()
