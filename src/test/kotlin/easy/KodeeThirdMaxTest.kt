
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeThirdMaxTest {
    @ParameterizedTest
    @MethodSource("thirdMaxData")
    fun kodeeThirdMaxTest(
        numberToCheck: IntArray,
        expected: Int,
    ) {
        val result = kodeeThirdMax(numberToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun thirdMaxData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(3, 2, 1), 1),
                Arguments.of(intArrayOf(1, 2), 2),
                Arguments.of(intArrayOf(2, 2, 3, 1), 1),
                Arguments.of(intArrayOf(1, 2, 3, 4, 5), 3),
                Arguments.of(intArrayOf(5, 4, 3, 2, 1), 3),
                Arguments.of(intArrayOf(10, 20, 30, 40), 20),
                Arguments.of(intArrayOf(5, 5, 3, 2), 2),
                Arguments.of(intArrayOf(1, 2, 2, 3, 3), 1),
                Arguments.of(intArrayOf(-1, -2, -3, -4), -3),
                Arguments.of(intArrayOf(-10, -20, -30), -30),
                Arguments.of(intArrayOf(-10, 0, 10), -10),
                Arguments.of(intArrayOf(0, -1, 1, 2), 0),
                Arguments.of(intArrayOf(4, 4, 4, 3, 3, 2), 2),
                Arguments.of(intArrayOf(-5, -1, -3), -5),
                Arguments.of(intArrayOf(-2, -1, 0, 1, 2), 0),
                Arguments.of(intArrayOf(1, 2, -2147483648), -2147483648),
                Arguments.of(intArrayOf(Int.MIN_VALUE, 0, 1), Int.MIN_VALUE),
            )
    }
}
