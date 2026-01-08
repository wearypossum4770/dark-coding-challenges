
package medium
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeFindDuplicateNumberTest {
    @ParameterizedTest
    @MethodSource("findDuplicateNumberData")
    fun kodeeFindDuplicateNumberTest(
        nums: IntArray,
        expected: Int,
    ) {
        val result = kodeeFindDuplicateNumber(nums)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun findDuplicateNumberData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 1), 1),
                Arguments.of(intArrayOf(1, 3, 4, 2, 2), 2),
                Arguments.of(intArrayOf(3, 1, 3, 4, 2), 3),
                Arguments.of(intArrayOf(3, 3, 3, 3, 3), 3),
                Arguments.of(intArrayOf(2, 1, 2), 2),
                Arguments.of(intArrayOf(1, 4, 6, 3, 2, 5, 6), 6),
                Arguments.of(intArrayOf(5, 4, 3, 2, 1, 5), 5),
                Arguments.of(intArrayOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 9), 9),
                Arguments.of(intArrayOf(2, 2, 2, 2, 2), 2),
                Arguments.of(intArrayOf(1, 1, 2, 3, 4, 5), 1),
                Arguments.of(intArrayOf(4, 3, 1, 4, 2), 4),
                Arguments.of(intArrayOf(6, 1, 5, 4, 3, 2, 6), 6),
                Arguments.of(intArrayOf(1, 2, 3, 4, 5, 3), 3),
                Arguments.of(intArrayOf(7, 6, 5, 4, 3, 2, 1, 7), 7),
            )
    }
}
