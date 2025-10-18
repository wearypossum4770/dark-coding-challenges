
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeFindEvenDigitNumbersTest {
    @ParameterizedTest
    @MethodSource("findEvenDigitNumbersData")
    fun kodeeFindEvenDigitNumbersTest(
        nums: IntArray,
        expected: Int,
    ) {
        val result = kodeeFindEvenDigitNumbers(nums)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun findEvenDigitNumbersData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(12, 345, 2, 6, 7896), 2),
                Arguments.of(intArrayOf(555, 901, 482, 1771), 1),
            )
    }
}
