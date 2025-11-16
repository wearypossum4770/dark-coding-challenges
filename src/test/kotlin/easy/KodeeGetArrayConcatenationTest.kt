
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeGetArrayConcatenationTest {
    @ParameterizedTest
    @MethodSource("getArrayConcatenationData")
    fun kodeeGetArrayConcatenationTest(
        nums: IntArray,
        expected: IntArray,
    ) {
        val result = kodeeGetArrayConcatenation(nums)
        assertContentEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun getArrayConcatenationData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 2, 1), intArrayOf(1, 2, 1, 1, 2, 1)),
                Arguments.of(intArrayOf(1, 3, 2, 1), intArrayOf(1, 3, 2, 1, 1, 3, 2, 1)),
                Arguments.of(intArrayOf(1), intArrayOf(1, 1)),
                Arguments.of(intArrayOf(1000), intArrayOf(1000, 1000)),
                Arguments.of(intArrayOf(1, 1, 1), intArrayOf(1, 1, 1, 1, 1, 1)),
                Arguments.of(intArrayOf(2, 4, 6), intArrayOf(2, 4, 6, 2, 4, 6)),
                Arguments.of(intArrayOf(5, 10), intArrayOf(5, 10, 5, 10)),
                Arguments.of(intArrayOf(0, 1, 0), intArrayOf(0, 1, 0, 0, 1, 0)),
                Arguments.of(intArrayOf(1, 2, 3, 2, 1), intArrayOf(1, 2, 3, 2, 1, 1, 2, 3, 2, 1)),
            )
    }
}
