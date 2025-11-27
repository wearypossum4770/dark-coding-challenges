package medium;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class MaximumGapTest {
  MaximumGap instance = new MaximumGap();

  @ParameterizedTest
  @MethodSource("dataMaximumGap")
  public void testMaximumGap(int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataMaximumGap() {
    return Stream.of(
        Arguments.of(new int[] {3, 6, 9, 1}, 3),
        Arguments.of(new int[] {10}, 0),
        Arguments.of(new int[] {1, 100}, 99),
        Arguments.of(new int[] {1, 2, 3, 4, 5}, 1),
        Arguments.of(new int[] {10, 9, 8, 7}, 1),
        Arguments.of(new int[] {7, 7, 7, 7}, 0),
        Arguments.of(new int[] {0, 1_000_000_000}, 1_000_000_000),
        Arguments.of(new int[] {1, 100, 2, 50_000_000}, 49999900),
        Arguments.of(new int[] {1, 1}, 0),
        Arguments.of(new int[] {2, 2, 2, 3}, 1),
        Arguments.of(new int[] {100, 3, 2, 1}, 97),
        Arguments.of(new int[] {1, 3, 1_000, 2_000}, 1_000),
        Arguments.of(new int[] {8, 1, 6, 3, 9}, 3),
        Arguments.of(new int[] {5, 4, 3, 2, 1}, 1),
        Arguments.of(new int[] {1, 2}, 1),
        Arguments.of(new int[] {1_000_000_000, 0, 999_999_999}, 999_999_999),
        Arguments.of(new int[] {1, 4, 7, 13, 20, 21}, 7),
        Arguments.of(new int[] {5, 5, 5, 10}, 5),
        Arguments.of(new int[] {0, 1, 2, 3, 100}, 97),
        Arguments.of(new int[] {100, 200, 300, 1_000}, 700));
  }
}
