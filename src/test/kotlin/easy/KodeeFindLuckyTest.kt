
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeFindLuckyTest {
    @ParameterizedTest
    @MethodSource("findLuckyData")
    fun kodeeFindLuckyTest(
        arr: IntArray,
        expected: Int,
    ) {
        val result = kodeeFindLucky(arr)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun findLuckyData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(2, 2, 3, 4), 2),
                Arguments.of(intArrayOf(1, 2, 2, 3, 3, 3), 3),
                Arguments.of(intArrayOf(2, 2, 2, 3, 3), -1),
            )
    }
}
