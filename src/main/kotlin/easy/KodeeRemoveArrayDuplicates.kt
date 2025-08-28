package easy

fun kodeeRemoveArrayDuplicates(nums: IntArray): Int {
    var count = 0
    if (nums.size == 0) return 0
    for (num in nums) {
        if (num != nums[count]) {
            count += 1
            nums[count] = num
        }
    }
    return count + 1
}
