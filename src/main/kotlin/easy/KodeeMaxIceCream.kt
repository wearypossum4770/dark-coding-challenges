package easy

fun kodeeMaxIceCream(
    costs: IntArray,
    coins: Int,
): Int {
    var cones = 0
    var remaining = coins
    costs.sort()
    for (n in costs) {
        if (n <= remaining) {
            remaining -= n
            cones++
        }
    }

    return cones
}
