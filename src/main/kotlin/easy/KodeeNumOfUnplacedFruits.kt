package easy

fun kodeeNumOfUnplacedFruits(
    fruits: IntArray,
    baskets: IntArray,
): Int {
    if (fruits.isEmpty()) return 0
    if (baskets.isEmpty()) return fruits.size
    var count = fruits.size
    var replaced = BooleanArray(baskets.size)
    for (fruit in fruits) {
        for ((right, basket) in baskets.withIndex()) {
            if (basket >= fruit && !replaced[right]) {
                replaced[right] = true
                count--
                break
            }
        }
    }
    return count
}
