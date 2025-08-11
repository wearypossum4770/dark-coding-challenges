package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class SingleNumberTest {
  SingleNumber instance = new SingleNumber();

  @ParameterizedTest
  @MethodSource("dataSingleNumber")
  public void testSingleNumber(int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataSingleNumber() {
    return Stream.of(
        Arguments.of(new int[] {2, 2, 1}, 1),
        Arguments.of(new int[] {4, 1, 2, 1, 2}, 4),
        Arguments.of(new int[] {1}, 1));
  }
}
