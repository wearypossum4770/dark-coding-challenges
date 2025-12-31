
package veryeasy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeSecondLargestTest {
    @ParameterizedTest
    @MethodSource("secondLargestData")
    fun kodeeSecondLargestTest(
        nums: IntArray,
        expected: Int,
    ) {
        val result = kodeeSecondLargest(nums)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun secondLargestData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(10, 40, 30, 20, 50), 40),
                Arguments.of(intArrayOf(25, 143, 89, 13, 105), 105),
                Arguments.of(intArrayOf(54, 23, 11, 17, 10), 23),
                Arguments.of(intArrayOf(513, 211, 131, 417, 11), 417),
                Arguments.of(intArrayOf(63, 44, 11, 22, 33, 66, 65), 65),
                Arguments.of(intArrayOf(5, 5, 3), 3),
                Arguments.of(intArrayOf(5, 5, 5, 4), 4),
                Arguments.of(intArrayOf(1, 2, 2, 1), 1),
                Arguments.of(intArrayOf(3, 3, 2, 2, 1), 2),
                Arguments.of(intArrayOf(-1, -2, -3), -2),
                Arguments.of(intArrayOf(-10, -20, -30, -40), -20),
                Arguments.of(intArrayOf(-5, -1, -3), -3),
                Arguments.of(intArrayOf(-10, 0, 10), 0),
                Arguments.of(intArrayOf(0, -1, 1), 0),
                Arguments.of(intArrayOf(-1, -1, 0), -1),
            )
    }
}
