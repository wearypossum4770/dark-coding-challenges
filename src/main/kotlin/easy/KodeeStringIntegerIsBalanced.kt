package easy

fun kodeeStringIntegerIsBalanced(num: String): Boolean {
    var even = 0
    var odd = 0
    for ((i, n) in num.withIndex()) {
        if (i % 2 == 0) {
            even += n.digitToInt()
        } else {
            odd += n.digitToInt()
        }
    }
    return even == odd
}
