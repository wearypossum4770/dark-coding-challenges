
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeNumIdenticalPairsTest {
    @ParameterizedTest
    @MethodSource("numIdenticalPairsData")
    fun kodeeNumIdenticalPairsTest(
        numberToCheck: IntArray,
        expected: Int,
    ) {
        val result = kodeeNumIdenticalPairs(numberToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun numIdenticalPairsData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 1, 1, 1), 6),
                Arguments.of(intArrayOf(1, 2, 3), 0),
                Arguments.of(intArrayOf(1, 2, 3, 1, 1, 3), 4),
            )
    }
}
