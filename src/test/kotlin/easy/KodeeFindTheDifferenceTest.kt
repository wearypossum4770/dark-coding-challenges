
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeFindTheDifferenceTest {
    @ParameterizedTest
    @MethodSource("findTheDifferenceData")
    fun kodeeFindTheDifferenceTest(
        s: String,
        t: String,
        expected: Char,
    ) {
        val result = kodeeFindTheDifference(s, t)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun findTheDifferenceData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("abcd", "abcde", 'e'),
                Arguments.of("", "y", 'y'),
                Arguments.of("a", "aa", 'a'),
                Arguments.of("aabbcc", "aabbccd", 'd'),
            )
    }
}
