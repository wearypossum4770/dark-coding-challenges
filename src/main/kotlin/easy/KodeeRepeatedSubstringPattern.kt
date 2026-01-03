package easy

fun kodeeRepeatedSubstringPattern(s: String): Boolean {
    if (s.length < 1) return true

    return s.repeat(2).substring(1, s.length * 2 - 1).contains(s)
}
