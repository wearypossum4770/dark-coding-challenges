package easy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeCanConstructRansomNoteTest {
    @ParameterizedTest
    @MethodSource("canConstructRansomNoteData")
    fun kodeeCanConstructRansomNoteTest(
        note: String,
        magazine: String,
        expected: Boolean,
    ) {
        val result = kodeeCanConstructRansomNote(note, magazine)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun canConstructRansomNoteData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("a", "b", false),
                Arguments.of("aa", "aab", true),
                Arguments.of("a", "a", true),
                Arguments.of("aa", "ab", false),
                Arguments.of("abc", "cbad", true),
                Arguments.of("", "anything", true),
                Arguments.of("a", "", false),
                Arguments.of("", "", true),
                Arguments.of("aA", "aa", true),
                Arguments.of("Aa", "aA", true),
                Arguments.of("zzz", "zzzzzz", true),
                Arguments.of("zzzz", "zzz", false),
                Arguments.of("hello world", "dlrow olleh", true),
            )
    }
}
