package easy;

import static org.junit.jupiter.api.Assertions.*;

import helpers.TreeNode;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class SumOfLeftLeavesTest {
  SumOfLeftLeaves instance = new SumOfLeftLeaves();

  @ParameterizedTest
  @MethodSource("dataSumOfLeftLeaves")
  public void testSumOfLeftLeaves(Integer[] nums, int expected) {
    TreeNode<Integer> root = TreeNode.fromIntegerArray(nums);
    int result = instance.solve(root);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataSumOfLeftLeaves() {
    return Stream.of(
        Arguments.of(new Integer[] {}, 0),
        Arguments.of(new Integer[] {1}, 0),
        Arguments.of(new Integer[] {1, 2}, 2),
        Arguments.of(new Integer[] {1, null, 3}, 0),
        Arguments.of(new Integer[] {1, 2, 3}, 2),
        Arguments.of(new Integer[] {3, 9, 20, null, null, 15, 7}, 24),
        Arguments.of(new Integer[] {1, 2, null, 3, null, 4}, 4),
        Arguments.of(new Integer[] {1, null, 2, null, 3, null, 4}, 0),
        Arguments.of(new Integer[] {1, 2, 3, 4, 5}, 4),
        Arguments.of(new Integer[] {1, 2, 3, null, 4}, 0),
        Arguments.of(new Integer[] {0, -1, -2}, -1),
        Arguments.of(new Integer[] {1, 2, null, null, 3}, 0),
        Arguments.of(new Integer[] {1, null, 2, 3}, 3),
        Arguments.of(new Integer[] {1, 2, 3, 4, null, null, 5}, 4));
  }
}
