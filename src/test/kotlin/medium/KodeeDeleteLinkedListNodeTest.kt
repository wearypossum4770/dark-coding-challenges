package medium

import easy.KodeeListNode
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.Arguments
import org.junit.jupiter.params.provider.MethodSource
import java.util.stream.Stream
import kotlin.test.assertContentEquals

class KodeeDeleteLinkedListNodeTest {
    @ParameterizedTest
    @MethodSource("deleteLinkedListNodeData")
    fun kodeeDeleteLinkedListNodeTest(
        nums: IntArray,
        target: Int,
        expected: IntArray,
    ) {
        var head = KodeeListNode.fromArray(*nums.toTypedArray())
        var node = head
        while (node != null) {
            if (node.`val` != null && node.`val` == target) break
            node = node.next
        }
        kodeeDeleteLinkedListNode(node)
        val actual = KodeeListNode.toIntArray(head)
        assertContentEquals(expected, actual)
    }

    companion object {
        @JvmStatic
        fun deleteLinkedListNodeData(): Stream<Arguments> =
            Stream.of(
                Arguments.of(intArrayOf(4, 5, 1, 9), 5, intArrayOf(4, 1, 9)),
                Arguments.of(intArrayOf(4, 5, 1, 9), 1, intArrayOf(4, 5, 9)),
                Arguments.of(intArrayOf(1, 2, 3, 4), 3, intArrayOf(1, 2, 4)),
                Arguments.of(intArrayOf(0, 1), 0, intArrayOf(1)),
            )
    }
}
