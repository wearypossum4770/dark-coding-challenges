
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeSmallestEvenMultipleTest {
    @ParameterizedTest
    @MethodSource("smallestEvenMultipleData")
    fun kodeeSmallestEvenMultipleTest(
        n: Int,
        expected: Int,
    ) {
        val result = kodeeSmallestEvenMultiple(n)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun smallestEvenMultipleData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(1, 2),
                Arguments.of(2, 2),
                Arguments.of(3, 6),
                Arguments.of(4, 4),
                Arguments.of(5, 10),
                Arguments.of(6, 6),
                Arguments.of(7, 14),
                Arguments.of(8, 8),
                Arguments.of(9, 18),
                Arguments.of(10, 10),
                Arguments.of(11, 22),
                Arguments.of(12, 12),
                Arguments.of(13, 26),
                Arguments.of(14, 14),
                Arguments.of(15, 30),
                Arguments.of(16, 16),
                Arguments.of(17, 34),
                Arguments.of(18, 18),
                Arguments.of(19, 38),
                Arguments.of(20, 20),
                Arguments.of(149, 298),
                Arguments.of(150, 150),
            )
    }
}
