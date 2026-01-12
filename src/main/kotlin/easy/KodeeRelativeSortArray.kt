package easy

fun kodeeRelativeSortArray(
    arr1: IntArray,
    arr2: IntArray,
): IntArray {
    var freq = mutableMapOf<Int, Int>()
    var result = IntArray(arr1.size)
    var index = 0
    for (num in arr1) {
        freq[num] = (freq[num] ?: 0) + 1
    }
    for (num in arr2) {
        var count = freq[num] ?: 0
        while (count > 0) {
            count--
            result[index] = num
            index++
        }
        freq.remove(num)
    }
    for (key in freq.keys.sorted()) {
        var count = freq[key] ?: 0
        while (count > 0) {
            count--
            result[index] = key
            index++
        }
    }
    return result
}
