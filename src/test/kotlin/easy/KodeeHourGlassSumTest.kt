package easy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeHourGlassSumTest {
    @ParameterizedTest
    @MethodSource("hourGlassSumData")
    fun kodeeHourGlassSumTest(
        matrix: Array<IntArray>,
        expected: Int,
    ) {
        val result = kodeeHourGlassSum(matrix)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun hourGlassSumData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(
                    arrayOf(
                        intArrayOf(1, 1, 1, 0, 0, 0),
                        intArrayOf(0, 1, 0, 0, 0, 0),
                        intArrayOf(1, 1, 1, 0, 0, 0),
                        intArrayOf(0, 9, 2, -4, -4, 0),
                        intArrayOf(0, 0, 0, -2, 0, 0),
                        intArrayOf(0, 0, -1, -2, -4, 0),
                    ),
                    13,
                ),
                Arguments.of(
                    arrayOf(
                        intArrayOf(-1, -1, 0, -9, -2, -2),
                        intArrayOf(-2, -1, -6, -8, -2, -5),
                        intArrayOf(-1, -1, -1, -2, -3, -4),
                        intArrayOf(-1, -9, -2, -4, -4, -5),
                        intArrayOf(-7, -3, -3, -2, -9, -9),
                        intArrayOf(-1, -3, -1, -2, -4, -5),
                    ),
                    -6,
                ),
                Arguments.of(
                    arrayOf(
                        intArrayOf(7, 6, 8, 2, 4, 3),
                        intArrayOf(7, 3, 3, 0, 6, 1),
                        intArrayOf(3, 8, 7, 7, 2, 2),
                        intArrayOf(0, 8, 6, 8, 6, 1),
                        intArrayOf(7, 1, 6, 0, 2, 4),
                        intArrayOf(2, 7, 8, 1, 7, 4),
                    ),
                    44,
                ),
                Arguments.of(
                    arrayOf(
                        intArrayOf(3, 7, -3, 0, 1, 8),
                        intArrayOf(1, -4, -7, -8, -6, 5),
                        intArrayOf(-8, 1, 3, 3, 5, 7),
                        intArrayOf(-2, 4, 3, 1, 2, 7),
                        intArrayOf(2, 4, -5, 1, 8, 4),
                        intArrayOf(5, -7, 6, 5, 2, 8),
                    ),
                    33,
                ),
                Arguments.of(
                    arrayOf(
                        intArrayOf(0, 6, -7, 1, 6, 3),
                        intArrayOf(-8, 2, 8, 3, -2, 7),
                        intArrayOf(-3, 3, -6, -3, 0, -6),
                        intArrayOf(5, 0, 5, -1, -5, 2),
                        intArrayOf(6, 2, 8, 1, 3, 0),
                        intArrayOf(8, 5, 0, 4, -7, 4),
                    ),
                    25,
                ),
                Arguments.of(
                    arrayOf(
                        intArrayOf(0, -4, -6, 0, -7, -6),
                        intArrayOf(-1, -2, -6, -8, -3, -1),
                        intArrayOf(-8, -4, -2, -8, -8, -6),
                        intArrayOf(-3, -1, -2, -5, -7, -4),
                        intArrayOf(-3, -5, -3, -6, -6, -6),
                        intArrayOf(-3, -6, 0, -8, -6, -7),
                    ),
                    -19,
                ),
                Arguments.of(
                    arrayOf(
                        intArrayOf(1, 1, 1, 0, 0, 0),
                        intArrayOf(0, 1, 0, 0, 0, 0),
                        intArrayOf(1, 1, 1, 0, 0, 0),
                        intArrayOf(0, 0, 2, 4, 4, 0),
                        intArrayOf(0, 0, 0, 2, 0, 0),
                        intArrayOf(0, 0, 1, 2, 4, 0),
                    ),
                    19,
                ),
                Arguments.of(
                    arrayOf(
                        intArrayOf(-1, 1, -1, 0, 0, 0),
                        intArrayOf(0, -1, 0, 0, 0, 0),
                        intArrayOf(-1, -1, -1, 0, 0, 0),
                        intArrayOf(0, -9, 2, -4, -4, 0),
                        intArrayOf(-7, 0, 0, -2, 0, 0),
                        intArrayOf(0, 0, -1, -2, -4, 0),
                    ),
                    0,
                ),
            )
    }
}
