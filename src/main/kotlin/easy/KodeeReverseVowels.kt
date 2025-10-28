package easy

fun kodeeIsVowel(c: Char): Boolean {
    when (c.lowercaseChar()) {
        'a', 'e', 'i', 'o', 'u' -> return true
        else -> return false
    }
}

fun kodeeReverseVowels(s: String): String {
    var result = CharArray(s.length) { ' ' }
    var left = 0
    var right = s.length - 1
    while (left <= right) {
        if (!kodeeIsVowel(s[left])) {
            result[left] = s[left]
            left++
        } else if (!kodeeIsVowel(s[right])) {
            result[right] = s[right]
            right--
        } else {
            result[left] = s[right]
            result[right] = s[left]
            left++
            right--
        }
    }
    return result.joinToString("")
}
