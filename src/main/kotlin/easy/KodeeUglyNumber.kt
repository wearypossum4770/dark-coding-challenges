package easy

fun kodeeUglyNumber(n: Int): Boolean {
    var number = n
    if (n < 1) {
        return false
    }
    var primeFactors = arrayOf(2, 3, 5)
    for (factor in primeFactors) {
        while (number % factor == 0) {
            number /= factor
        }
    }
    return number == 1
}
