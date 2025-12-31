package very_easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class SecondLargestTest {
  SecondLargest instance = new SecondLargest();

  @ParameterizedTest
  @MethodSource("dataSecondLargest")
  public void testSecondLargest(int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataSecondLargest() {
    return Stream.of(
        Arguments.of(new int[] {10, 40, 30, 20, 50}, 40),
        Arguments.of(new int[] {25, 143, 89, 13, 105}, 105),
        Arguments.of(new int[] {54, 23, 11, 17, 10}, 23),
        Arguments.of(new int[] {513, 211, 131, 417, 11}, 417),
        Arguments.of(new int[] {63, 44, 11, 22, 33, 66, 65}, 65),
        Arguments.of(new int[] {5, 5, 3}, 3),
        Arguments.of(new int[] {5, 5, 5, 4}, 4),
        Arguments.of(new int[] {1, 2, 2, 1}, 1),
        Arguments.of(new int[] {3, 3, 2, 2, 1}, 2),
        Arguments.of(new int[] {-1, -2, -3}, -2),
        Arguments.of(new int[] {-10, -20, -30, -40}, -20),
        Arguments.of(new int[] {-5, -1, -3}, -3),
        Arguments.of(new int[] {-10, 0, 10}, 0),
        Arguments.of(new int[] {0, -1, 1}, 0),
        Arguments.of(new int[] {-1, -1, 0}, -1));
  }
}
