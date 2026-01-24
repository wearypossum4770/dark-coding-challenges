package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class MiddleLinkedListNodeTest {
  MiddleLinkedListNode<Integer> instance = new MiddleLinkedListNode<>();

  @ParameterizedTest
  @MethodSource("dataMiddleLinkedListNode")
  public void testMiddleLinkedListNode(int[] nums, List<Integer> expected) {
    DukeListNode<Integer> head = DukeListNode.fromArray(nums);
    DukeListNode<Integer> result = instance.solve(head);
    List<Integer> outcome = result.toList();
    assertEquals(expected, outcome);
  }

  public static Stream<Arguments> dataMiddleLinkedListNode() {
    return Stream.of(
        Arguments.of(IntStream.rangeClosed(0, 4), List.of(2)),
        Arguments.of(IntStream.rangeClosed(0, 5), List.of(3)),
        Arguments.of(IntStream.rangeClosed(1, 7), List.of(4)),
        Arguments.of(IntStream.rangeClosed(1, 9), List.of(5)),
        Arguments.of(IntStream.rangeClosed(1, 11), List.of(6)),
        Arguments.of(IntStream.rangeClosed(1, 13), List.of(7)),
        Arguments.of(IntStream.rangeClosed(1, 15), List.of(8)),
        Arguments.of(IntStream.rangeClosed(1, 17), List.of(9)),
        Arguments.of(IntStream.rangeClosed(1, 19), List.of(10)),
        Arguments.of(IntStream.rangeClosed(1, 21), List.of(11)),
        Arguments.of(IntStream.rangeClosed(1, 23), List.of(12)),
        Arguments.of(IntStream.rangeClosed(1, 25), List.of(13)),
        Arguments.of(IntStream.rangeClosed(1, 27), List.of(14)),
        Arguments.of(IntStream.rangeClosed(1, 29), List.of(15)),
        Arguments.of(IntStream.rangeClosed(1, 31), List.of(16)),
        Arguments.of(IntStream.rangeClosed(1, 33), List.of(17)),
        Arguments.of(IntStream.rangeClosed(1, 35), List.of(18)),
        Arguments.of(IntStream.rangeClosed(1, 37), List.of(19)),
        Arguments.of(IntStream.rangeClosed(1, 39), List.of(20)),
        Arguments.of(new int[] {Integer.MAX_VALUE}, List.of(Integer.MAX_VALUE)),
        Arguments.of(new int[] {Integer.MIN_VALUE, Integer.MAX_VALUE}, List.of(Integer.MAX_VALUE)),
        Arguments.of(new int[] {1, 1, 1, 1, 1}, List.of(1, 1, 1)),
        Arguments.of(IntStream.rangeClosed(-3, 3), List.of(0, 1, 2, 3)),
        Arguments.of(IntStream.rangeClosed(1, 1), List.of(1)),
        Arguments.of(IntStream.rangeClosed(1, 2), List.of(2)),
        Arguments.of(IntStream.rangeClosed(1, 3), List.of(2, 3)),
        Arguments.of(IntStream.rangeClosed(1, 4), List.of(3, 4)),
        Arguments.of(IntStream.rangeClosed(1, 5), List.of(3, 4, 5)),
        Arguments.of(IntStream.rangeClosed(1, 6), List.of(4, 5, 6)));
  }
}
