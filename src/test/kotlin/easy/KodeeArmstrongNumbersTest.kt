package easy
import org.junit.jupiter.api.parallel.Execution
import org.junit.jupiter.api.parallel.ExecutionMode
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

@Execution(ExecutionMode.CONCURRENT)
class KodeeArmstrongNumbersTest {
    @ParameterizedTest(name = "Test {index}: {0} is an Armstrong Number => {1}")
    @MethodSource("armstrongNumberData")
    fun kodeeArmstrongNumbersTest(
        numberToCheck: Int,
        expected: Int,
    ) {
        val result = kodeeArmstrongNumbers(numberToCheck)
        assertEquals(expected, result)
    }

    companion object {
        @JvmStatic
        fun armstrongNumberData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(2, 1),
                Arguments.of(89, 0),
                Arguments.of(0, 1),
                Arguments.of(39, 0),
                Arguments.of(555, 0),
                Arguments.of(9475, 0),
                Arguments.of(9926315, 1),
                Arguments.of(93084, 1),
                Arguments.of(548834, 1),
                Arguments.of(2147483647, 0),
                Arguments.of(365, 0),
                Arguments.of(120, 0),
                Arguments.of(1253, 0),
                Arguments.of(153, 1),
                Arguments.of(-153, 0),
                Arguments.of(407, 1),
                Arguments.of(370, 1),
                Arguments.of(371, 1),
                Arguments.of(1634, 1),
                Arguments.of(8208, 1),
                Arguments.of(9474, 1),
            )
    }
}
