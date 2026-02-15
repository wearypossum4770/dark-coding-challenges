package easy;

import static org.junit.jupiter.api.Assertions.*;

import helpers.TreeNode;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class MaxDepthTest {
  MaxDepth instance = new MaxDepth();

  @ParameterizedTest
  @MethodSource("maxDepthData")
  public void testMaxDepth(Integer[] nums, int expected) {
    TreeNode<Integer> root = TreeNode.fromIntegerArray(nums);
    int result = instance.solve(root);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> maxDepthData() {
    return Stream.of(
        Arguments.of(new Integer[] {3, 9, 20, null, null, 15, 7}, 3),
        Arguments.of(new Integer[] {1, null, 2}, 2),
        Arguments.of(new Integer[] {1}, 1),
        Arguments.of(new Integer[] {}, 0),
        Arguments.of(new Integer[] {1, 2, null, 3, null, 4, null, 5}, 5),
        Arguments.of(new Integer[] {1, null, 2, null, 3, null, 4, null, 5}, 5),
        Arguments.of(new Integer[] {1, 2, 3, 4, 5, 6, 7}, 3),
        Arguments.of(new Integer[] {1, 2, 3, 4, 5, 6, null}, 3),
        Arguments.of(new Integer[] {5, 4, 6, 3, null, null, 7, null, 2}, 4),
        Arguments.of(new Integer[] {-100, -100, -100, -100, -100}, 3),
        Arguments.of(new Integer[] {0}, 1),
        Arguments.of(new Integer[] {100}, 1),
        Arguments.of(new Integer[] {10, 20, null, 30, null, 40, null, 50}, 5));
  }
}
