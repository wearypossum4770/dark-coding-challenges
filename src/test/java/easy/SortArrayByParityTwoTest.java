package easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class SortArrayByParityTwoTest {
  SortArrayByParityTwo instance = new SortArrayByParityTwo();

  @ParameterizedTest
  @MethodSource("dataSortArrayByParityTwo")
  public void testSortArrayByParityTwo(int[] nums, int[] expected) {

    int[] result = instance.solve(nums);

    assertArrayEquals(expected, result);
  }

  public static Stream<Arguments> dataSortArrayByParityTwo() {
    return Stream.of(
        Arguments.of(new int[] {4, 2, 5, 7}, new int[] {4, 5, 2, 7}),
        Arguments.of(new int[] {2, 3}, new int[] {2, 3}));
  }
}
