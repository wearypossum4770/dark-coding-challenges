package easy

fun processBackspaceCompare(text: String): String {
    var result = mutableListOf<Char>()
    for (c in text.iterator()) {
        if (c == '#') {
            if (!result.isEmpty()) {
                result.removeAt(result.size - 1)
            }
        } else {
            result.add(c)
        }
    }
    return result.joinToString()
}

fun kodeeBackspaceCompare(
    s: String,
    t: String,
): Boolean = processBackspaceCompare(s) == processBackspaceCompare(t)
