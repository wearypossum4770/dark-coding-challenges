
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeRemoveDuplicateZerosTest {
    @ParameterizedTest
    @MethodSource("removeDuplicateZerosData")
    fun kodeeRemoveDuplicateZerosTest(
        nums: IntArray,
        expected: IntArray,
    ) {
        kodeeRemoveDuplicateZeros(nums)
        assertContentEquals(expected, nums)
    }

    companion object {
        @JvmStatic
        fun removeDuplicateZerosData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 0, 2, 3, 0, 4, 5, 0), intArrayOf(1, 0, 0, 2, 3, 0, 0, 4)),
                Arguments.of(intArrayOf(1, 2, 3), intArrayOf(1, 2, 3)),
                Arguments.of(intArrayOf(0, 1, 0, 2, 0, 3), intArrayOf(0, 0, 1, 0, 0, 2)),
                Arguments.of(intArrayOf(0, 0, 0), intArrayOf(0, 0, 0)),
                Arguments.of(intArrayOf(1, 0, 0, 2), intArrayOf(1, 0, 0, 0)),
                Arguments.of(intArrayOf(0, 0, 0), intArrayOf(0, 0, 0)),
                Arguments.of(intArrayOf(0), intArrayOf(0)),
                Arguments.of(intArrayOf(7), intArrayOf(7)),
                Arguments.of(intArrayOf(1, 2, 0), intArrayOf(1, 2, 0)),
            )
    }
}
