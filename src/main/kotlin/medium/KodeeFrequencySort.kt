package medium

fun kodeeFrequencySort(s: String): String {
    var freq = mutableMapOf<Char, Int>()
    for (ch in s) freq[ch] = (freq[ch] ?: 0) + 1
    return freq
        .toList()
        .sortedByDescending { it.second }
        .joinToString("") { (ch, count) -> ch.toString().repeat(count) }
}
