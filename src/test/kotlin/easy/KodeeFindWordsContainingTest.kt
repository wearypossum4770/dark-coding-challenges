
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeFindWordsContainingTest {
    @ParameterizedTest
    @MethodSource("findWordsContainingData")
    fun kodeeFindWordsContainingTest(
        words: Array<String>,
        char: Char,
        expected: List<Int>,
    ) {
        val result = kodeeFindWordsContaining(words, char)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun findWordsContainingData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(arrayOf("abc", "bcd", "aaaa", "cbc"), "a", listOf(0, 2)),
                Arguments.of(arrayOf("leet", "code"), 'e', listOf(0, 1)),
                Arguments.of(arrayOf("abc", "bcd", "aaaa", "cbc"), 'z', listOf<Int>()),
            )
    }
}
