package easy

fun kodeeFindWordsContaining(
    words: Array<String>,
    x: Char,
): List<Int> {
    val result = mutableListOf<Int>()
    for ((i, word) in words.withIndex()) {
        if (word.contains(x)) {
            result.add(i)
        }
    }
    return result
}
