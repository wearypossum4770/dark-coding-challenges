package easy

fun kodeeAddBinary(
    a: String,
    b: String,
): String {
    var res = CharArray(maxOf(a.length, b.length) + 1)
    var i = a.length - 1
    var j = b.length - 1
    var k = res.size - 1
    var carry = 0
    while (i >= 0 || j >= 0 || carry > 0) {
        var sum = carry
        if (i >= 0) sum += a[i--] - '0'
        if (j >= 0) sum += b[j--] - '0'
        res[k--] = ((sum % 2) + '0'.code).toChar()
        carry = sum / 2
    }

    return res.slice(k + 1 until res.size).joinToString("")
}
