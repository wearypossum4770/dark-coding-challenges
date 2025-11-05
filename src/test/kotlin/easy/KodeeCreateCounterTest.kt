
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeCreateCounterTest {
    @ParameterizedTest
    @MethodSource("createCounterData")
    fun kodeeCreateCounterTest(
        n: Int,
        operations: CharArray,
        expected: IntArray,
    ) {
        var actual = IntArray(operations.size) { 0 }
        val counter = kodeeCreateCounter(n)
        for ((i, _) in operations.withIndex()) {
            kodeeCaptureCounter(actual, i, counter)
        }
        assertContentEquals(expected, actual)
    }

    companion object {
        @JvmStatic
        fun createCounterData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(
                    10,
                    charArrayOf('c', 'c', 'c'),
                    intArrayOf(10, 11, 12),
                ),
                Arguments.of(
                    -2,
                    charArrayOf('c', 'c', 'c', 'c', 'c'),
                    intArrayOf(-2, -1, 0, 1, 2),
                ),
                Arguments.of(
                    0,
                    charArrayOf(),
                    intArrayOf(),
                ),
                Arguments.of(
                    1000,
                    charArrayOf('c'),
                    intArrayOf(1000),
                ),
                Arguments.of(
                    0,
                    charArrayOf('c'),
                    intArrayOf(0),
                ),
                Arguments.of(
                    0,
                    charArrayOf(),
                    intArrayOf(),
                ),
                Arguments.of(
                    999,
                    charArrayOf('c', 'c', 'c'),
                    intArrayOf(999, 1000, 1001),
                ),
                Arguments.of(
                    -1_000,
                    charArrayOf('c', 'c'),
                    intArrayOf(-1000, -999),
                ),
                Arguments.of(
                    3,
                    charArrayOf('c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'),
                    intArrayOf(3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
                ),
                Arguments.of(
                    42,
                    charArrayOf('c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'),
                    intArrayOf(42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61),
                ),
                Arguments.of(
                    7,
                    charArrayOf('c'),
                    intArrayOf(7),
                ),
                Arguments.of(
                    100,
                    charArrayOf('c', 'c', 'c', 'c', 'c'),
                    intArrayOf(100, 101, 102, 103, 104),
                ),
                Arguments.of(
                    -1000,
                    charArrayOf('c', 'c', 'c'),
                    intArrayOf(-1000, -999, -998),
                ),
            )
    }
}
