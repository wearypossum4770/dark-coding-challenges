package easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class RemoveDuplicateZerosTest {
  RemoveDuplicateZeros instance = new RemoveDuplicateZeros();

  @ParameterizedTest
  @MethodSource("dataRemoveDuplicateZeros")
  public void testRemoveDuplicateZeros(int[] nums, int[] expected) {

    instance.solve(nums);

    assertArrayEquals(nums, expected);
  }

  public static Stream<Arguments> dataRemoveDuplicateZeros() {
    return Stream.of(
        Arguments.of(new int[] {1, 0, 2, 3, 0, 4, 5, 0}, new int[] {1, 0, 0, 2, 3, 0, 0, 4}),
        Arguments.of(new int[] {1, 2, 3}, new int[] {1, 2, 3}),
        Arguments.of(new int[] {0, 1, 0, 2, 0, 3}, new int[] {0, 0, 1, 0, 0, 2}),
        Arguments.of(new int[] {0, 0, 0}, new int[] {0, 0, 0}),
        Arguments.of(new int[] {1, 0, 0, 2}, new int[] {1, 0, 0, 0}),
        Arguments.of(new int[] {0}, new int[] {0}),
        Arguments.of(new int[] {7}, new int[] {7}));
  }
}
