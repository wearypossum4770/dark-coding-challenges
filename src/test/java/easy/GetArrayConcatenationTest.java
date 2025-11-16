package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class GetArrayConcatenationTest {
  GetArrayConcatenation instance = new GetArrayConcatenation();

  @ParameterizedTest
  @MethodSource("dataGetArrayConcatenation")
  public void testGetArrayConcatenation(int[] nums, int[] expected) {

    int[] result = instance.solve(nums);

    assertArrayEquals(expected, result);
  }

  public static Stream<Arguments> dataGetArrayConcatenation() {
    return Stream.of(
        Arguments.of(new int[] {1, 2, 1}, new int[] {1, 2, 1, 1, 2, 1}),
        Arguments.of(new int[] {1, 3, 2, 1}, new int[] {1, 3, 2, 1, 1, 3, 2, 1}),
        Arguments.of(new int[] {1}, new int[] {1, 1}),
        Arguments.of(new int[] {1000}, new int[] {1000, 1000}),
        Arguments.of(new int[] {1, 1, 1}, new int[] {1, 1, 1, 1, 1, 1}),
        Arguments.of(new int[] {2, 4, 6}, new int[] {2, 4, 6, 2, 4, 6}),
        Arguments.of(new int[] {5, 10}, new int[] {5, 10, 5, 10}),
        Arguments.of(new int[] {0, 1, 0}, new int[] {0, 1, 0, 0, 1, 0}),
        Arguments.of(new int[] {1, 2, 3, 2, 1}, new int[] {1, 2, 3, 2, 1, 1, 2, 3, 2, 1}));
  }
}
