
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeMajorityElementTest {
    @ParameterizedTest
    @MethodSource("majorityElementData")
    fun kodeeMajorityElementTest(
        nums: IntArray,
        expected: Int,
    ) {
        val result = kodeeMajorityElement(nums)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun majorityElementData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(2, 1, 2), 2),
                Arguments.of(intArrayOf(100), 100),
                Arguments.of(intArrayOf(2, 1, 1), 1),
                Arguments.of(intArrayOf(3,2,3), 3),
                Arguments.of(intArrayOf(2,2,1,1,1,2,2), 2),

            )
    }
}
