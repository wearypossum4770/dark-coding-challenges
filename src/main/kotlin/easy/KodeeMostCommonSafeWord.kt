package easy

data class Concordance(
    val word: String,
    var count: Int,
)

fun kodeeMostCommonSafeWord(
    paragraph: String,
    banned: Array<String>,
): String {
    var freq = mutableMapOf<String, Int>()
    val words = paragraph.lowercase().split(Regex("[!?'.,;\\s]+")).filter { it.isNotEmpty() }
    for (word in words) {
        if (!banned.contains(word)) {
            freq.put(word, (freq.getOrDefault(word, 0) + 1))
        }
    }
    return freq
        .entries
        .sortedByDescending { it.value }
        .first()
        .key
}
