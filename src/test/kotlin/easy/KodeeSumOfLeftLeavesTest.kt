
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import utilities.KodeeTreeNode
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeSumOfLeftLeavesTest {
    @ParameterizedTest
    @MethodSource("sumOfLeftLeavesData")
    fun kodeeSumOfLeftLeavesTest(
        nums: Array<Int?>,
        expected: Int,
    ) {
        val root: KodeeTreeNode<Int?>? = KodeeTreeNode.fromArray(nums)
        val result = kodeeSumOfLeftLeaves<Int>(root)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun sumOfLeftLeavesData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(arrayOf<Int?>(), 0),
                Arguments.of(arrayOf(1), 0),
                Arguments.of(arrayOf(1, 2), 2),
                Arguments.of(arrayOf(1, null, 3), 0),
                Arguments.of(arrayOf(1, 2, 3), 2),
                Arguments.of(arrayOf(3, 9, 20, null, null, 15, 7), 24),
                Arguments.of(arrayOf(1, 2, null, 3, null, 4), 4),
                Arguments.of(arrayOf(1, null, 2, null, 3, null, 4), 0),
                Arguments.of(arrayOf(1, 2, 3, 4, 5), 4),
                Arguments.of(arrayOf(1, 2, 3, null, 4), 0),
                Arguments.of(arrayOf(0, -1, -2), -1),
                Arguments.of(arrayOf(1, 2, null, null, 3), 0),
                Arguments.of(arrayOf(1, null, 2, 3), 3),
                Arguments.of(arrayOf(1, 2, 3, 4, null, null, 5), 4),
            )
    }
}
