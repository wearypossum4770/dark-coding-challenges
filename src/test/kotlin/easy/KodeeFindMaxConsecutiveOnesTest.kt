package easy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeFindMaxConsecutiveOnesTest {
    @ParameterizedTest
    @MethodSource("findMaxConsecutiveOnesData")
    fun kodeeFindMaxConsecutiveOnesTest(
        numberToCheck: IntArray,
        expected: Int,
    ) {
        val result = kodeeFindMaxConsecutiveOnes(numberToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun findMaxConsecutiveOnesData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 1, 0, 1, 1, 1), 3),
                Arguments.of(intArrayOf(1, 0, 1, 1, 0, 1), 2),
                Arguments.of(intArrayOf(0), 0),
                Arguments.of(intArrayOf(1), 1),
                Arguments.of(intArrayOf(1, 1, 1, 1), 4),
            )
    }
}
