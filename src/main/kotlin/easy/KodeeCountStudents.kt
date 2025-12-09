package easy

fun kodeeCountStudents(
    students: IntArray,
    sandwiches: IntArray,
): Int {
    val lhs = students.toMutableList()
    val rhs = sandwiches.toMutableList()
    var count = 0
    while (lhs.size > 0 && rhs.size > 0) {
        if (count == lhs.size) break
        if (lhs.first() != rhs.first()) {
            lhs.add(lhs.removeAt(0))
            count++
        } else {
            lhs.removeAt(0)
            rhs.removeAt(0)
            count = 0
        }
    }
    return lhs.size
}
