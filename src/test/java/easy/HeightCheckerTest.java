package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class HeightCheckerTest {
  HeightChecker instance = new HeightChecker();

  @ParameterizedTest
  @MethodSource("dataHeightChecker")
  public void testHeightChecker(int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataHeightChecker() {
    return Stream.of(
        Arguments.of(new int[] {1, 1, 4, 2, 1, 3}, 3),
        Arguments.of(new int[] {5, 1, 2, 3, 4}, 5),
        Arguments.of(new int[] {1, 2, 3, 4, 5}, 0),
        Arguments.of(
            new int[] {10, 6, 6, 10, 10, 9, 8, 8, 3, 3, 8, 2, 1, 5, 1, 9, 5, 2, 7, 4, 7, 7}, 22),
        Arguments.of(new int[] {1}, 0),
        Arguments.of(new int[] {7, 7, 7, 7, 7, 7, 7, 7, 7, 7}, 0),
        Arguments.of(new int[] {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, 0),
        Arguments.of(new int[] {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}, 10),
        Arguments.of(new int[] {2, 3, 1, 2, 3, 1}, 4),
        Arguments.of(
            new int[] {
              100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
              100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
              100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
              100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
              100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,
              100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
            },
            0));
  }
}
