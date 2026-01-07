package medium;

import static org.junit.jupiter.api.Assertions.assertEquals;

import easy.DukeListNode;
import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class DeleteLinkedListNodeTest {
    DeleteLinkedListNode instance = new DeleteLinkedListNode();

    @ParameterizedTest
    @MethodSource("dataDeleteLinkedListNode")
    public void testDeleteLinkedListNode(int[] nums, int node, List<Integer> expected) {
        DukeListNode<Integer> head = DukeListNode.fromArray(nums);
        DukeListNode<Integer> nodeToDelete = head;
        while (nodeToDelete != null) {
            if ((int) nodeToDelete.val == node) break;
            nodeToDelete = nodeToDelete.next;
        }
        instance.solve(nodeToDelete);
        List<Integer> result = head.toList();
        assertEquals(expected, result);
    }

    public static Stream<Arguments> dataDeleteLinkedListNode() {
        return Stream.of(
                Arguments.of(new int[] {4, 5, 1, 9}, 5, List.of(4, 1, 9)),
                Arguments.of(new int[] {4, 5, 1, 9}, 1, List.of(4, 5, 9)),
                Arguments.of(new int[] {1, 2, 3, 4}, 3, List.of(1, 2, 4)),
                Arguments.of(new int[] {0, 1}, 0, List.of(1)));
    }
}
