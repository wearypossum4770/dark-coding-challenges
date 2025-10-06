
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeePascalsTriangleTest {
    @ParameterizedTest
    @MethodSource("pascalsTriangleData")
    fun kodeePascalsTriangleTest(
        numRows: Int,
        expected: List<List<Int>>,
    ) {
        val result = kodeePascalsTriangle(numRows)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun pascalsTriangleData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(
                    1,
                    listOf(
                        listOf(1),
                    ),
                ),
                Arguments.of(
                    2,
                    listOf(
                        listOf(1),
                        listOf(1, 1),
                    ),
                ),
                Arguments.of(
                    3,
                    listOf(
                        listOf(1),
                        listOf(1, 1),
                        listOf(1, 2, 1),
                    ),
                ),
                Arguments.of(
                    4,
                    listOf(
                        listOf(1),
                        listOf(1, 1),
                        listOf(1, 2, 1),
                        listOf(1, 3, 3, 1),
                    ),
                ),
                Arguments.of(
                    5,
                    listOf(
                        listOf(1),
                        listOf(1, 1),
                        listOf(1, 2, 1),
                        listOf(1, 3, 3, 1),
                        listOf(1, 4, 6, 4, 1),
                    ),
                ),
                Arguments.of(
                    6,
                    listOf(
                        listOf(1),
                        listOf(1, 1),
                        listOf(1, 2, 1),
                        listOf(1, 3, 3, 1),
                        listOf(1, 4, 6, 4, 1),
                        listOf(1, 5, 10, 10, 5, 1),
                    ),
                ),
            )
    }
}
