
package easy
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeAddBinaryTest {
    @ParameterizedTest
    @MethodSource("addBinaryData")
    fun kodeeAddBinaryTest(
        a: String,
        b: String,
        expected: String,
    ) {
        val result = kodeeAddBinary(a, b)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun addBinaryData(): Stream<Arguments> =
            Stream.of(
                Arguments.of("11", "1", "100"),
                Arguments.of("1010", "1011", "10101"),
            )
    }
}
