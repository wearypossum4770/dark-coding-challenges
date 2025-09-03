package easy

fun kodeeRemoveDuplicateZeros(arr: IntArray) {
    var left = 0
    val right = arr.size - 1
    while (left <= right) {
        if (arr[left] == 0) {
            var r = right
            while (r > left) {
                arr[r] = arr[r - 1]
                r--
            }
            left++
        }
        left++
    }
}
