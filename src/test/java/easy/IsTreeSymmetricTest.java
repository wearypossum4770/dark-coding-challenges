package easy;

import static org.junit.jupiter.api.Assertions.*;

import helpers.TreeNode;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class IsTreeSymmetricTest {
  IsTreeSymmetric<Integer> instance = new IsTreeSymmetric<>();

  @ParameterizedTest
  @MethodSource("dataIsTreeSymmetric")
  public void testIsTreeSymmetric(Integer[] nums, boolean expected) {
    TreeNode<Integer> root = TreeNode.fromIntegerArray(nums);
    boolean result = instance.solve(root);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataIsTreeSymmetric() {
    return Stream.of(
        Arguments.of(new Integer[] {1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5}, true),
        Arguments.of(new Integer[] {1, 2, 2, 3, 4, 4, 3}, true),
        Arguments.of(new Integer[] {}, true),
        Arguments.of(new Integer[] {1}, true),
        Arguments.of(new Integer[] {1, 2, 2}, true),
        Arguments.of(new Integer[] {1, 2, 3}, false),
        Arguments.of(new Integer[] {1, 2, 2, 3, 4, 4, 3}, true),
        Arguments.of(new Integer[] {1, 2, 2, 3, 4, 4, 5}, false),
        Arguments.of(new Integer[] {1, 2, 2, 3, null, null, 3}, true),
        Arguments.of(new Integer[] {1, 2, 2, null, 3, null, 3}, false),
        Arguments.of(new Integer[] {1, 2, 2, 3, 3, null, null}, false),
        Arguments.of(new Integer[] {1, null, null}, true),
        Arguments.of(new Integer[] {1, 2, null}, false),
        Arguments.of(new Integer[] {1, null, 2}, false),
        Arguments.of(new Integer[] {1, 2, 2, 3, 4, null, 4, 5, 6, null, null, 6, 5}, false),
        Arguments.of(new Integer[] {1, 2, 2, 3, 4, null, 4, 5, 6, null, null, 7, 5}, false),
        Arguments.of(new Integer[] {0}, true),
        Arguments.of(new Integer[] {0, 0, 0}, true),
        Arguments.of(new Integer[] {0, 0, 1}, false),
        Arguments.of(new Integer[] {1, 2, 2, 2, 2, 2, 2}, true),
        Arguments.of(new Integer[] {1, 2, 3, 4, 5, 6, 7}, false),
        Arguments.of(new Integer[] {1, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4}, true),
        Arguments.of(new Integer[] {5, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2}, true),
        Arguments.of(new Integer[] {1, 2, null, 3, null, null, null}, false),
        Arguments.of(new Integer[] {1, null, null, null, null, null, null}, true),
        Arguments.of(new Integer[] {2, 3, 3, 4, 5, 5, 4, 6, 7, 8, 8, 7, 6}, false),
        Arguments.of(new Integer[] {1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5}, true),
        Arguments.of(new Integer[] {1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 6}, false),
        Arguments.of(new Integer[] {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, true));
  }
}
