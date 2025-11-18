package easy

fun kodeeFindErrorNums(nums: IntArray): IntArray {
    var result = IntArray(nums.size) { 0 }
    var target = IntArray(2) { 0 }
    for (num in nums) {
        if (result[num - 1] > 0) {
            target[0] = num
        } else {
            result[num - 1] = num
        }
    }
    for (i in nums.indices) {
        if (result[i] == 0) {
            target[1] = i + 1
            return target
        }
    }
    return target
}
