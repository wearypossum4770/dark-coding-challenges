package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class ThirdMaxTest {
  ThirdMax instance = new ThirdMax();

  @ParameterizedTest
  @MethodSource("dataThirdMax")
  public void testThirdMax(int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataThirdMax() {
    return Stream.of(
        Arguments.of(new int[] {3, 2, 1}, 1),
        Arguments.of(new int[] {1, 2}, 2),
        Arguments.of(new int[] {2, 2, 3, 1}, 1),
        Arguments.of(new int[] {1, 2, 3, 4, 5}, 3),
        Arguments.of(new int[] {5, 4, 3, 2, 1}, 3),
        Arguments.of(new int[] {10, 20, 30, 40}, 20),
        Arguments.of(new int[] {5, 5, 3, 2}, 2),
        Arguments.of(new int[] {1, 2, 2, 3, 3}, 1),
        Arguments.of(new int[] {-1, -2, -3, -4}, -3),
        Arguments.of(new int[] {-10, -20, -30}, -30),
        Arguments.of(new int[] {-10, 0, 10}, -10),
        Arguments.of(new int[] {0, -1, 1, 2}, 0),
        Arguments.of(new int[] {4, 4, 4, 3, 3, 2}, 2),
        Arguments.of(new int[] {-5, -1, -3}, -5),
        Arguments.of(new int[] {-2, -1, 0, 1, 2}, 0));
  }
}
