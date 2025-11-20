
package medium
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeArrayStackTest {
@ParameterizedTest
@MethodSource("arrayStackData")
fun kodeeArrayStackTest(
target: IntArray, n: Int,
expected: List<String>,
) {
val result = kodeeArrayStack(target, n)
assertContentEquals(expected, result)
}
companion object {
@JvmStatic
fun arrayStackData(): Stream<Arguments> =
Stream.of(
	Arguments.of(intArrayOf(1, 3),3, listOf("Push", "Push", "Pop", "Push")),
Arguments.of(intArrayOf(1, 2, 3),3, listOf("Push", "Push", "Push")),
Arguments.of(intArrayOf(1, 2),4, listOf("Push", "Push")),
Arguments.of(intArrayOf(1),1, listOf("Push")),
Arguments.of(intArrayOf(1),100, listOf("Push")),
Arguments.of(intArrayOf(2),2, listOf("Push", "Pop", "Push")),
Arguments.of(intArrayOf(3),3, listOf("Push", "Pop", "Push", "Pop", "Push")),
Arguments.of(intArrayOf(2, 3, 4),4, listOf("Push", "Pop", "Push", "Push", "Push")),
Arguments.of(intArrayOf(1, 3, 5, 7),7, listOf("Push","Push","Pop","Push","Push","Pop","Push","Push","Pop","Push")),
Arguments.of(intArrayOf(5),5, listOf("Push","Pop","Push","Pop","Push","Pop","Push","Pop","Push")),
Arguments.of(intArrayOf(4, 5),5, listOf("Push","Pop","Push","Pop","Push","Pop","Push","Push")),
Arguments.of(intArrayOf(1, 2, 4),4, listOf("Push","Push","Push","Pop","Push")),

)
}
}