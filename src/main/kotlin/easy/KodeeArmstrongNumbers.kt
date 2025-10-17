package easy

import kotlin.math.pow

fun kodeeArmstrongNumbers(numberToCheck: Int): Int {
    if (numberToCheck < 0) return 0
    val digits = numberToCheck.toString().map { it.digitToInt() }
    val power = digits.size
    val sum = digits.sumOf { it.toDouble().pow(power).toInt() }
    if (sum == numberToCheck) return 1
    return 0
}
