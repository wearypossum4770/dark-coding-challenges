package easy

fun kodeeSortArrayByParity(nums: IntArray): IntArray {
    var left = 0
    var right = nums.size - 1
    while (left < right) {
        if (nums[left] % 2 == 0) {
            left++
        } else if (nums[right] % 2 == 1) {
            right--
        } else {
            val temp = nums[left]
            nums[left] = nums[right]
            nums[right] = temp
            left++
            right--
        }
    }
    return nums
}
