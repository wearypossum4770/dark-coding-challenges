package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class SumOfMultiplesTest {
  SumOfMultiples instance = new SumOfMultiples();

  @ParameterizedTest
  @MethodSource("dataSumOfMultiples")
  public void testSumOfMultiples(int num, int expected) {

    int result = instance.solve(num);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataSumOfMultiples() {
    return Stream.of(
        Arguments.of(1, 0),
        Arguments.of(2, 0),
        Arguments.of(3, 3),
        Arguments.of(5, 8),
        Arguments.of(7, 21),
        Arguments.of(9, 30),
        Arguments.of(10, 40),
        Arguments.of(12, 52),
        Arguments.of(15, 81),
        Arguments.of(20, 119),
        Arguments.of(21, 140),
        Arguments.of(50, 691),
        Arguments.of(100, 2_838),
        Arguments.of(1_000, 272_066),
        Arguments.of(200, 10_845));
  }
}
