package easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class PlusOneTest {
  PlusOne instance = new PlusOne();

  @ParameterizedTest
  @MethodSource("dataPlusOne")
  public void testPlusOne(int[] nums, int[] expected) {

    int[] result = instance.solve(nums);

    assertArrayEquals(expected, result);
  }

  public static Stream<Arguments> dataPlusOne() {
    return Stream.of(
        Arguments.of(new int[] {4, 3, 2, 1}, new int[] {4, 3, 2, 2}),
        Arguments.of(new int[] {1, 2, 3}, new int[] {1, 2, 4}),
        Arguments.of(new int[] {9}, new int[] {1, 0}),
        Arguments.of(new int[] {9, 9}, new int[] {1, 0, 0}),
        Arguments.of(new int[] {0}, new int[] {1}),
        Arguments.of(new int[] {5}, new int[] {6}),
        Arguments.of(new int[] {9, 9, 9, 9}, new int[] {1, 0, 0, 0, 0}),
        Arguments.of(new int[] {9, 9, 8}, new int[] {9, 9, 9}),
        Arguments.of(new int[] {1, 0, 0}, new int[] {1, 0, 1}),
        Arguments.of(new int[] {8, 9, 9}, new int[] {9, 0, 0}),
        Arguments.of(new int[] {0, 9}, new int[] {1, 0}),
        Arguments.of(new int[] {1, 9, 9}, new int[] {2, 0, 0}),
        Arguments.of(new int[] {9, 9, 9, 9, 9}, new int[] {1, 0, 0, 0, 0, 0}));
  }
}
