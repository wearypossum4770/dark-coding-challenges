package easy

import kotlin.math.min

fun kodeeDistributeCandies(candyType: IntArray): Int = min(candyType.toSet().size, candyType.size / 2)
