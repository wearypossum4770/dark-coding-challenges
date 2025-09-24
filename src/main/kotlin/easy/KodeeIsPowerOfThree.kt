package easy

fun kodeeIsPowerOfThree(n: Int): Boolean {
    if (n < 1) {
        return false
    }
    var num = n
    while (num % 3 == 0) {
        num /= 3
    }
    return num == 1
}
