package easy

fun kodeeValidMountainArray(arr: IntArray): Boolean {
    val size = arr.size
    if (size < 3) return false
    var i = 0
    while (i + 1 < size && arr[i] < arr[i + 1]) {
        i++
    }
    if (i == 0 || i == size - 1) return false
    while (i + 1 < size && arr[i] > arr[i + 1]) {
        i++
    }
    return i == size - 1
}
