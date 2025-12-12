package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class TimeRequiredToBuyTest {
  TimeRequiredToBuy instance = new TimeRequiredToBuy();

  @ParameterizedTest
  @MethodSource("dataTimeRequiredToBuy")
  public void testTimeRequiredToBuy(int[] tickets, int k, int expected) {

    int result = instance.solve(tickets, k);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataTimeRequiredToBuy() {
    return Stream.of(
        Arguments.of(new int[] {2, 3, 2}, 2, 6),
        Arguments.of(new int[] {5, 1, 1, 1}, 0, 8),
        Arguments.of(new int[] {1}, 0, 1),
        Arguments.of(new int[] {1, 1, 1, 1}, 3, 4),
        Arguments.of(new int[] {3, 3, 3}, 0, 7),
        Arguments.of(new int[] {3, 3, 3}, 1, 8),
        Arguments.of(new int[] {3, 3, 3}, 2, 9),
        Arguments.of(new int[] {1, 2, 3, 4}, 3, 10),
        Arguments.of(new int[] {4, 3, 2, 1}, 0, 10),
        Arguments.of(new int[] {4, 3, 2, 1}, 1, 9),
        Arguments.of(new int[] {4, 3, 2, 1}, 2, 7),
        Arguments.of(new int[] {4, 3, 2, 1}, 3, 4),
        Arguments.of(new int[] {100, 100, 100}, 1, 299),
        Arguments.of(new int[] {1, 100, 1}, 1, 102),
        Arguments.of(new int[] {2, 1}, 1, 2),
        Arguments.of(new int[] {2, 1}, 0, 3),
        Arguments.of(new int[] {1, 2}, 0, 1),
        Arguments.of(new int[] {1, 2}, 1, 3));
  }
}
