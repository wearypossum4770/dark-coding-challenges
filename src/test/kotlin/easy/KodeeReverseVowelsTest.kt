
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeReverseVowelsTest {
    @ParameterizedTest
    @MethodSource("reverseVowelsData")
    fun kodeeReverseVowelsTest(
        s: String,
        expected: String,
    ) {
        val result = kodeeReverseVowels(s)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun reverseVowelsData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("IceCreAm", "AceCreIm"),
                Arguments.of("leetcode", "leotcede"),
                Arguments.of("a", "a"),
                Arguments.of("b", "b"),
                Arguments.of("AEIOU", "UOIEA"),
                Arguments.of("aeiou", "uoiea"),
                Arguments.of("bcdfgh", "bcdfgh"),
                Arguments.of("aA", "Aa"),
                Arguments.of("a.b,e", "e.b,a"),
                Arguments.of("hello world", "hollo werld"),
                Arguments.of("aEiOu", "uOiEa"),
                Arguments.of(".,?!", ".,?!"),
                Arguments.of("aaaaaa", "aaaaaa"),
                Arguments.of("aAaaAa", "aAaaAa"),
            )
    }
}
