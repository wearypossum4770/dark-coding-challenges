package easy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeStringIsSubsequenceTest {
    @ParameterizedTest
    @MethodSource("stringIsSubsequenceData")
    fun kodeeStringIsSubsequenceTest(
        s: String,
        t: String,
        expected: Boolean,
    ) {
        val result = kodeeStringIsSubsequence(s, t)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun stringIsSubsequenceData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("abc", "ahbgdc", true),
                Arguments.of("", "", true),
                Arguments.of("", "anything", true),
                Arguments.of("a", "a", true),
                Arguments.of("a", "b", false),
                Arguments.of("z", "abc", false),
                Arguments.of("acb", "abc", false),
                Arguments.of("xyz", "abcxyz", true),
                Arguments.of("aaa", "aaaaaa", true),
                Arguments.of("aaa", "aa", false),
                Arguments.of("abc", "abc", true),
                Arguments.of("abc", "a" + "x".repeat(9999) + "b" + "y".repeat(9999) + "c", true),
                Arguments.of("ace", "abcde", true),
                Arguments.of("aec", "abcde", false),
                Arguments.of("axc", "ahbgdc", false),
            )
    }
}
