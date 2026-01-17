package medium;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class SmallestTrimmedNumbersTest {
  SmallestTrimmedNumbers instance = new SmallestTrimmedNumbers();

  @ParameterizedTest
  @MethodSource("dataSmallestTrimmedNumbers")
  public void testSmallestTrimmedNumbers(String[] nums, int[][] queries, int[] expected) {

    int[] result = instance.solve(nums, queries);

    assertArrayEquals(expected, result);
  }

  public static Stream<Arguments> dataSmallestTrimmedNumbers() {
    return Stream.of(
        Arguments.of(
            new String[] {"102", "473", "251", "814"},
            new int[][] {{1, 1}, {2, 3}, {4, 2}, {1, 2}},
            new int[] {2, 2, 1, 0}),
        Arguments.of(
            new String[] {"24", "37", "96", "04"}, new int[][] {{2, 1}, {2, 2}}, new int[] {3, 0}),
        Arguments.of(
            new String[] {"000", "000", "000", "000"},
            new int[][] {{1, 1}, {2, 1}, {3, 1}, {4, 1}},
            new int[] {0, 1, 2, 3}),
        Arguments.of(
            new String[] {"0", "0", "0", "0"},
            new int[][] {{1, 1}, {2, 1}, {3, 1}, {4, 1}},
            new int[] {0, 1, 2, 3}),
        Arguments.of(
            new String[] {"123456789", "987654321", "111111111", "000000000"},
            new int[][] {{1, 9}, {2, 9}, {3, 9}, {4, 9}},
            new int[] {3, 2, 0, 1}),
        Arguments.of(
            new String[] {"9", "8", "7", "6", "5", "4", "3", "2", "1", "0"},
            new int[][] {{1, 1}, {5, 1}, {10, 1}},
            new int[] {9, 5, 0}),
        Arguments.of(
            new String[] {"100", "200", "300", "400", "500"},
            new int[][] {{1, 2}, {2, 2}, {3, 2}, {4, 2}, {5, 2}},
            new int[] {0, 1, 2, 3, 4}),
        Arguments.of(
            new String[] {"00100", "00101", "00110", "00111", "01000"},
            new int[][] {{1, 3}, {2, 3}, {3, 3}, {4, 3}, {5, 3}},
            new int[] {4, 0, 1, 2, 3}),
        Arguments.of(
            new String[] {"99999", "99998", "99997", "99996", "99995"},
            new int[][] {{1, 5}, {2, 5}, {3, 5}, {4, 5}, {5, 5}},
            new int[] {4, 3, 2, 1, 0}),
        Arguments.of(
            new String[] {"00001", "00010", "00100", "01000", "10000"},
            new int[][] {{1, 5}, {2, 5}, {3, 5}, {4, 5}, {5, 5}},
            new int[] {0, 1, 2, 3, 4}),
        Arguments.of(
            new String[] {"123", "123", "123", "123", "123"},
            new int[][] {{1, 3}, {2, 3}, {3, 3}, {4, 3}, {5, 3}},
            new int[] {0, 1, 2, 3, 4}),
        Arguments.of(
            new String[] {"000", "001", "002", "010", "100"},
            new int[][] {{1, 3}, {2, 3}, {3, 3}, {4, 3}, {5, 3}},
            new int[] {0, 1, 2, 3, 4}),
        Arguments.of(
            new String[] {"9876543210", "8765432109", "7654321098", "6543210987", "5432109876"},
            new int[][] {{1, 10}, {3, 10}, {5, 10}},
            new int[] {4, 2, 0}),
        Arguments.of(
            new String[] {"1", "10", "100", "1000", "10000"},
            new int[][] {{1, 5}, {2, 5}, {3, 5}, {4, 5}, {5, 5}},
            new int[] {0, 1, 2, 3, 4}),
        Arguments.of(
            new String[] {"999", "998", "997", "996", "995", "994", "993", "992", "991", "990"},
            new int[][] {{1, 3}, {5, 3}, {10, 3}},
            new int[] {9, 5, 0}),
        Arguments.of(
            new String[] {"0000000000", "0000000001", "0000000010", "0000000100", "0000001000"},
            new int[][] {{1, 10}, {2, 10}, {3, 10}, {4, 10}, {5, 10}},
            new int[] {0, 1, 2, 3, 4}),
        Arguments.of(
            new String[] {"1111111111", "2222222222", "3333333333", "4444444444", "5555555555"},
            new int[][] {{1, 10}, {2, 10}, {3, 10}, {4, 10}, {5, 10}},
            new int[] {0, 1, 2, 3, 4}),
        Arguments.of(
            new String[] {"1000000000", "999999999", "999999998", "999999997", "999999996"},
            new int[][] {{1, 10}, {2, 10}, {3, 10}},
            new int[] {0, 4, 3}),
        Arguments.of(
            new String[] {"000", "001", "010", "100", "999"},
            new int[][] {{1, 3}, {2, 3}, {3, 3}, {4, 3}, {5, 3}},
            new int[] {0, 1, 2, 3, 4}),
        Arguments.of(
            new String[] {"000000", "000001", "000010", "000100", "001000", "010000", "100000"},
            new int[][] {{1, 6}, {3, 6}, {5, 6}, {7, 6}},
            new int[] {0, 2, 4, 6}));
  }
}
