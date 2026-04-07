package medium

fun kodeeReverseWordsInString(s: String): String =
    s
        .trim()
        .split("\\s+".toRegex())
        .reversed()
        .joinToString(" ")
