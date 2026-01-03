
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeRotateStringTest {
    @ParameterizedTest
    @MethodSource("rotateStringData")
    fun kodeeRotateStringTest(
        s: String,
        goal: String,
        expected: Boolean,
    ) {
        val result = kodeeRotateString(s, goal)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun rotateStringData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("abcde", "cdeab", true),
                Arguments.of("abcde", "eabcd", true),
                Arguments.of("abcde", "abcde", true),
                Arguments.of("abcde", "abced", false),
                Arguments.of("abcde", "edcba", false),
                Arguments.of("aa", "a", false),
                Arguments.of("a", "aa", false),
                Arguments.of("abc", "abcd", false),
                Arguments.of("aaaa", "aaaa", true),
                Arguments.of("aabb", "bbaa", true),
                Arguments.of("aabb", "abab", false),
                Arguments.of("aabb", "abba", true),
                Arguments.of("defdefdefabcabc", "defdefabcabcdef", true),
                Arguments.of("bbbacddceeb", "ceebbbbacdd", true),
                Arguments.of("a", "a", true),
                Arguments.of("a", "b", false),
                Arguments.of("", "", true),
                Arguments.of("abcabc", "bcabca", true),
                Arguments.of("abcabc", "cabacb", false),
            )
    }
}
