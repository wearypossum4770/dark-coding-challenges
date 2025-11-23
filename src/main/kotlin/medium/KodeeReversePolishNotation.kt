package medium

fun doMath(
    a: Int,
    b: Int,
    operation: String,
): Int {
    when (operation) {
        "+" -> return a + b
        "-" -> return a - b
        "/" -> return a / b
        else -> return a * b
    }
}

fun kodeeReversePolishNotation(tokens: Array<String>): Int {
    var stack = mutableListOf<Int>()
    for (char in tokens) {
        when (char) {
            "+", "-", "/", "*" -> {
                if (stack.isNotEmpty()) {
                    val rhs = stack.removeLast() ?: 0
                    val lhs = stack.removeLast() ?: 0
                    stack.add(doMath(lhs, rhs, char))
                }
            }

            else -> {
                stack.add(char.toInt())
            }
        }
    }
    return stack.last()
}
