package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class DifferenceOfSumsTest {
  DifferenceOfSums instance = new DifferenceOfSums();

  @ParameterizedTest
  @MethodSource("dataDifferenceOfSums")
  public void testDifferenceOfSums(int n, int m, int expected) {

    int result = instance.solve(n, m);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataDifferenceOfSums() {
    return Stream.of(Arguments.of(10, 3, 19), Arguments.of(5, 6, 15), Arguments.of(5, 1, -15));
  }
}
