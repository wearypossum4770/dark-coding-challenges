package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FindLuckyTest {
  FindLucky instance = new FindLucky();

  @ParameterizedTest
  @MethodSource("dataFindLucky")
  public void testFindLucky(int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataFindLucky() {
    return Stream.of(
        Arguments.of(new int[] {2, 2, 3, 4}, 2),
        Arguments.of(new int[] {1, 2, 2, 3, 3, 3}, 3),
        Arguments.of(new int[] {2, 2, 2, 3, 3}, -1));
  }
}
