
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeMostCommonSafeWordTest {
    @ParameterizedTest
    @MethodSource("mostCommonSafeWordData")
    fun kodeeMostCommonSafeWordTest(
        paragraph: String,
        banned: Array<String>,
        expected: String,
    ) {
        val result = kodeeMostCommonSafeWord(paragraph, banned)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun mostCommonSafeWordData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("Bob hit a ball, the hit BALL flew far after it was hit.", arrayOf("hit"), "ball"),
                Arguments.of("a.", arrayOf<String>(), "a"),
                Arguments.of("a b.b", arrayOf<String>(), "b"),
                Arguments.of("Bob. hIt, baLl", arrayOf("bob", "hit"), "ball"),
                Arguments.of("Apple apple APPLE banana!", arrayOf("apple"), "banana"),
                Arguments.of("Wow! wow? wow. really, really... REALLY!", arrayOf("wow"), "really"),
                Arguments.of("test test test test", arrayOf<String>(), "test"),
                Arguments.of(
                    "word ".repeat(1000),
                    arrayOf<String>(),
                    "word",
                ),
                Arguments.of("apple banana apple banana cherry", arrayOf("banana"), "apple"),
            )
    }
}
