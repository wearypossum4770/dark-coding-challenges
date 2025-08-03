package easy

fun kodeeIsAnagram(
    s: String,
    t: String,
): Boolean {
    if (s.length != t.length) return false
    val charDict = mutableMapOf<Char, Int>()
    for (c in s) {
        charDict[c] = charDict.getOrDefault(c, 0) + 1
    }
    for (c in t) {
        if (!charDict.containsKey(c)) return false
        charDict[c] = charDict.getOrDefault(c, 0) - 1
    }
    return charDict.values.all { it == 0 }
}
