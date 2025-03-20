
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeFindContentChildrenTest {
    @ParameterizedTest
    @MethodSource("findContentChildrenData")
    fun kodeeFindContentChildrenTest(
        children: IntArray,
        cookies: IntArray,
        expected: Int,
    ) {
        val result = kodeeFindContentChildren(children, cookies)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun findContentChildrenData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 2, 3), intArrayOf(1, 1), 1),
                Arguments.of(intArrayOf(1, 2), intArrayOf(1, 2, 3), 2),
                Arguments.of(intArrayOf(10, 9, 8, 7), intArrayOf(5, 6, 7, 8), 2),
                Arguments.of(intArrayOf(), intArrayOf(1, 2), 0),
                Arguments.of(intArrayOf(1, 2), intArrayOf(), 0),
            )
    }
}
