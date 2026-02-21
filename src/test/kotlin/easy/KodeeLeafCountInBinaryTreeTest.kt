
package easy
import KodeeTreeNode
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeLeafCountInBinaryTreeTest {
    @ParameterizedTest
    @MethodSource("leafCountInBinaryTreeData")
    fun kodeeLeafCountInBinaryTreeTest(
        nums: Array<Int?>,
        expected: Int,
    ) {
        val root = KodeeTreeNode.fromArray(nums)
        val result = kodeeLeafCountInBinaryTree(root)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun leafCountInBinaryTreeData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(arrayOf(1, 10, 39, 5), 2),
                Arguments.of(arrayOf(4, 8, 10, 7, null, 5, 1, 3), 3),
                Arguments.of(arrayOf(50, 30, 70, 20, 40, 60, 80, null, null, null, null, 65), 4),
                Arguments.of(arrayOf(30, 25, 35, 20, 28, null, 40, null, null, 27), 3),
                Arguments.of(arrayOf(1, 2, 3, -1, -1, -1, -1), 4),
                Arguments.of(arrayOf(1, 2, 3, null, null, null, null), 2),
                Arguments.of(arrayOf(1, 2, 3, 4, 5, null, null, null, null, null, null), 3),
                Arguments.of(arrayOf(10, 20, 30, 40, 50, 60, 70), 4),
                Arguments.of(arrayOf<Int?>(null), 0),
                Arguments.of(arrayOf(5), 1),
                Arguments.of(arrayOf(1, null, null), 1),
                Arguments.of(arrayOf(1, 2, null, 3, null, 4, null, 5, null), 1),
                Arguments.of(arrayOf(1, null, 2, null, 3, null, 4, null, 5, null, 6), 1),
                Arguments.of(arrayOf(50, 30, 70, 20, 40, 60, 80, null, null, null, null, null, null, null, null), 4),
                // Difficult / degenerate cases
                Arguments.of(arrayOf(1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10), 1),
                Arguments.of(arrayOf(-5, -8, -3, -12, -7, null, null, null, null, null, null), 3),
                Arguments.of(arrayOf(100000, 99999, 1, 2, null, null, null, 3, 4, 5, 6), 4),
                Arguments.of(arrayOf(-42, 42, -42, 42, -42, 42, -42), 4),
                Arguments.of(arrayOf(7, null, 8, null, 9, null, 10, null, 11, null, 12, null, 13), 1),
                Arguments.of(arrayOf(1, 2, 3, null, null, null, 4, null, null, null, null, null, null, null, 5), 2),
                Arguments.of(arrayOf(99999, null, null), 1),
            )
    }
}
