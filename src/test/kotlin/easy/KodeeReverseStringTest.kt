
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeReverseStringTest {
    @ParameterizedTest
    @MethodSource("reverseStringData")
    fun kodeeReverseStringTest(
        input: CharArray,
        expected: CharArray,
    ) {
        kodeeReverseString(input)
        assertContentEquals(expected, input)
    }

    companion object {
        @JvmStatic
        fun reverseStringData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(charArrayOf('h', 'e', 'l', 'l', 'o'), charArrayOf('o', 'l', 'l', 'e', 'h')),
                Arguments.of(charArrayOf('a', 'b', 'c', 'd'), charArrayOf('d', 'c', 'b', 'a')),
                Arguments.of(charArrayOf('z'), charArrayOf('z')),
                Arguments.of(charArrayOf(), charArrayOf()),
            )
    }
}
