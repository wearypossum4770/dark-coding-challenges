
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeReverseWordPrefixTest {
    @ParameterizedTest
    @MethodSource("reverseWordPrefixData")
    fun kodeeReverseWordPrefixTest(
        word: String,
        char: Char,
        expected: String,
    ) {
        val result = kodeeReverseWordPrefix(word, char)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun reverseWordPrefixData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("abcdefd", 'd', "dcbaefd"),
                Arguments.of("xyxzxe", 'z', "zxyxxe"),
                Arguments.of("abcd", 'z', "abcd"),
                Arguments.of("abcde", 'a', "abcde"),
                Arguments.of("aabcd", 'a', "aabcd"),
                Arguments.of("abcde", 'e', "edcba"),
                Arguments.of("a", 'a', "a"),
                Arguments.of("a", 'b', "a"),
                Arguments.of("aabcaad", 'a', "aabcaad"),
                Arguments.of("abacaba", 'c', "cabaaba"),
                Arguments.of("abcdabcd", 'd', "dcbaabcd"),
                Arguments.of("dcba", 'a', "abcd"),
                Arguments.of("ba", 'a', "ab"),
                Arguments.of("aaaa", 'a', "aaaa"),
                Arguments.of("aaaa", 'b', "aaaa"),
                Arguments.of("abcde", 'b', "bacde"),
                Arguments.of("abcde", 'd', "dcbae"),
                Arguments.of("ab", 'a', "ab"),
                Arguments.of("ab", 'b', "ba"),
                Arguments.of("ab", 'z', "ab"),
                Arguments.of("racecar", 'e', "ecarcar"),
                Arguments.of("racecar", 'r', "racecar"),
                Arguments.of("aabba", 'b', "baaba"),
                Arguments.of("mnopqrstu", 'u', "utsrqponm"),
                Arguments.of("абагд", 'а', "абагд"),
                Arguments.of("а", 'а', "а"),
                Arguments.of("а", 'б', "а"),
                Arguments.of("аб", 'а', "аб"),
                Arguments.of("аааа", 'а', "аааа"),
                Arguments.of("аааа", 'б', "аааа"),
                Arguments.of("abcde", 'а', "abcde"),
            )
    }
}
