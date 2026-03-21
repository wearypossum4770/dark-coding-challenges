package easy

fun kodeeReverseWordPrefix(
    word: String,
    char: Char,
): String {
    for (i in word.indices) {
        if (word[i] == char) {
            var result = CharArray(word.length)
            var position = 0
            var left = i
            var right = i + 1
            while (left >= 0) {
                result[position++] = word[left--]
            }
            while (right < word.length) {
                result[position++] = word[right++]
            }
            return String(result)
        }
    }
    return word
}
