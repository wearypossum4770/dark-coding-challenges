package easy

fun kodeeFindTheDifference(
    s: String,
    t: String,
): Char = (s + t).fold(0) { acc, char -> acc xor char.code }.toChar()
