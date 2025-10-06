package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class PascalsTriangleTest {
  PascalsTriangle instance = new PascalsTriangle();

  @ParameterizedTest
  @MethodSource("dataPascalsTriangle")
  public void testPascalsTriangle(int nums, List<List<Integer>> expected) {

    List<List<Integer>> result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataPascalsTriangle() {
    return Stream.of(
        Arguments.of(1, List.of(List.of(1))),
        Arguments.of(2, List.of(List.of(1), List.of(1, 1))),
        Arguments.of(3, List.of(List.of(1), List.of(1, 1), List.of(1, 2, 1))),
        Arguments.of(4, List.of(List.of(1), List.of(1, 1), List.of(1, 2, 1), List.of(1, 3, 3, 1))),
        Arguments.of(
            5,
            List.of(
                List.of(1),
                List.of(1, 1),
                List.of(1, 2, 1),
                List.of(1, 3, 3, 1),
                List.of(1, 4, 6, 4, 1))),
        Arguments.of(
            6,
            List.of(
                List.of(1),
                List.of(1, 1),
                List.of(1, 2, 1),
                List.of(1, 3, 3, 1),
                List.of(1, 4, 6, 4, 1),
                List.of(1, 5, 10, 10, 5, 1))));
  }
}
