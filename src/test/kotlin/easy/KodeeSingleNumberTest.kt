
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeSingleNumberTest {
    @ParameterizedTest
    @MethodSource("singleNumberData")
    fun kodeeSingleNumberTest(
        nums: IntArray,
        expected: Int,
    ) {
        val result = kodeeSingleNumber(nums)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun singleNumberData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(2, 2, 1), 1),
                Arguments.of(intArrayOf(4, 1, 2, 1, 2), 4),
                Arguments.of(intArrayOf(1), 1),
            )
    }
}
