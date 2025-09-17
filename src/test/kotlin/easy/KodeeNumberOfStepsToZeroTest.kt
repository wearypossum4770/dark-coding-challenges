
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeNumberOfStepsToZeroTest {
    @ParameterizedTest
    @MethodSource("numberOfStepsToZeroData")
    fun kodeeNumberOfStepsToZeroTest(
        numberToCheck: Int,
        expected: Int,
    ) {
        val result = kodeeNumberOfStepsToZero(numberToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun numberOfStepsToZeroData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(2, 2),
                Arguments.of(0, 0),
                Arguments.of(1, 1),
                Arguments.of(8, 4),
                Arguments.of(14, 6),
                Arguments.of(123, 12),
                Arguments.of(1_000_000, 26),
                Arguments.of(-1, 0),
                Arguments.of(999_999, 31),
            )
    }
}
