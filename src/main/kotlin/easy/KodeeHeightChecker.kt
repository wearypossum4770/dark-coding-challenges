package easy

fun kodeeHeightChecker(heights: IntArray): Int {
    val maxHeight = 100
    val count = IntArray(maxHeight + 1)

    // Count frequencies
    for (h in heights) {
        count[h]++
    }

    var index = 0
    var mismatches = 0

    // Rebuild sorted order with counting sort
    for (h in 1..maxHeight) {
        var freq = count[h]
        while (freq > 0) {
            if (heights[index] != h) {
                mismatches++
            }
            index++
            freq--
        }
    }
    return mismatches
}
