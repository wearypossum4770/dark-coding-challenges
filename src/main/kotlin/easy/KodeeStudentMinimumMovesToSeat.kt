package easy
import kotlin.math.abs

fun kodeeStudentMinimumMovesToSeat(
    seats: IntArray,
    students: IntArray,
): Int {
    students.sort()
    seats.sort()
    return seats.indices.sumOf { index ->
        abs(seats[index] - students[index])
    }
}
