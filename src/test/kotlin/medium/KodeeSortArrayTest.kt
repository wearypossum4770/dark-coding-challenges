
package medium
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeSortArrayTest {
    @ParameterizedTest
    @MethodSource("sortArrayData")
    fun kodeeSortArrayTest(
        nums: IntArray,
        expected: IntArray,
    ) {
        val result = kodeeSortArray(nums)
        assertContentEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun sortArrayData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(
                    intArrayOf(5, 1, 1, 2, 0, 0),
                    intArrayOf(0, 0, 1, 1, 2, 5),
                ),
                Arguments.of(
                    intArrayOf(5, 2, 3, 1),
                    intArrayOf(1, 2, 3, 5),
                ),
                Arguments.of(
                    intArrayOf(1, 2, 3, 4, 5, 6, 7, 8, 9),
                    intArrayOf(1, 2, 3, 4, 5, 6, 7, 8, 9),
                ),
                Arguments.of(
                    intArrayOf(5, 5, 5, 5),
                    intArrayOf(5, 5, 5, 5),
                ),
                Arguments.of(
                    intArrayOf(1),
                    intArrayOf(1),
                ),
                Arguments.of(
                    intArrayOf(-1, 0, 1),
                    intArrayOf(-1, 0, 1),
                ),
                Arguments.of(
                    intArrayOf(7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7),
                    intArrayOf(7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7),
                ),
                Arguments.of(
                    intArrayOf(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                    intArrayOf(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
                ),
                Arguments.of(
                    intArrayOf(-50000, 50000, -49999, 49999),
                    intArrayOf(-50000, -49999, 49999, 50000),
                ),
                Arguments.of(
                    intArrayOf(10, 20, 30, 40, 50, 80, 60, 70, 90, 100, 120, 110),
                    intArrayOf(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120),
                ),
                Arguments.of(
                    intArrayOf(100, 90, 80, 70, 60, 50, 40, 30, 20, 10),
                    intArrayOf(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                ),
                Arguments.of(
                    intArrayOf(50000, 49999, 49998, -50000, -49999, -49998, 0, 1, -1, 2, -2),
                    intArrayOf(-50000, -49999, -49998, -2, -1, 0, 1, 2, 49998, 49999, 50000),
                ),
                Arguments.of(
                    intArrayOf(-50000, -50000, -50000, -50000, -50000, 50000, 50000, 50000, 50000, 50000),
                    intArrayOf(-50000, -50000, -50000, -50000, -50000, 50000, 50000, 50000, 50000, 50000),
                ),
                Arguments.of(
                    intArrayOf(1, 2, 3, 4, 5, 6, 7, -1),
                    intArrayOf(-1, 1, 2, 3, 4, 5, 6, 7),
                ),
                Arguments.of(
                    intArrayOf(1, 2, 3, 4, 5),
                    intArrayOf(1, 2, 3, 4, 5),
                ),
                Arguments.of(
                    intArrayOf(0, 0, 0, 0, 1, 1, -1, -1, 2, 2, -2, -2, 0, 3, -3, 3, -3, 0, 1, -1, 2, -2, 0),
                    intArrayOf(-3, -3, -2, -2, -2, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3),
                ),
                Arguments.of(
                    intArrayOf(4, -7, 2, 11, -3, 0, 9, 5, -12, 8, 1, -6, 3, -1, 10, -4, 7, 13, -8, 6, -2, 12, -5, 9),
                    intArrayOf(-12, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10, 11, 12, 13),
                ),
                Arguments.of(
                    intArrayOf(-42, 17, 99, -88, 0, 33, 76, -15, 61, 23, -71, 8, 54, -29, 92, -3, 47, -66),
                    intArrayOf(-88, -71, -66, -42, -29, -15, -3, 0, 8, 17, 23, 33, 47, 54, 61, 76, 92, 99),
                ),
                Arguments.of(
                    intArrayOf(50000, -50000, 50000, -50000, 0),
                    intArrayOf(-50000, -50000, 0, 50000, 50000),
                ),
                Arguments.of(
                    intArrayOf(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                    intArrayOf(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                ),
                Arguments.of(
                    intArrayOf(-50000, 50000, -50000, 50000, -50000),
                    intArrayOf(-50000, -50000, -50000, 50000, 50000),
                ),
                Arguments.of(
                    intArrayOf(),
                    intArrayOf(),
                ),
                Arguments.of(
                    intArrayOf(-50000),
                    intArrayOf(-50000),
                ),
                Arguments.of(
                    intArrayOf(1, 2, 3, 4, 5, 6, 7, 8, 9),
                    intArrayOf(1, 2, 3, 4, 5, 6, 7, 8, 9),
                ),
                Arguments.of(
                    intArrayOf(5),
                    intArrayOf(5),
                ),
                Arguments.of(
                    intArrayOf(-4, -1, 0, 2, 5),
                    intArrayOf(-4, -1, 0, 2, 5),
                ),
                Arguments.of(
                    intArrayOf(10, 8, 6, 4, 2, 1, 3, 5, 7, 9),
                    intArrayOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                ),
                Arguments.of(
                    intArrayOf(50000, -50000, 0, 49999, -49999),
                    intArrayOf(-50000, -49999, 0, 49999, 50000),
                ),
                Arguments.of(
                    intArrayOf(-50000, 50000, 0, -49999, 49999),
                    intArrayOf(-50000, -49999, 0, 49999, 50000),
                ),
                Arguments.of(
                    intArrayOf(),
                    intArrayOf(),
                ),
                Arguments.of(
                    intArrayOf(1, 2, 3, 4),
                    intArrayOf(1, 2, 3, 4),
                ),
                Arguments.of(
                    intArrayOf(42),
                    intArrayOf(42),
                ),
                Arguments.of(
                    intArrayOf(),
                    intArrayOf(),
                ),
                Arguments.of(
                    intArrayOf(1),
                    intArrayOf(1),
                ),
                Arguments.of(
                    intArrayOf(-50000),
                    intArrayOf(-50000),
                ),
                Arguments.of(
                    intArrayOf(50000),
                    intArrayOf(50000),
                ),
                Arguments.of(
                    intArrayOf(7, 7, 7, 7, 7),
                    intArrayOf(7, 7, 7, 7, 7),
                ),
                Arguments.of(
                    intArrayOf(-1, 0, 1),
                    intArrayOf(-1, 0, 1),
                ),
                Arguments.of(
                    intArrayOf(4, -7, 11, 2, -3, 0, 9, 5, -12, 8),
                    intArrayOf(-12, -7, -3, 0, 2, 4, 5, 8, 9, 11),
                ),
                Arguments.of(
                    intArrayOf(0, 0, 0, 1, -1, 2, -2, 0),
                    intArrayOf(-2, -1, 0, 0, 0, 0, 1, 2),
                ),
                Arguments.of(
                    intArrayOf(1, 2, 3, 4, 5, 6, 7, 8),
                    intArrayOf(1, 2, 3, 4, 5, 6, 7, 8),
                ),
            )
    }
}
