package easy;

import static org.junit.jupiter.api.Assertions.*;

import helpers.TreeNode;
import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class PreOrderTraversalTest {
  PreOrderTraversal<Integer> instance = new PreOrderTraversal<>();

  @ParameterizedTest
  @MethodSource("dataPreOrderTraversal")
  public void testPreOrderTraversal(Integer[] nums, List<Integer> expected, String _criteria) {
    TreeNode<Integer> root = TreeNode.fromIntegerArray(nums);
    List<Integer> result = instance.solve(root);

    assertEquals(expected, result);
  }

  @ParameterizedTest
  @MethodSource("preOrderTraversalDoubleData")
  public void preOrderTraversalDoubleTest(Double[] nums, double[] expected) {
    assertArrayEquals(expected, expected);
    assertArrayEquals(nums, nums);
  }

  public static Stream<Arguments> preOrderTraversalDoubleData() {
    return Stream.of(
        Arguments.of(
            new Double[] {5.0, 4.0, 6.0, 3.0, 4.5, null, null},
            new double[] {5.0, 4.0, 3.0, 4.5, 6.0}));
  }

  public static Stream<Arguments> dataPreOrderTraversal() {
    return Stream.of(
        Arguments.of(new Integer[] {}, List.of(), "Empty tree"),
        Arguments.of(new Integer[] {null}, List.of(), "Single null node"),
        Arguments.of(new Integer[] {1}, List.of(1), "Single node"),
        Arguments.of(new Integer[] {0}, List.of(0), "Single zero node"),
        Arguments.of(new Integer[] {1, 2}, List.of(1, 2), "Root with left child only"),
        Arguments.of(new Integer[] {1, null, 2}, List.of(1, 2), "Root with right child only"),
        Arguments.of(new Integer[] {1, 2, 3}, List.of(1, 2, 3), "Complete tree depth 1"),
        Arguments.of(
            new Integer[] {1, 2, null, 3, null, 4}, List.of(1, 2, 3, 4), "Left-skewed tree"),
        Arguments.of(
            new Integer[] {1, null, 2, null, 3, null, 4}, List.of(1, 2, 3, 4), "Right-skewed tree"),
        Arguments.of(
            new Integer[] {1, 2, null, 3, null, 4, null, 5},
            List.of(1, 2, 3, 4, 5),
            "Deep left-skewed tree"),
        Arguments.of(
            new Integer[] {1, 2, 3, 4, 5, 6, 7},
            List.of(1, 2, 4, 5, 3, 6, 7),
            "Complete binary tree depth 2"),
        Arguments.of(
            new Integer[] {100, 50, 150, 25, 75, 125, 175},
            List.of(100, 50, 25, 75, 150, 125, 175),
            "Balanced BST structure"),
        Arguments.of(
            new Integer[] {1, 2, 3, null, null, 4, 5},
            List.of(1, 2, 3, 4, 5),
            "Nulls in middle level"),
        Arguments.of(
            new Integer[] {1, 2, 3, null, 4, null, 5}, List.of(1, 2, 4, 3, 5), "Alternating nulls"),
        Arguments.of(
            new Integer[] {1, 2, 3, 4, null, null, null, 5},
            List.of(1, 2, 4, 5, 3),
            "Deep left child only"),
        Arguments.of(new Integer[] {1, null}, List.of(1), "Single trailing null"),
        Arguments.of(new Integer[] {1, null, null}, List.of(1), "Multiple trailing nulls"),
        Arguments.of(
            new Integer[] {1, 2, 3, null, null, null, null},
            List.of(1, 2, 3),
            "Complete tree with trailing nulls"),
        Arguments.of(
            new Integer[] {-50, null, 50, null, null, -25, 75},
            List.of(-50, 50),
            "Extra values after complete branches (orphaned)"),
        Arguments.of(
            new Integer[] {-1, null, -2, null, -3},
            List.of(-1, -2, -3),
            "Right-skewed negative numbers"),
        Arguments.of(
            new Integer[] {-10, -20, -30, -40, -50},
            List.of(-10, -20, -40, -50, -30),
            "Complete tree with negatives"),
        Arguments.of(
            new Integer[] {-50, null, 50, -25, 75},
            List.of(-50, 50, -25, 75),
            "Mixed negative and positive"),
        Arguments.of(new Integer[] {0, 0, 0, 0, 0}, List.of(0, 0, 0, 0, 0), "All zeros"),
        Arguments.of(
            new Integer[] {0, -1, 1, -2, 2, -3, 3},
            List.of(0, -1, -2, 2, 1, -3, 3),
            "Zero root with mixed values"),
        Arguments.of(
            new Integer[] {1, 1, 1, 1, 1, 1, 1},
            List.of(1, 1, 1, 1, 1, 1, 1),
            "All duplicate values"),
        Arguments.of(
            new Integer[] {-2147483648, null, 2147483647},
            List.of(-2147483648, 2147483647),
            "Min and max 32-bit integers"),
        Arguments.of(
            new Integer[] {10, 5, 15, 3, 7, null, 20},
            List.of(10, 5, 3, 7, 15, 20),
            "BST structure with missing node"),
        Arguments.of(
            new Integer[] {5, 3, 8, 1, 4, null, 9, null, 2},
            List.of(5, 3, 1, 2, 4, 8, 9),
            "Complex asymmetric tree"),
        Arguments.of(
            new Integer[] {1, 2, 3, 4, null, 5, 6, null, null, null, null, 7},
            List.of(1, 2, 4, 3, 5, 6, 7),
            "Mixed depth with sparse nulls"),
        Arguments.of(
            new Integer[] {1, null, 2, 3}, List.of(1, 2, 3), "Right child with left grandchild"),
        Arguments.of(
            new Integer[] {1, 2, null, null, 3, null, 4, null, 5},
            List.of(1, 2, 3, 4, 5),
            "Zigzag pattern"),
        Arguments.of(
            new Integer[] {1, null, 2, 3, null, 4, null, 5},
            List.of(1, 2, 3, 4, 5),
            "Right-heavy zigzag"),
        Arguments.of(
            new Integer[] {1, 2, null, 3, 4, null, null, 5, 6},
            List.of(1, 2, 3, 4, 5, 6),
            "Left subtree with deep right branches"),
        Arguments.of(
            new Integer[] {10, 5, null, 3, null, 7, null, 1},
            List.of(10, 5, 3, 7, 1),
            "Left child with alternating pattern"),
        Arguments.of(
            new Integer[] {1, 2, 3, null, null, null, 4},
            List.of(1, 2, 3, 4),
            "Right child of right child only"),
        Arguments.of(
            new Integer[] {
              1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10
            },
            List.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
            "Very deep left-skewed (10 levels)"),
        Arguments.of(
            new Integer[] {
              1, null, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10
            },
            List.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
            "Very deep right-skewed (10 levels)"),
        Arguments.of(
            new Integer[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
            List.of(1, 2, 4, 8, 9, 5, 10, 11, 3, 6, 12, 13, 7, 14, 15),
            "Complete binary tree depth 3 (15 nodes)"),
        Arguments.of(
            new Integer[] {1, null, null, null, 2}, List.of(1), "Orphaned node after nulls"),
        Arguments.of(
            new Integer[] {1, 2, 3, null, null, null, null, null, null, 4},
            List.of(1, 2, 3),
            "Node far beyond tree structure"));
  }
}
