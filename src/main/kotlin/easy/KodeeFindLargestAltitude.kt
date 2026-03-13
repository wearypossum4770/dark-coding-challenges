package easy

fun kodeeFindLargestAltitude(gain: IntArray): Int {
    var result = Array(gain.size + 1) { 0 }
    var altitude = 0
    for (i in gain.indices) {
        result[i] = gain[i] + altitude
        altitude += gain[i]
    }
    return result.max()
}
