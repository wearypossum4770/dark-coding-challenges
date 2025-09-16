package easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class RunningArraySumTest {
  RunningArraySum instance = new RunningArraySum();

  @ParameterizedTest
  @MethodSource("dataRunningArraySum")
  public void testRunningArraySum(int[] nums, int[] expected) {

    int[] result = instance.solve(nums);

    assertArrayEquals(expected, result);
  }

  public static Stream<Arguments> dataRunningArraySum() {
    return Stream.of(
        // ✅ Normal case
        Arguments.of(new int[] {1, 2, 3, 4}, new int[] {1, 3, 6, 10}),

        // ✅ All 1s
        Arguments.of(new int[] {1, 1, 1, 1, 1}, new int[] {1, 2, 3, 4, 5}),

        // ✅ Mixed values
        Arguments.of(new int[] {3, 1, 2, 10, 1}, new int[] {3, 4, 6, 16, 17}),

        // 🟢 Edge cases
        // Empty array
        Arguments.of(new int[] {}, new int[] {}),

        // Single element
        Arguments.of(new int[] {5}, new int[] {5}),

        // Negative numbers
        Arguments.of(new int[] {-1, -2, -3}, new int[] {-1, -3, -6}),

        // Large values
        Arguments.of(
            new int[] {Integer.MAX_VALUE, 1}, new int[] {Integer.MAX_VALUE, Integer.MAX_VALUE + 1}),

        // Alternating positives & negatives
        Arguments.of(new int[] {1, -1, 1, -1, 1}, new int[] {1, 0, 1, 0, 1}));
  }
}
