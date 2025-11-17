
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeShuffleArrayToCoordinatesTest {
    @ParameterizedTest
    @MethodSource("shuffleArrayToCoordinatesData")
    fun kodeeShuffleArrayToCoordinatesTest(
        nums: IntArray,
        n: Int,
        expected: IntArray,
    ) {
        val result = kodeeShuffleArrayToCoordinates(nums, n)
        assertContentEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun shuffleArrayToCoordinatesData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(2, 5, 1, 3, 4, 7), 3, intArrayOf(2, 3, 5, 4, 1, 7)),
                Arguments.of(intArrayOf(1, 2, 3, 4, 4, 3, 2, 1), 4, intArrayOf(1, 4, 2, 3, 3, 2, 4, 1)),
                Arguments.of(intArrayOf(1, 1, 2, 2), 2, intArrayOf(1, 2, 1, 2)),
            )
    }
}
