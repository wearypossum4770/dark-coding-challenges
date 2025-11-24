package easy

fun kodeeCanMakeArithmeticProgression(arr: IntArray): Boolean {
    arr.sort()
    val distance = arr[0] - arr[1]
    var index = 1
    while (index < arr.size - 1) {
        if (arr[index] - arr[index + 1] != distance) return false
        index++
    }
    return true
}
