package easy

fun kodeeSortArrayByParityTwo(nums: IntArray): IntArray {
    var result = IntArray(nums.size) { 0 }
    var even = 0
    var odd = 1
    for (n in nums) {
        if (n % 2 == 0) {
            result[even] = n
            even += 2
        } else {
            result[odd] = n
            odd += 2
        }
    }
    return result
}
