
package easy
import KodeeTreeNode
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeIsTreeSymmetricTest {
    @ParameterizedTest
    @MethodSource("isTreeSymmetricData")
    fun kodeeIsTreeSymmetricTest(
        nums: Array<Int?>,
        expected: Boolean,
    ) {
        val root = KodeeTreeNode.fromArray(nums)
        val result = kodeeIsTreeSymmetric(root)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun isTreeSymmetricData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(arrayOf(1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5), true),
                Arguments.of(arrayOf(1, 2, 2, 3, 4, 4, 3), true),
                Arguments.of(arrayOf<Int?>(), true),
                Arguments.of(arrayOf(1), true),
                Arguments.of(arrayOf(1, 2, 2), true),
                Arguments.of(arrayOf(1, 2, 3), false),
                Arguments.of(arrayOf(1, 2, 2, 3, 4, 4, 3), true),
                Arguments.of(arrayOf(1, 2, 2, 3, 4, 4, 5), false),
                Arguments.of(arrayOf(1, 2, 2, 3, null, null, 3), true),
                Arguments.of(arrayOf(1, 2, 2, null, 3, null, 3), false),
                Arguments.of(arrayOf(1, 2, 2, 3, 3, null, null), false),
                Arguments.of(arrayOf(1, null, null), true),
                Arguments.of(arrayOf(1, 2, null), false),
                Arguments.of(arrayOf(1, null, 2), false),
                Arguments.of(arrayOf(1, 2, 2, 3, 4, null, 4, 5, 6, null, null, 6, 5), false),
                Arguments.of(arrayOf(1, 2, 2, 3, 4, null, 4, 5, 6, null, null, 7, 5), false),
                Arguments.of(arrayOf(0), true),
                Arguments.of(arrayOf(0, 0, 0), true),
                Arguments.of(arrayOf(0, 0, 1), false),
                Arguments.of(arrayOf(1, 2, 2, 2, 2, 2, 2), true),
                Arguments.of(arrayOf(1, 2, 3, 4, 5, 6, 7), false),
                Arguments.of(arrayOf(1, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4), true),
                Arguments.of(arrayOf(5, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2), true),
                Arguments.of(arrayOf(1, 2, null, 3, null, null, null), false),
                Arguments.of(arrayOf(1, null, null, null, null, null, null), true),
                Arguments.of(arrayOf(2, 3, 3, 4, 5, 5, 4, 6, 7, 8, 8, 7, 6), false),
                Arguments.of(arrayOf(1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5), true),
                Arguments.of(arrayOf(1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 6), false),
                Arguments.of(arrayOf(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1), true),
            )
    }
}
