package medium

fun kodeeTopFrequentWords(
    words: Array<String>,
    k: Int,
): List<String> {
    var freq = mutableMapOf<String, Int>()
    for (word in words) {
        freq[word] = freq.getOrDefault(word, 0) + 1
    }

    return freq.entries
        .sortedWith(compareByDescending<Map.Entry<String, Int>> { it.value }.thenBy { it.key })
        .map { it.key }
        .take(k)
}
