
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeRemoveArrayDuplicatesTest {
    @ParameterizedTest
    @MethodSource("removeArrayDuplicatesData")
    fun kodeeRemoveArrayDuplicatesTest(
        numberToCheck: IntArray,
        expected: Int,
    ) {
        val result = kodeeRemoveArrayDuplicates(numberToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun removeArrayDuplicatesData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(1, 1, 2), 2, intArrayOf(1, 2)),
                Arguments.of(intArrayOf(0, 0, 1, 1, 1, 2, 2, 3, 3, 4), 5, intArrayOf(0, 1, 2, 3, 4)),
                Arguments.of(intArrayOf(1), 1, intArrayOf(1)),
                Arguments.of(intArrayOf(0), 1, intArrayOf(0)),
                Arguments.of(intArrayOf(-100, -100, -50, -50, 0, 0, 100), 4, intArrayOf(-100, -50, 0, 100)),
                Arguments.of(intArrayOf(1, 1, 1, 1, 1), 1, intArrayOf(1)),
                Arguments.of(intArrayOf(1, 2, 3, 4, 5), 5, intArrayOf(1, 2, 3, 4, 5)),
                Arguments.of(intArrayOf(-100, -100, -100, 100, 100), 2, intArrayOf(-100, 100)),
            )
    }
}
