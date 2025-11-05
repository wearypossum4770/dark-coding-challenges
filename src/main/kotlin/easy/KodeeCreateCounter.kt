package easy

fun kodeeCaptureCounter(
    nums: IntArray,
    index: Int,
    counter: () -> Int,
) {
    nums[index] = counter()
}

fun kodeeCreateCounter(n: Int): () -> Int {
    var count = n
    return {
        val current = count
        count += 1
        current
    }
}
