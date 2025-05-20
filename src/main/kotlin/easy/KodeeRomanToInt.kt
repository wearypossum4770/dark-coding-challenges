package easy

fun kodeeRomanToInt(roman: String): Int {
    var result = 0
    var previous = 0
    val romanNumerals = mapOf('I' to 1, 'V' to 5, 'X' to 10, 'L' to 50, 'C' to 100, 'D' to 500, 'M' to 1_000)
    for (char in roman) {
        val current = romanNumerals.getOrDefault(char, 0)
        if (current > previous) {
            result += current - 2 * previous
        } else {
            result += current
        }
        previous = current
    }
    return result
}
