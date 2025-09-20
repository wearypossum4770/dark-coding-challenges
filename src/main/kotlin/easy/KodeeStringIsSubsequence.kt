package easy

fun kodeeStringIsSubsequence(
    s: String,
    t: String,
): Boolean {
    var left = 0
    var right = 0
    while (left < s.length && right < t.length) {
        if (s[left] == t[right]) {
            left++
        }
        right++
    }

    return left == s.length
}
