package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class ReverseLinkedListTest {
  ReverseLinkedList instance = new ReverseLinkedList();

  @ParameterizedTest
  @MethodSource("reverseLinkedListData")
  public void testReverseLinkedList(int[] nums, int[] reversed) {

    List<Integer> inputList = Arrays.stream(nums).boxed().collect(Collectors.toList());
    List<Integer> expectedList = Arrays.stream(reversed).boxed().collect(Collectors.toList());

    DukeListNode<Integer> nodes = DukeListNode.fromIterable(inputList);
    DukeListNode<Integer> result = instance.solve(nodes);

    List<Integer> resultList = result.toArray();

    assertEquals(expectedList, resultList);
  }

  public static Stream<Arguments> reverseLinkedListData() {
    return Stream.of(Arguments.of(new int[] {1, 2, 3, 4, 5}, new int[] {5, 4, 3, 2, 1}));
  }
}
