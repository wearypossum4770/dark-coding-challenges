package easy

fun kodeeReplaceGreatestElements(arr: IntArray): IntArray {
    var right = arr.size - 1
    var max = -1
    while (right >= 0) {
        val temp = arr[right]
        arr[right] = max
        if (temp > max) {
            max = temp
        }
        right -= 1
    }
    return arr
}
