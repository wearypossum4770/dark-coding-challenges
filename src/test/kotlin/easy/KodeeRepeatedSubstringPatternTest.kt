
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeRepeatedSubstringPatternTest {
    @ParameterizedTest
    @MethodSource("repeatedSubstringPatternData")
    fun kodeeRepeatedSubstringPatternTest(
        s: String,
        expected: Boolean,
    ) {
        val result = kodeeRepeatedSubstringPattern(s)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun repeatedSubstringPatternData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("a", false),
                Arguments.of("aa", true),
                Arguments.of("ab", false),
                Arguments.of("aba", false),
                Arguments.of("abab", true),
                Arguments.of("ababba", false),
                Arguments.of("abcabc", true),
                Arguments.of("abcabcabcabc", true),
                Arguments.of("abcdabcd", true),
                Arguments.of("abcdabce", false),
                Arguments.of("aaaaaaaa", true),
                Arguments.of("aaaaaaab", false),
                Arguments.of("abaababaab", true),
                Arguments.of("abaaba", true),
                Arguments.of("abaabab", false),
                Arguments.of("xyzxyzxyz", true),
                Arguments.of("xyzxy", false),
                Arguments.of("zz", true),
                Arguments.of("z", false),
                Arguments.of("ababababx", false),
            )
    }
}
