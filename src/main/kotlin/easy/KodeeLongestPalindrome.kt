package easy

fun kodeeLongestPalindrome(s: String): Int {
    var freq = mutableMapOf<Char, Int>()
    for (c in s) {
        freq[c] = (freq[c] ?: 0) + 1
    }
    val odds = freq.entries.filter { it.value % 2 == 1 }.size
    if (odds > 1) return s.length + 1 - odds
    return s.length
}
