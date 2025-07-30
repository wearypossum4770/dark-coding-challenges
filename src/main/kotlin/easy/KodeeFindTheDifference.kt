package easy

fun kodeeFindTheDifference(
    s: String,
    t: String,
): Char {
    
return (s + t).fold(0) { acc, char -> acc xor char.code}.toChar()
}
