package easy

fun kodeeMergeSortedArrayInPlace(
    nums1: IntArray,
    m: Int,
    nums2: IntArray,
    n: Int,
) {
    var k = m + n - 1
    var i = m - 1
    var j = n - 1
    while (i >= 0 && j >= 0) {
        if (nums1[i] >= nums2[j]) {
            nums1[k] = nums1[i]
            i--
        } else {
            nums1[k] = nums2[j]
            j--
        }
        k--
    }
    while (j >= 0) {
        nums1[k] = nums2[j]
        j--
        k--
    }
}

fun kodeeMergeSortedArray(
    nums1: IntArray,
    m: Int,
    nums2: IntArray,
    n: Int,
): IntArray {
    val result = IntArray(m + n) { 0 }
    var (i, j, k) = Triple(0, 0, 0)
    while (i < m && j < n) {
        if (nums1[i] <= nums2[j]) {
            result[k] = nums1[i]
            i++
        } else {
            result[k] = nums2[j]
            j++
        }
        k++
    }
    while (i < m) {
        result[k] = nums1[i]
        i++
        k++
    }
    while (j < n) {
        result[k] = nums2[j]
        j++
        k++
    }
    return result
}
