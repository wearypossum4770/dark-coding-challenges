package easy
import kotlin.math.max

fun kodeeCommonFactors(
    a: Int,
    b: Int,
): Int {
    var m = max(a, b)
    var count = 0
    for (i in 1..m) {
        if (a % i == 0 && b % i == 0) {
            count++
        }
    }
    return count
}
