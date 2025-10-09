
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeDistributeCandiesTest {
    @ParameterizedTest
    @MethodSource("distributeCandiesData")
    fun kodeeDistributeCandiesTest(
        _criteria: String,
        candyType: IntArray,
        expected: Int,
    ) {
        val result = kodeeDistributeCandies(candyType)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun distributeCandiesData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("3 unique, can eat 3", intArrayOf(1, 1, 2, 2, 3, 3), 3),
                Arguments.of("3 unique, can eat 2", intArrayOf(1, 1, 2, 3), 2),
                Arguments.of("1 unique, can eat 2 -> only 1 type", intArrayOf(6, 6, 6, 6), 1),
                Arguments.of("6 unique, can eat 3", intArrayOf(1, 2, 3, 4, 5, 6), 3),
                Arguments.of("1 unique", intArrayOf(1, 1), 1),
                Arguments.of("no candies can't eay any", intArrayOf(), 0),
                Arguments.of("<constraint non-conforming> 1 unique, 1 count cannot eat", intArrayOf(1), 0),
                Arguments.of("2 unique, can eat 1", intArrayOf(1, 2), 1),
            )
    }
}
