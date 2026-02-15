
package easy
import KodeeTreeNode
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeMaxDepthTest {
    @ParameterizedTest
    @MethodSource("maxDepthData")
    fun kodeeMaxDepthTest(
        nums: Array<Int?>,
        expected: Int,
    ) {
        val root = KodeeTreeNode.fromArray(nums)
        val result = kodeeMaxDepth(root)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun maxDepthData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(arrayOf(3, 9, 20, null, null, 15, 7), 3),
                Arguments.of(arrayOf(1, null, 2), 2),
                Arguments.of(arrayOf(1), 1),
                Arguments.of(emptyArray<Int>(), 0),
                Arguments.of(arrayOf(1, 2, null, 3, null, 4, null, 5), 5),
                Arguments.of(arrayOf(1, null, 2, null, 3, null, 4, null, 5), 5),
                Arguments.of(arrayOf(1, 2, 3, 4, 5, 6, 7), 3),
                Arguments.of(arrayOf(1, 2, 3, 4, 5, 6, null), 3),
                Arguments.of(arrayOf(5, 4, 6, 3, null, null, 7, null, 2), 4),
                Arguments.of(arrayOf(-100, -100, -100, -100, -100), 3),
                Arguments.of(arrayOf(0), 1),
                Arguments.of(arrayOf(100), 1),
                Arguments.of(arrayOf(10, 20, null, 30, null, 40, null, 50), 5),
            )
    }
}
