package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class NumIdenticalPairsTest {
  NumIdenticalPairs instance = new NumIdenticalPairs();

  @ParameterizedTest
  @MethodSource("dataNumIdenticalPairs")
  public void testNumIdenticalPairs(int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataNumIdenticalPairs() {
    return Stream.of(
        Arguments.of(new int[] {1, 1, 1, 1}, 6),
        Arguments.of(new int[] {1, 2, 3}, 0),
        Arguments.of(new int[] {1, 2, 3, 1, 1, 3}, 4));
  }
}
