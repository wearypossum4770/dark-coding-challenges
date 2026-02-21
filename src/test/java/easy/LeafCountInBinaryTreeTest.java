package easy;

import static org.junit.jupiter.api.Assertions.*;

import helpers.TreeNode;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class LeafCountInBinaryTreeTest {
  LeafCountInBinaryTree instance = new LeafCountInBinaryTree();

  @ParameterizedTest
  @MethodSource("dataLeafCountInBinaryTree")
  public void testLeafCountInBinaryTree(Integer[] nums, int expected) {
    TreeNode root = TreeNode.fromIntegerArray(nums);
    int result = instance.solve(root);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataLeafCountInBinaryTree() {
    return Stream.of(
        Arguments.of(new Integer[] {1, 10, 39, 5}, 2),
        Arguments.of(new Integer[] {4, 8, 10, 7, null, 5, 1, 3}, 3),
        Arguments.of(new Integer[] {50, 30, 70, 20, 40, 60, 80, null, null, null, null, 65}, 4),
        Arguments.of(new Integer[] {30, 25, 35, 20, 28, null, 40, null, null, 27}, 3),
        Arguments.of(new Integer[] {1, 2, 3, -1, -1, -1, -1}, 4),
        Arguments.of(new Integer[] {1, 2, 3, null, null, null, null}, 2),
        Arguments.of(new Integer[] {1, 2, 3, 4, 5, null, null, null, null, null, null}, 3),
        Arguments.of(new Integer[] {10, 20, 30, 40, 50, 60, 70}, 4),
        Arguments.of(new Integer[] {null}, 0),
        Arguments.of(new Integer[] {5}, 1),
        Arguments.of(new Integer[] {1, null, null}, 1),
        Arguments.of(new Integer[] {1, 2, null, 3, null, 4, null, 5, null}, 1),
        Arguments.of(new Integer[] {1, null, 2, null, 3, null, 4, null, 5, null, 6}, 1),
        Arguments.of(
            new Integer[] {
              50, 30, 70, 20, 40, 60, 80, null, null, null, null, null, null, null, null
            },
            4),

        // Difficult / degenerate cases
        Arguments.of(
            new Integer[] {
              1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10
            },
            1),
        Arguments.of(new Integer[] {-5, -8, -3, -12, -7, null, null, null, null, null, null}, 3),
        Arguments.of(new Integer[] {100000, 99999, 1, 2, null, null, null, 3, 4, 5, 6}, 4),
        Arguments.of(new Integer[] {-42, 42, -42, 42, -42, 42, -42}, 4),
        Arguments.of(
            new Integer[] {7, null, 8, null, 9, null, 10, null, 11, null, 12, null, 13}, 1),
        Arguments.of(
            new Integer[] {
              1, 2, 3, null, null, null, 4, null, null, null, null, null, null, null, 5
            },
            2),
        Arguments.of(new Integer[] {99999, null, null}, 1));
  }
}
