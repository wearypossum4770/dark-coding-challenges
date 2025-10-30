package easy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeSortArrayByParityTest {
    @ParameterizedTest
    @MethodSource("sortArrayByParityData")
    fun kodeeSortArrayByParityTest(
        nums: IntArray,
        expected: IntArray,
    ) {
        val result = kodeeSortArrayByParity(nums)
        assertContentEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun sortArrayByParityData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(3, 1, 2, 4), intArrayOf(4, 2, 1, 3)),
                Arguments.of(intArrayOf(0, 1, 2), intArrayOf(0, 2, 1)),
                Arguments.of(intArrayOf(0), intArrayOf(0)),
            )
    }
}
