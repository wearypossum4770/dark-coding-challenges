package easy

import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertEquals

class KodeeMiddleLinkedListNodeTest {
    @ParameterizedTest
    @MethodSource("middleLinkedListNodeData")
    fun kodeeMiddleLinkedListNodeTest(
        nums: List<Int>,
        expected: List<Int>,
    ) {
        val result = kodeeMiddleLinkedListNode(KodeeListNode.fromIterable(nums))
        val outcome = KodeeListNode.toList(result)
        assertEquals(expected, outcome)
    }

    companion object {
        @JvmStatic
        fun middleLinkedListNodeData(): Stream<Arguments> =
            Stream.of(
                // Arguments.of(listOf(), listOf()),
                // Arguments.of(listOf(Int.MAX_VALUE), listOf(Int.MAX_VALUE)),
                // Arguments.of(listOf(Int.MIN_VALUE, Int.MAX_VALUE), listOf(Int.MAX_VALUE)),
                // Arguments.of(listOf(1, 1, 1, 1, 1), listOf(1, 1, 1)),
                // Arguments.of(listOf(-3, -2, -1, 0, 1, 2, 3), listOf(0, 1, 2, 3)),
                // Arguments.of(listOf(1), listOf(1)),
                // Arguments.of(listOf(1, 2), listOf(2)),
                // Arguments.of(listOf(1, 2, 3), listOf(2, 3)),
                // Arguments.of(listOf(1, 2, 3, 4), listOf(3, 4)),
                // Arguments.of(listOf(1, 2, 3, 4, 5), listOf(3, 4, 5)),
                Arguments.of(listOf(1, 2, 3, 4, 5, 6), listOf(4, 5, 6)),
            )
    }
}
