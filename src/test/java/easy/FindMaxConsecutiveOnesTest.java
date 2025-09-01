package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FindMaxConsecutiveOnesTest {
  FindMaxConsecutiveOnes instance = new FindMaxConsecutiveOnes();

  @ParameterizedTest
  @MethodSource("dataFindMaxConsecutiveOnes")
  public void testFindMaxConsecutiveOnes(int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataFindMaxConsecutiveOnes() {
    return Stream.of(
        Arguments.of(new int[] {1, 1, 0, 1, 1, 1}, 3),
        Arguments.of(new int[] {1, 0, 1, 1, 0, 1}, 2),
        Arguments.of(new int[] {0}, 0),
        Arguments.of(new int[] {1}, 1),
        Arguments.of(new int[] {1, 1, 1, 1}, 4));
  }
}
