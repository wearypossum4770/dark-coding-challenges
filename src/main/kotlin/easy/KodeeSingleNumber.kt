package easy

fun kodeeSingleNumber(nums: IntArray): Int = nums.reduce { a, b -> a xor b }
