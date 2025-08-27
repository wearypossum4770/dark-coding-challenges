
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeMergeSortedArrayTest {
    @ParameterizedTest
    @MethodSource("mergeSortedArrayData")
    fun kodeeMergeSortedArrayTest(
        first: IntArray,
        firstSize: Int,
        second: IntArray,
        secondSize: Int,
        expected: IntArray,
    ) {
        val result = kodeeMergeSortedArray(first, firstSize, second, secondSize)
        assertContentEquals(expected, result)
    }

    @ParameterizedTest
    @MethodSource("mergeSortedArrayData")
    fun kodeeMergeSortedArrayInPlaceTest(
        first: IntArray,
        firstSize: Int,
        second: IntArray,
        secondSize: Int,
        expected: IntArray,
    ) {
        kodeeMergeSortedArrayInPlace(first, firstSize, second, secondSize)
        assertContentEquals(first, expected)
    }

    companion object {
        @JvmStatic
        fun mergeSortedArrayData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 2, 3, 0, 0, 0), 3, intArrayOf(2, 5, 6), 3, intArrayOf(1, 2, 2, 3, 5, 6)),
                Arguments.of(intArrayOf(1), 1, intArrayOf(), 0, intArrayOf(1)),
                Arguments.of(intArrayOf(0), 0, intArrayOf(1), 1, intArrayOf(1)),
            )
    }
}
