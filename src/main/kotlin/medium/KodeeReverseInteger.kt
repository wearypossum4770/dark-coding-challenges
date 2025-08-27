package medium
import kotlin.math.abs

fun kodeeReverseInteger(x: Int): Int {
    var num: Long = 0
    var sign: Long = 1
    if (x < 0) {
        sign *= -1
    }

    var y = abs(x)
    while (y != 0) {
        num = num * 10 + (y % 10)
        y /= 10
    }
    if (num > 0x7FFFFFFF || num < -0x80000000) return 0
    return num.toInt() * sign.toInt()
}
