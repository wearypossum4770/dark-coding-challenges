package easy
import kotlin.math.abs

fun kodeeIsBoomerang(points: Array<IntArray>): Boolean {
    var dist = points.map { "${it[0]},${it[1]}" }.toSet()
    if (dist.size != 3) return false
    val (x1, y1) = points[0]
    val (x2, y2) = points[1]
    val (x3, y3) = points[2]
    return abs(x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) != 0
}
