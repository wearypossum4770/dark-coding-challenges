package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class MajorityElementTest {
  MajorityElement instance = new MajorityElement();

  @ParameterizedTest
  @MethodSource("majorityElementData")
  public void testMajorityElement(int[] nums, int expected) {
    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> majorityElementData() {
    return Stream.of(
        Arguments.of(new int[] {2, 1, 2}, 2),
        Arguments.of(new int[] {100}, 100),
        Arguments.of(new int[] {2, 1, 1}, 1),
        Arguments.of(new int[] {3, 2, 3}, 3),
        Arguments.of(new int[] {2, 2, 1, 1, 1, 2, 2}, 2));
  }
}
