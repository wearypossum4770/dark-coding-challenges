
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeFindFirstPalindromeTest {
    @ParameterizedTest
    @MethodSource("findFirstPalindromeData")
    fun kodeeFindFirstPalindromeTest(
        words: Array<String>,
        expected: String,
    ) {
        val result = kodeeFindFirstPalindrome(words)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun findFirstPalindromeData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(arrayOf("abc", "car", "ada", "racecar", "cool"), "ada"),
                Arguments.of(arrayOf("notapalindrome", "racecar"), "racecar"),
                Arguments.of(arrayOf("def", "ghi"), ""),
            )
    }
}
