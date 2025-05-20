
package easy

fun isNumberPalindrome(input: Int): Boolean {
    if (input < 0 || (input % 10 == 0 && input != 0)) return false
    val number = "$input"
    var right = number.length - 1
    for (left in number.indices) {
        if (number[left] != number[right]) {
            return false
        }
        right -= 1
    }
    return true
}
