
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeSumOfMultiplesTest {
    @ParameterizedTest
    @MethodSource("sumOfMultiplesData")
    fun kodeeSumOfMultiplesTest(
        numberToCheck: Int,
        expected: Int,
    ) {
        val result = kodeeSumOfMultiples(numberToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun sumOfMultiplesData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(1, 0),
                Arguments.of(2, 0),
                Arguments.of(3, 3),
                Arguments.of(5, 8),
                Arguments.of(7, 21),
                Arguments.of(9, 30),
                Arguments.of(10, 40),
                Arguments.of(12, 52),
                Arguments.of(15, 81),
                Arguments.of(20, 119),
                Arguments.of(21, 140),
                Arguments.of(50, 691),
                Arguments.of(100, 2_838),
                Arguments.of(1_000, 272_066),
                Arguments.of(200, 10_845),
            )
    }
}
