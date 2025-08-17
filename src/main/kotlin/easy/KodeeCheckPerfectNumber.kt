package easy
import kotlin.math.sqrt

fun kodeeCheckPerfectNumber(n: Long): Boolean = n == kodeeCalculatePerfectNumber(n)

fun kodeeCalculatePerfectNumber(n: Long): Long {
    if (n <= 0) {
        throw IllegalArgumentException("Value: $n is out of range, should be 1 or greater.")
    }
    if (n == 1L) return 1L
	
    val root = sqrt(n.toDouble()).toLong()

    var total = 1L
    for (i in 2..root) {
        if (n % i == 0L) {
            total += i
            val other = n / i
            if (other != i) {
                total += other
            }
        }
    }
	
    return total
}

fun kodeeClassifyPerfectNumber(n: Long): String {
    val num = kodeeCalculatePerfectNumber(n)
    if (n < num) return "abundant"
    if (n > num) return "deficient"
    return "perfect"
}
