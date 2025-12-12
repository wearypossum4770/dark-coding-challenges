
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeTimeRequiredToBuyTest {
    @ParameterizedTest
    @MethodSource("timeRequiredToBuyData")
    fun kodeeTimeRequiredToBuyTest(
        tickets: IntArray,
        k: Int,
        expected: Int,
    ) {
        val result = kodeeTimeRequiredToBuy(tickets, k)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun timeRequiredToBuyData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(2, 3, 2), 2, 6),
                Arguments.of(intArrayOf(5, 1, 1, 1), 0, 8),
                Arguments.of(intArrayOf(1), 0, 1),
                Arguments.of(intArrayOf(1, 1, 1, 1), 3, 4),
                Arguments.of(intArrayOf(3, 3, 3), 0, 7),
                Arguments.of(intArrayOf(3, 3, 3), 1, 8),
                Arguments.of(intArrayOf(3, 3, 3), 2, 9),
                Arguments.of(intArrayOf(1, 2, 3, 4), 3, 10),
                Arguments.of(intArrayOf(4, 3, 2, 1), 0, 10),
                Arguments.of(intArrayOf(4, 3, 2, 1), 1, 9),
                Arguments.of(intArrayOf(4, 3, 2, 1), 2, 7),
                Arguments.of(intArrayOf(4, 3, 2, 1), 3, 4),
                Arguments.of(intArrayOf(100, 100, 100), 1, 299),
                Arguments.of(intArrayOf(1, 100, 1), 1, 102),
                Arguments.of(intArrayOf(2, 1), 1, 2),
                Arguments.of(intArrayOf(2, 1), 0, 3),
                Arguments.of(intArrayOf(1, 2), 0, 1),
                Arguments.of(intArrayOf(1, 2), 1, 3),
            )
    }
}
