
package medium
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeTopFrequentWordsTest {
    @ParameterizedTest
    @MethodSource("topFrequentWordsData")
    fun kodeeTopFrequentWordsTest(
        words: Array<String>,
        k: Int,
        expected: List<String>,
    ) {
        val result = kodeeTopFrequentWords(words, k)
        assertEquals(expected.toSet(), result.toSet())
    }

    companion object {
        @JvmStatic
        fun topFrequentWordsData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(
                    arrayOf("i", "love", "leetcode", "i", "love", "coding"),
                    2,
                    listOf("i", "love"),
                ),
                Arguments.of(
                    arrayOf("the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"),
                    4,
                    listOf("the", "is", "sunny", "day"),
                ),
                Arguments.of(
                    arrayOf("hello", "hello", "hello"),
                    1,
                    listOf("hello"),
                ),
                Arguments.of(
                    arrayOf("a", "b", "c", "d"),
                    4,
                    listOf("a", "b", "c", "d"),
                ),
                Arguments.of(
                    arrayOf("apple", "banana", "apple", "banana", "cherry", "cherry"),
                    3,
                    listOf("apple", "banana", "cherry"),
                ),
                Arguments.of(
                    arrayOf("x", "y", "z"),
                    1,
                    listOf("x"),
                ),
                Arguments.of(
                    arrayOf<String>(),
                    0,
                    listOf<String>(),
                ),
                Arguments.of(
                    arrayOf("a", "aa", "aaa", "a", "aaa", "aaa", "aa", "b", "b", "b"),
                    3,
                    listOf("aaa", "a", "b"),
                ),
                Arguments.of(
                    arrayOf("one", "two"),
                    5,
                    listOf("one", "two"),
                ),
            )
    }
}
