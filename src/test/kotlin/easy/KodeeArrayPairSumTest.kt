
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeArrayPairSumTest {
    @ParameterizedTest
    @MethodSource("arrayPairSumData")
    fun kodeeArrayPairSumTest(
        numberToCheck: IntArray,
        expected: Int,
    ) {
        val result = kodeeArrayPairSum(numberToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun arrayPairSumData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 4, 3, 2), 4),
                Arguments.of(intArrayOf(6, 2, 6, 5, 1, 2), 9),
                Arguments.of(intArrayOf(1, 1), 1),
                Arguments.of(intArrayOf(0, 0), 0),
                Arguments.of(intArrayOf(-1, -1), -1),
                Arguments.of(intArrayOf(10_000, 10_000), 10_000),
                Arguments.of(intArrayOf(5, 5, 5, 5), 10),
                Arguments.of(intArrayOf(7, 7, 7, 7, 7, 7), 21),
                Arguments.of(intArrayOf(1, 2, 3, 4, 5, 6), 9),
                Arguments.of(intArrayOf(6, 5, 4, 3, 2, 1), 9),
                Arguments.of(intArrayOf(-5, -4, -3, -2), -8),
                Arguments.of(intArrayOf(-10, -1, 1, 10), -9),
                Arguments.of(intArrayOf(-10_000, 10_000, -9_999, 9_999), -1),
                Arguments.of(intArrayOf(1, 100, 2, 99, 3, 98), 100 + 3),
                Arguments.of(intArrayOf(0, 0, 0, 0, 0, 0), 0),
                Arguments.of(intArrayOf(-10_000, 10_000), -10_000),
            )
    }
}
