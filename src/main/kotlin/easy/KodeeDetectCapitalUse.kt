package easy

fun kodeeDetectCapitalUse(word: String): Boolean {
    val remaining = word.substring(1)
    if ((word[0].isUpperCase() && remaining.lowercase() == remaining) || word.uppercase() == word) {
        return true
    }
    return word.lowercase() == word
}
