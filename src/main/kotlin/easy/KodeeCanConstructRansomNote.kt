package easy

fun kodeeCanConstructRansomNote(
    ransomNote: String,
    magazine: String,
): Boolean {
    val freq = IntArray(26) { 0 }

    // Count letters in magazine
    for (ch in magazine) {
        if (ch.isLetter()) {
            val idx = ch.lowercaseChar() - 'a'
            freq[idx]++
        }
    }

    // Subtract letters used by ransomNote
    for (ch in ransomNote) {
        if (ch.isLetter()) {
            val idx = ch.lowercaseChar() - 'a'
            freq[idx]--
            if (freq[idx] < 0) return false
        }
    }

    return true
}
