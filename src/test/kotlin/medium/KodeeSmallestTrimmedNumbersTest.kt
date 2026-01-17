
package medium
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeSmallestTrimmedNumbersTest {
    @ParameterizedTest
    @MethodSource("smallestTrimmedNumbersData")
    fun kodeeSmallestTrimmedNumbersTest(
        nums: Array<String>,
        queries: Array<IntArray>,
        expected: IntArray,
    ) {
        val result = kodeeSmallestTrimmedNumbers(nums, queries)
        assertContentEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun smallestTrimmedNumbersData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(
                    arrayOf("102", "473", "251", "814"),
                    arrayOf(intArrayOf(1, 1), intArrayOf(2, 3), intArrayOf(4, 2), intArrayOf(1, 2)),
                    intArrayOf(2, 2, 1, 0),
                ),
                Arguments.of(
                    arrayOf("24", "37", "96", "04"),
                    arrayOf(intArrayOf(2, 1), intArrayOf(2, 2)),
                    intArrayOf(3, 0),
                ),
                Arguments.of(
                    arrayOf("000", "000", "000", "000"),
                    arrayOf(intArrayOf(1, 1), intArrayOf(2, 1), intArrayOf(3, 1), intArrayOf(4, 1)),
                    intArrayOf(0, 1, 2, 3),
                ),
                Arguments.of(
                    arrayOf("0", "0", "0", "0"),
                    arrayOf(intArrayOf(1, 1), intArrayOf(2, 1), intArrayOf(3, 1), intArrayOf(4, 1)),
                    intArrayOf(0, 1, 2, 3),
                ),
                Arguments.of(
                    arrayOf("123456789", "987654321", "111111111", "000000000"),
                    arrayOf(intArrayOf(1, 9), intArrayOf(2, 9), intArrayOf(3, 9), intArrayOf(4, 9)),
                    intArrayOf(3, 2, 0, 1),
                ),
                Arguments.of(
                    arrayOf("9", "8", "7", "6", "5", "4", "3", "2", "1", "0"),
                    arrayOf(intArrayOf(1, 1), intArrayOf(5, 1), intArrayOf(10, 1)),
                    intArrayOf(9, 5, 0),
                ),
                Arguments.of(
                    arrayOf("100", "200", "300", "400", "500"),
                    arrayOf(intArrayOf(1, 2), intArrayOf(2, 2), intArrayOf(3, 2), intArrayOf(4, 2), intArrayOf(5, 2)),
                    intArrayOf(0, 1, 2, 3, 4),
                ),
                Arguments.of(
                    arrayOf("00100", "00101", "00110", "00111", "01000"),
                    arrayOf(intArrayOf(1, 3), intArrayOf(2, 3), intArrayOf(3, 3), intArrayOf(4, 3), intArrayOf(5, 3)),
                    intArrayOf(4, 0, 1, 2, 3),
                ),
                Arguments.of(
                    arrayOf("99999", "99998", "99997", "99996", "99995"),
                    arrayOf(intArrayOf(1, 5), intArrayOf(2, 5), intArrayOf(3, 5), intArrayOf(4, 5), intArrayOf(5, 5)),
                    intArrayOf(4, 3, 2, 1, 0),
                ),
                Arguments.of(
                    arrayOf("00001", "00010", "00100", "01000", "10000"),
                    arrayOf(intArrayOf(1, 5), intArrayOf(2, 5), intArrayOf(3, 5), intArrayOf(4, 5), intArrayOf(5, 5)),
                    intArrayOf(0, 1, 2, 3, 4),
                ),
                Arguments.of(
                    arrayOf("123", "123", "123", "123", "123"),
                    arrayOf(intArrayOf(1, 3), intArrayOf(2, 3), intArrayOf(3, 3), intArrayOf(4, 3), intArrayOf(5, 3)),
                    intArrayOf(0, 1, 2, 3, 4),
                ),
                Arguments.of(
                    arrayOf("000", "001", "002", "010", "100"),
                    arrayOf(intArrayOf(1, 3), intArrayOf(2, 3), intArrayOf(3, 3), intArrayOf(4, 3), intArrayOf(5, 3)),
                    intArrayOf(0, 1, 2, 3, 4),
                ),
                Arguments.of(
                    arrayOf("9876543210", "8765432109", "7654321098", "6543210987", "5432109876"),
                    arrayOf(intArrayOf(1, 10), intArrayOf(3, 10), intArrayOf(5, 10)),
                    intArrayOf(4, 2, 0),
                ),
                Arguments.of(
                    arrayOf("1", "10", "100", "1000", "10000"),
                    arrayOf(intArrayOf(1, 5), intArrayOf(2, 5), intArrayOf(3, 5), intArrayOf(4, 5), intArrayOf(5, 5)),
                    intArrayOf(0, 1, 2, 3, 4),
                ),
                Arguments.of(
                    arrayOf("999", "998", "997", "996", "995", "994", "993", "992", "991", "990"),
                    arrayOf(intArrayOf(1, 3), intArrayOf(5, 3), intArrayOf(10, 3)),
                    intArrayOf(9, 5, 0),
                ),
                Arguments.of(
                    arrayOf("0000000000", "0000000001", "0000000010", "0000000100", "0000001000"),
                    arrayOf(intArrayOf(1, 10), intArrayOf(2, 10), intArrayOf(3, 10), intArrayOf(4, 10), intArrayOf(5, 10)),
                    intArrayOf(0, 1, 2, 3, 4),
                ),
                Arguments.of(
                    arrayOf("1111111111", "2222222222", "3333333333", "4444444444", "5555555555"),
                    arrayOf(intArrayOf(1, 10), intArrayOf(2, 10), intArrayOf(3, 10), intArrayOf(4, 10), intArrayOf(5, 10)),
                    intArrayOf(0, 1, 2, 3, 4),
                ),
                Arguments.of(
                    arrayOf("1000000000", "999999999", "999999998", "999999997", "999999996"),
                    arrayOf(intArrayOf(1, 10), intArrayOf(2, 10), intArrayOf(3, 10)),
                    intArrayOf(0, 4, 3),
                ),
                Arguments.of(
                    arrayOf("000", "001", "010", "100", "999"),
                    arrayOf(intArrayOf(1, 3), intArrayOf(2, 3), intArrayOf(3, 3), intArrayOf(4, 3), intArrayOf(5, 3)),
                    intArrayOf(0, 1, 2, 3, 4),
                ),
                Arguments.of(
                    arrayOf("000000", "000001", "000010", "000100", "001000", "010000", "100000"),
                    arrayOf(intArrayOf(1, 6), intArrayOf(3, 6), intArrayOf(5, 6), intArrayOf(7, 6)),
                    intArrayOf(0, 2, 4, 6),
                ),
            )
    }
}
