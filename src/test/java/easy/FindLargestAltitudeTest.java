package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FindLargestAltitudeTest {
  FindLargestAltitude instance = new FindLargestAltitude();

  @ParameterizedTest
  @MethodSource("dataFindLargestAltitude")
  public void testFindLargestAltitude(int[] gain, int expected) {

    int result = instance.solve(gain);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataFindLargestAltitude() {
    return Stream.of(
        Arguments.of(new int[] {-5, 1, 5, 0, -7}, 1),
        Arguments.of(new int[] {-4, -3, -2, -1, 4, 3, 2}, 0),
        Arguments.of(new int[] {0}, 0),
        Arguments.of(new int[] {100}, 100),
        Arguments.of(new int[] {-100}, 0),
        Arguments.of(new int[] {1}, 1),
        Arguments.of(new int[] {0, 0, 0, 0}, 0),
        Arguments.of(new int[] {1, 2, 3, 4, 5}, 15),
        Arguments.of(new int[] {-1, -2, -3, -4, -5}, 0),
        Arguments.of(new int[] {5, 5, 5, 5}, 20),
        Arguments.of(new int[] {-5, -5, -5, -5}, 0),
        Arguments.of(new int[] {10, -20, 10}, 10),
        Arguments.of(new int[] {1, 1, 1, 1, -100}, 4),
        Arguments.of(new int[] {-100, 1, 1, 1, 1}, 0),
        Arguments.of(new int[] {50, -100, 50, -100, 50}, 50),
        Arguments.of(new int[] {100, -100, -100, -100}, 100),
        Arguments.of(new int[] {-1, -1, -1, 1, 1}, 0),
        Arguments.of(new int[] {1, -1, 1, -1, 1, -1}, 1),
        Arguments.of(new int[] {1, 1, 1, 1, 1}, 5),
        Arguments.of(new int[] {-100}, 0),
        Arguments.of(new int[] {100}, 100),);
  }
}
