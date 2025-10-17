package easy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeHeightCheckerTest {
    @ParameterizedTest
    @MethodSource("heightCheckerData")
    fun kodeeHeightCheckerTest(
        heights: IntArray,
        expected: Int,
    ) {
        val result = kodeeHeightChecker(heights)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun heightCheckerData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 1, 4, 2, 1, 3), 3),
                Arguments.of(intArrayOf(5, 1, 2, 3, 4), 5),
                Arguments.of(intArrayOf(1, 2, 3, 4, 5), 0),
                Arguments.of(
                    intArrayOf(10, 6, 6, 10, 10, 9, 8, 8, 3, 3, 8, 2, 1, 5, 1, 9, 5, 2, 7, 4, 7, 7),
                    22,
                ),
            )
    }
}
