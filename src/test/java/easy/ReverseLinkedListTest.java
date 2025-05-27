package easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class ReverseLinkedListTest {
  ReverseLinkedList instance = new ReverseLinkedList();

  @ParameterizedTest
  @MethodSource("reverseLinkedListData")
  public void testReverseLinkedList(int[] nums, int[] reversed) {

    DukeListNode<Integer> nodes = DukeListNode.fromIntArray(nums);
    DukeListNode<Integer> result = instance.solve(nodes);

    int[] outcome = result.toIntegerArray();

    assertArrayEquals(outcome, reversed);
  }

  public static Stream<Arguments> reverseLinkedListData() {
    return Stream.of(Arguments.of(new int[] {1, 2, 3, 4, 5}, new int[] {5, 4, 3, 2, 1}));
  }
}
