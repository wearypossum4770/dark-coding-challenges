
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeDetectCapitalUseTest {
    @ParameterizedTest
    @MethodSource("detectCapitalUseData")
    fun kodeeDetectCapitalUseTest(
        word: String,
        expected: Boolean,
    ) {
        val result = kodeeDetectCapitalUse(word)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun detectCapitalUseData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("USA", true),
                Arguments.of("leetcode", true),
                Arguments.of("Google", true),
                Arguments.of("FlaG", false),
                Arguments.of("g", true),
                Arguments.of("G", true),
                Arguments.of("LeetCode", false),
                Arguments.of("aPPle", false),
                Arguments.of("APPLE", true),
                Arguments.of("apple", true),
                Arguments.of("Apple", true),
                Arguments.of("AppLe", false),
                Arguments.of("zZZ", false),
                Arguments.of("HELlo", false),
                Arguments.of("qwerty", true),
                Arguments.of("Qwerty", true),
                Arguments.of("QWERTY", true),
                Arguments.of("QwErTy", false),
                Arguments.of("Abcdefg", true),
                Arguments.of("UsA", false),
                Arguments.of("abcdEfg", false),
            )
    }
}
