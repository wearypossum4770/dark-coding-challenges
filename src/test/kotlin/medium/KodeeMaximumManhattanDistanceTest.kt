
package medium
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeMaximumManhattanDistanceTest {
@ParameterizedTest
@MethodSource("maximumManhattanDistanceData")
fun kodeeMaximumManhattanDistanceTest(
numberToCheck: Int,
expected: Int,
) {
val result = kodeeMaximumManhattanDistance(numberToCheck)
assertEquals(expected, result)
}
companion object {
@JvmStatic
fun maximumManhattanDistanceData(): Stream<Arguments> =
Stream.of(
Arguments.of(2, 1),

)
}
}