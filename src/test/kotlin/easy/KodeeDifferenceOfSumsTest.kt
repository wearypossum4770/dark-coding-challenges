
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeDifferenceOfSumsTest {
    @ParameterizedTest
    @MethodSource("differenceOfSumsData")
    fun kodeeDifferenceOfSumsTest(
        n: Int,
        m: Int,
        expected: Int,
    ) {
        val result = kodeeDifferenceOfSums(n, m)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun differenceOfSumsData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(10, 3, 19),
                Arguments.of(5, 6, 15),
                Arguments.of(5, 1, -15),
            )
    }
}
