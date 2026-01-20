
package easy
import KodeeTreeNode
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeePreOrderTraversalTest {
    @ParameterizedTest
    @MethodSource("preOrderTraversalData")
    fun kodeePreOrderTraversalTest(
        nums: Array<Int?>,
        expected: List<Int>,
    ) {
        val root = KodeeTreeNode.fromArray(nums)
        val result = kodeePreOrderTraversal(root)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun preOrderTraversalData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(
                    arrayOf<Int?>(),
                    listOf<Int?>(),
                    "Empty tree",
                ),
                Arguments.of(
                    arrayOf<Int?>(null),
                    listOf<Int?>(),
                    "Single null node",
                ),
                Arguments.of(
                    arrayOf(1),
                    listOf(1),
                    "Single node",
                ),
                Arguments.of(
                    arrayOf(0),
                    listOf(0),
                    "Single zero node",
                ),
                Arguments.of(
                    arrayOf(1, 2),
                    listOf(1, 2),
                    "Root with left child only",
                ),
                Arguments.of(
                    arrayOf(1, null, 2),
                    listOf(1, 2),
                    "Root with right child only",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3),
                    listOf(1, 2, 3),
                    "Complete tree depth 1",
                ),
                Arguments.of(
                    arrayOf(1, 2, null, 3, null, 4),
                    listOf(1, 2, 3, 4),
                    "Left-skewed tree",
                ),
                Arguments.of(
                    arrayOf(1, null, 2, null, 3, null, 4),
                    listOf(1, 2, 3, 4),
                    "Right-skewed tree",
                ),
                Arguments.of(
                    arrayOf(1, 2, null, 3, null, 4, null, 5),
                    listOf(1, 2, 3, 4, 5),
                    "Deep left-skewed tree",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3, 4, 5, 6, 7),
                    listOf(1, 2, 4, 5, 3, 6, 7),
                    "Complete binary tree depth 2",
                ),
                Arguments.of(
                    arrayOf(100, 50, 150, 25, 75, 125, 175),
                    listOf(100, 50, 25, 75, 150, 125, 175),
                    "Balanced BST structure",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3, null, null, 4, 5),
                    listOf(1, 2, 3, 4, 5),
                    "Nulls in middle level",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3, null, 4, null, 5),
                    listOf(1, 2, 4, 3, 5),
                    "Alternating nulls",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3, 4, null, null, null, 5),
                    listOf(1, 2, 4, 5, 3),
                    "Deep left child only",
                ),
                Arguments.of(
                    arrayOf(1, null),
                    listOf(1),
                    "Single trailing null",
                ),
                Arguments.of(
                    arrayOf(1, null, null),
                    listOf(1),
                    "Multiple trailing nulls",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3, null, null, null, null),
                    listOf(1, 2, 3),
                    "Complete tree with trailing nulls",
                ),
                Arguments.of(
                    arrayOf(-50, null, 50, null, null, -25, 75),
                    listOf(-50, 50),
                    "Extra values after complete branches (orphaned)",
                ),
                Arguments.of(
                    arrayOf(-1, null, -2, null, -3),
                    listOf(-1, -2, -3),
                    "Right-skewed negative numbers",
                ),
                Arguments.of(
                    arrayOf(-10, -20, -30, -40, -50),
                    listOf(-10, -20, -40, -50, -30),
                    "Complete tree with negatives",
                ),
                Arguments.of(
                    arrayOf(-50, null, 50, -25, 75),
                    listOf(-50, 50, -25, 75),
                    "Mixed negative and positive",
                ),
                Arguments.of(
                    arrayOf(0, 0, 0, 0, 0),
                    listOf(0, 0, 0, 0, 0),
                    "All zeros",
                ),
                Arguments.of(
                    arrayOf(0, -1, 1, -2, 2, -3, 3),
                    listOf(0, -1, -2, 2, 1, -3, 3),
                    "Zero root with mixed values",
                ),
                Arguments.of(
                    arrayOf(1, 1, 1, 1, 1, 1, 1),
                    listOf(1, 1, 1, 1, 1, 1, 1),
                    "All duplicate values",
                ),
                Arguments.of(
                    arrayOf(-2147483648, null, 2147483647),
                    listOf(-2147483648, 2147483647),
                    "Min and max 32-bit integers",
                ),
                Arguments.of(
                    arrayOf(10, 5, 15, 3, 7, null, 20),
                    listOf(10, 5, 3, 7, 15, 20),
                    "BST structure with missing node",
                ),
                Arguments.of(
                    arrayOf(5, 3, 8, 1, 4, null, 9, null, 2),
                    listOf(5, 3, 1, 2, 4, 8, 9),
                    "Complex asymmetric tree",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3, 4, null, 5, 6, null, null, null, null, 7),
                    listOf(1, 2, 4, 3, 5, 6, 7),
                    "Mixed depth with sparse nulls",
                ),
                Arguments.of(
                    arrayOf(1, null, 2, 3),
                    listOf(1, 2, 3),
                    "Right child with left grandchild",
                ),
                Arguments.of(
                    arrayOf(1, 2, null, null, 3, null, 4, null, 5),
                    listOf(1, 2, 3, 4, 5),
                    "Zigzag pattern",
                ),
                Arguments.of(
                    arrayOf(1, null, 2, 3, null, 4, null, 5),
                    listOf(1, 2, 3, 4, 5),
                    "Right-heavy zigzag",
                ),
                Arguments.of(
                    arrayOf(1, 2, null, 3, 4, null, null, 5, 6),
                    listOf(1, 2, 3, 4, 5, 6),
                    "Left subtree with deep right branches",
                ),
                Arguments.of(
                    arrayOf(10, 5, null, 3, null, 7, null, 1),
                    listOf(10, 5, 3, 7, 1),
                    "Left child with alternating pattern",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3, null, null, null, 4),
                    listOf(1, 2, 3, 4),
                    "Right child of right child only",
                ),
                Arguments.of(
                    arrayOf(1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10),
                    listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                    "Very deep left-skewed (10 levels)",
                ),
                Arguments.of(
                    arrayOf(1, null, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10),
                    listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
                    "Very deep right-skewed (10 levels)",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15),
                    listOf(1, 2, 4, 8, 9, 5, 10, 11, 3, 6, 12, 13, 7, 14, 15),
                    "Complete binary tree depth 3 (15 nodes)",
                ),
                Arguments.of(
                    arrayOf(1, null, null, null, 2),
                    listOf(1),
                    "Orphaned node after nulls",
                ),
                Arguments.of(
                    arrayOf(1, 2, 3, null, null, null, null, null, null, 4),
                    listOf(1, 2, 3),
                    "Node far beyond tree structure",
                ),
            )
    }
}
