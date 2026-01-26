
package easy
import KodeeTreeNode
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeIsSameTreeTest {
    @ParameterizedTest
    @MethodSource("isSameTreeData")
    fun kodeeIsSameTreeTest(
        a: String,
        b: String,
        expected: Boolean,
    ) {
        val p = KodeeTreeNode.fromString(a)
        val q = KodeeTreeNode.fromString(b)
        val result = kodeeIsSameTree(p, q)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun isSameTreeData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("1 2 x x 3 x x", "1 2 x x 3 x x", true),
                Arguments.of("1 2 x x 3 x x", "1 2 x x x", false),
                Arguments.of("1 2 x x 3 x x", "1 x 2 x x", false),
                Arguments.of("1 2 3 x x x x", "1 x 2 x 3 x x", false),
                Arguments.of("x", "x", true),
                Arguments.of("1 x x", "x", false),
                Arguments.of("1 x x", "1 x x", true),
                Arguments.of("1 x x", "2 x x", false),
                Arguments.of("1 2 x x x", "1 x 2 x x", false),
                Arguments.of("1 2 3 x x x x", "1 2 3 x x x x", true),
                Arguments.of("1 2 3 x x x x", "1 2 4 x x x x", false),
                Arguments.of("5 3 1 x x 4 x x 7 6 x x 9 x x", "5 3 1 x x 4 x x 7 6 x x 9 x x", true),
                Arguments.of("1 2 4 x x 5 x x 3 6 x x 7 x x", "1 2 4 x x 5 x x 3 6 x x 8 x x", false),
                Arguments.of("1 2 x x 3 x x", "1 x 2 x 3 x x", false),
                Arguments.of("10 5 2 x x 7 x x 15 12 x x 20 x x", "10 5 2 x x 7 x x 15 12 x x 20 x x", true),
                Arguments.of("1 x 2 x 3 x 4 x x", "1 x 2 x 3 x 4 x x", true),
                Arguments.of("4 3 2 1 x x x x x", "4 3 2 1 x x x x x", true),
                Arguments.of(
                    "8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x",
                    "8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x",
                    true,
                ),
                Arguments.of("3 x 4 x 5 x 6 x x", "3 x 4 x 5 x 7 x x", false),
                Arguments.of("100 50 25 x x 75 x x 150 125 x x 175 x x", "100 50 25 x x 75 x x 150 125 x x 175 x x", true),
            )
    }
}
