package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class DistributeCandiesTest {
  DistributeCandies instance = new DistributeCandies();

  @ParameterizedTest
  @MethodSource("dataDistributeCandies")
  public void testDistributeCandies(String _criteria, int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataDistributeCandies() {
    return Stream.of(
        Arguments.of("3 unique, can eat 3", new int[] {1, 1, 2, 2, 3, 3}, 3),
        Arguments.of("3 unique, can eat 2", new int[] {1, 1, 2, 3}, 2),
        Arguments.of("1 unique, can eat 2 -> only 1 type", new int[] {6, 6, 6, 6}, 1),
        Arguments.of("6 unique, can eat 3", new int[] {1, 2, 3, 4, 5, 6}, 3),
        Arguments.of("1 unique", new int[] {1, 1}, 1),
        Arguments.of("no candies can't eay any", new int[] {}, 0),
        Arguments.of("<constraint non-conforming> 1 unique, 1 count cannot eat", new int[] {1}, 0),
        Arguments.of("2 unique, can eat 1", new int[] {1, 2}, 1));
  }
}
