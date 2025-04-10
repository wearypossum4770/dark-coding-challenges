package easy

fun kodeeRemoveOptionalElement(
    nums: Array<Int?>,
    subject: Int,
): Int {
    var result = 0
    var index = 0
    for (num in nums) {
        if (num == subject) {
            nums[index] = null
        } else {
            result++
        }
        index++
    }
    return result
}

fun kodeeRemoveElement(
    nums: Array<Int>,
    subject: Int,
): Int {
    var result = 0
    for (index in nums) {
        if(index != subject) {
            nums[result] = index
            result += 1
        }
    }
    return result
}