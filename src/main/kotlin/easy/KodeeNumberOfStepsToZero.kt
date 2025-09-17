package easy

fun kodeeNumberOfStepsToZero(num: Int): Int {
    var steps = 0
    var n = num
    while (n > 0) {
        if (n % 2 == 0) {
            n /= 2
        } else {
            n--
        }
        steps += 1
    }
    return steps
}
