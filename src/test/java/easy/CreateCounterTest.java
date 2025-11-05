package easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

import java.util.function.Supplier;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class CreateCounterTest {
  @ParameterizedTest
  @MethodSource("dataCreateCounter")
  public void testCreateCounter(int n, String[] operations, int[] expected) {

    Supplier<Integer> counter = CreateCounter.createCounter(n);
    int[] actual = new int[operations.length];
    for (int i = 0; i < operations.length; i++) {
      CreateCounter.closureCapture(actual, i, counter);
    }
    assertArrayEquals(expected, actual);
  }

  public static Stream<Arguments> dataCreateCounter() {
    return Stream.of(
        Arguments.of(10, new String[] {"call", "call", "call"}, new int[] {10, 11, 12}),
        Arguments.of(
            -2, new String[] {"call", "call", "call", "call", "call"}, new int[] {-2, -1, 0, 1, 2}),
        Arguments.of(0, new String[] {}, new int[] {}),
        Arguments.of(1000, new String[] {"call"}, new int[] {1000}),
        Arguments.of(0, new String[] {"call"}, new int[] {0}),
        Arguments.of(0, new String[] {}, new int[] {}),
        Arguments.of(999, new String[] {"call", "call", "call"}, new int[] {999, 1000, 1001}),
        Arguments.of(-1_000, new String[] {"call", "call"}, new int[] {-1000, -999}),
        Arguments.of(
            3,
            new String[] {
              "call", "call", "call", "call", "call", "call", "call", "call", "call", "call"
            },
            new int[] {3, 4, 5, 6, 7, 8, 9, 10, 11, 12}),
        Arguments.of(
            42,
            new String[] {
              "call", "call", "call", "call", "call", "call", "call", "call", "call", "call",
              "call", "call", "call", "call", "call", "call", "call", "call", "call", "call"
            },
            new int[] {
              42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61
            }),
        Arguments.of(
            5,
            CreateCounter.stringArrayOf("call", 1_000),
            CreateCounter.intArrayFromRange(1_000, 5)),
        Arguments.of(7, new String[] {"call"}, new int[] {7}),
        Arguments.of(
            100,
            new String[] {"call", "call", "call", "call", "call"},
            new int[] {100, 101, 102, 103, 104}),
        Arguments.of(-1000, new String[] {"call", "call", "call"}, new int[] {-1000, -999, -998}));
  }
}
