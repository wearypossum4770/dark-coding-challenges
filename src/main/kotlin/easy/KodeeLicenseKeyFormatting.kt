package easy

fun kodeeLicenseKeyFormatting(
    s: String,
    k: Int,
): String {
    var word = s.uppercase().replace("-", "")
    if (word.length < k) return word
    var result = CharArray(word.length + (word.length - 1) / k)
    var count = 0
    var left = result.size - 1
    var i = word.length - 1
    while (i >= 0) {
        if (count == k) {
            result[left--] = '-'
            count = 0
        }
        count++
        result[left--] = word[i--]
    }
    return result.joinToString("")
}
