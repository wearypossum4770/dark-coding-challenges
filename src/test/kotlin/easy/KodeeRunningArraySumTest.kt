
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeRunningArraySumTest {
    @ParameterizedTest
    @MethodSource("runningArraySumData")
    fun kodeeRunningArraySumTest(
        nums: IntArray,
        expected: IntArray,
    ) {
        val result = kodeeRunningArraySum(nums)
        assertContentEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun runningArraySumData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 2, 3, 4), intArrayOf(1, 3, 6, 10)),
                Arguments.of(intArrayOf(1, 1, 1, 1, 1), intArrayOf(1, 2, 3, 4, 5)),
                Arguments.of(intArrayOf(3, 1, 2, 10, 1), intArrayOf(3, 4, 6, 16, 17)),
            )
    }
}
