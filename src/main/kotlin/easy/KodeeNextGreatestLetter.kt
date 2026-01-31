package easy

fun kodeeNextGreatestLetter(
    letters: CharArray,
    target: Char,
): Char {
    for (i in 0..<letters.size) {
        if (target < letters[i]) return letters[i]
    }
    return letters[0]
}
