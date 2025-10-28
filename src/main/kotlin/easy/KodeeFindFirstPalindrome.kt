package easy

fun kodeeFindFirstPalindrome(words: Array<String>): String {
    for (word in words) {
        if (isPalindrome(word)) return word
    }
    return ""
}
