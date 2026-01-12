
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeRelativeSortArrayTest {
    @ParameterizedTest
    @MethodSource("relativeSortArrayData")
    fun kodeeRelativeSortArrayTest(
        arr1: IntArray,
        arr2: IntArray,
        expected: IntArray,
    ) {
        val result = kodeeRelativeSortArray(arr1, arr2)
        assertContentEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun relativeSortArrayData(): Stream<Arguments> =
            Stream.of(
			Arguments.of(intArrayOf(2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19), intArrayOf(2, 1, 4, 3, 9, 6), intArrayOf(2, 2, 2, 1, 4, 3, 3, 9, 6, 7, 19)),
		Arguments.of(intArrayOf(28, 6, 22, 8, 44, 17), intArrayOf(22, 28, 8, 6), intArrayOf(22, 28, 8, 6, 17, 44)),
		Arguments.of(intArrayOf(5, 3, 8, 1, 9, 2), intArrayOf(), intArrayOf(1, 2,3, 5, 8, 9)),
		Arguments.of(intArrayOf(5, 5, 2, 2, 8, 8), intArrayOf(2, 5, 8), intArrayOf(2, 2, 5, 5, 8, 8)),
		Arguments.of(intArrayOf(42), intArrayOf(42), intArrayOf(42)),
		Arguments.of(intArrayOf(100, 1, 100, 2), intArrayOf(1, 2), intArrayOf(1, 2, 100, 100)),
		Arguments.of(intArrayOf(3, 3, 3, 3, 3), intArrayOf(3), intArrayOf(3, 3, 3, 3, 3)),
		Arguments.of(intArrayOf(0), intArrayOf(0), intArrayOf(0)),
		Arguments.of(intArrayOf(), intArrayOf(1, 2, 3), intArrayOf()),
		Arguments.of(intArrayOf(7, 1, 7, 1, 7), intArrayOf(7, 1), intArrayOf(7, 7, 7, 1, 1)),
		Arguments.of(intArrayOf(999, 0, 500, 1000, 0), intArrayOf(0, 1000), intArrayOf(0, 0, 1000, 500, 999)),
		Arguments.of(intArrayOf(1, 2, 3, 4, 5), intArrayOf(5, 4, 3, 2, 1), intArrayOf(5, 4, 3, 2, 1)),
            )
    }
}
