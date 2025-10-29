
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeSortArrayByParityTwoTest {
    @ParameterizedTest
    @MethodSource("sortArrayByParityTwoData")
    fun kodeeSortArrayByParityTwoTest(
        nums: IntArray,
        expected: IntArray,
    ) {
        val result = kodeeSortArrayByParityTwo(nums)
        assertContentEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun sortArrayByParityTwoData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(4, 2, 5, 7), intArrayOf(4, 5, 2, 7)),
                Arguments.of(intArrayOf(2, 3), intArrayOf(2, 3)),
            )
    }
}
