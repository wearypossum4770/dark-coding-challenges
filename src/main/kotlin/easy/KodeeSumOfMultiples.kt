package easy

fun kodeeSumOfMultiples(n: Int): Int {
    var count = 0
    for (i in 1..n) {
        if (i % 3 == 0 || i % 5 == 0 || i % 7 == 0) {
            count += i
        }
    }
    return count
}
