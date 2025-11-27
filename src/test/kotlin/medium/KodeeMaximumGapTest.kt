
package medium
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeMaximumGapTest {
    @ParameterizedTest
    @MethodSource("maximumGapData")
    fun kodeeMaximumGapTest(
        nums: IntArray,
        expected: Int,
    ) {
        val result = kodeeMaximumGap(nums)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun maximumGapData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(3, 6, 9, 1), 3),
                Arguments.of(intArrayOf(10), 0),
                Arguments.of(intArrayOf(1, 100), 99),
                Arguments.of(intArrayOf(1, 2, 3, 4, 5), 1),
                Arguments.of(intArrayOf(10, 9, 8, 7), 1),
                Arguments.of(intArrayOf(7, 7, 7, 7), 0),
                Arguments.of(intArrayOf(0, 1_000_000_000), 1_000_000_000),
                Arguments.of(intArrayOf(1, 100, 2, 50_000_000), 49999900),
                Arguments.of(intArrayOf(1, 1), 0),
                Arguments.of(intArrayOf(2, 2, 2, 3), 1),
                Arguments.of(intArrayOf(100, 3, 2, 1), 97),
                Arguments.of(intArrayOf(1, 3, 1_000, 2_000), 1_000),
                Arguments.of(intArrayOf(8, 1, 6, 3, 9), 3),
                Arguments.of(intArrayOf(5, 4, 3, 2, 1), 1),
                Arguments.of(intArrayOf(1, 2), 1),
                Arguments.of(intArrayOf(1_000_000_000, 0, 999_999_999), 999_999_999),
                Arguments.of(intArrayOf(1, 4, 7, 13, 20, 21), 7),
                Arguments.of(intArrayOf(5, 5, 5, 10), 5),
                Arguments.of(intArrayOf(0, 1, 2, 3, 100), 97),
                Arguments.of(intArrayOf(100, 200, 300, 1_000), 700),
            )
    }
}
