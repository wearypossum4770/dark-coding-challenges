
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeFindLargestAltitudeTest {
    @ParameterizedTest
    @MethodSource("findLargestAltitudeData")
    fun kodeeFindLargestAltitudeTest(
        gain: IntArray,
        expected: Int,
    ) {
        val result = kodeeFindLargestAltitude(gain)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun findLargestAltitudeData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(-5, 1, 5, 0, -7), 1),
                Arguments.of(intArrayOf(-4, -3, -2, -1, 4, 3, 2), 0),
                Arguments.of(intArrayOf(0), 0),
                Arguments.of(intArrayOf(100), 100),
                Arguments.of(intArrayOf(-100), 0),
                Arguments.of(intArrayOf(1), 1),
                Arguments.of(intArrayOf(0, 0, 0, 0), 0),
                Arguments.of(intArrayOf(1, 2, 3, 4, 5), 15),
                Arguments.of(intArrayOf(-1, -2, -3, -4, -5), 0),
                Arguments.of(intArrayOf(5, 5, 5, 5), 20),
                Arguments.of(intArrayOf(-5, -5, -5, -5), 0),
                Arguments.of(intArrayOf(10, -20, 10), 10),
                Arguments.of(intArrayOf(1, 1, 1, 1, -100), 4),
                Arguments.of(intArrayOf(-100, 1, 1, 1, 1), 0),
                Arguments.of(intArrayOf(50, -100, 50, -100, 50), 50),
                Arguments.of(intArrayOf(100, -100, -100, -100), 100),
                Arguments.of(intArrayOf(-1, -1, -1, 1, 1), 0),
                Arguments.of(intArrayOf(1, -1, 1, -1, 1, -1), 1),
                Arguments.of(intArrayOf(1, 1, 1, 1, 1), 5),
                Arguments.of(intArrayOf(-100), 0),
                Arguments.of(intArrayOf(100), 100),
            )
    }
}
