package easy

fun kodeeSortByBits(arr: IntArray): IntArray =
    arr
        .groupBy { it.countOneBits() }
        .toSortedMap()
        .flatMap { it.value.sorted() }
        .toIntArray()
