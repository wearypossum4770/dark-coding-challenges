package easy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeStringIntegerIsBalancedTest {
    @ParameterizedTest
    @MethodSource("stringIntegerIsBalancedData")
    fun kodeeStringIntegerIsBalancedTest(
        numberToCheck: String,
        expected: Boolean,
    ) {
        val result = kodeeStringIntegerIsBalanced(numberToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun stringIntegerIsBalancedData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("12", false),
                Arguments.of("11", true),
                Arguments.of("1234", false),
                Arguments.of("24123", true),
                Arguments.of("00", true),
                Arguments.of("10", false),
                Arguments.of("1010", false),
                Arguments.of("909", false),
                Arguments.of("1234567890", false),
                Arguments.of("111111", true),
                Arguments.of("123321", true),
                Arguments.of("99999999", true),
                Arguments.of("5005", true),
                Arguments.of("1234567", false),
                Arguments.of("1", false),
            )
    }
}
