package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class MergeSortedArrayTest {
  MergeSortedArray instance = new MergeSortedArray();

  @ParameterizedTest
  @MethodSource("dataMergeSortedArray")
  public void testMergeSortedArray(
      int[] first, int firstSize, int[] second, int secondSize, int[] expected) {

    int[] result = instance.solve(first, firstSize, second, secondSize);

    assertArrayEquals(expected, result);
  }

  @ParameterizedTest
  @MethodSource("dataMergeSortedArray")
  public void testMergeSortedArrayInPlace( int[] first, int firstSize, int[] second, int secondSize, int[] expected) {
    instance.mergeSortedArrayInPlace(first, firstSize, second, secondSize);
    assertArrayEquals(expected, first);
  }

  public static Stream<Arguments> dataMergeSortedArray() {
    return Stream.of(
        Arguments.of(
            new int[] {1, 2, 3, 0, 0, 0}, 3, new int[] {2, 5, 6}, 3, new int[] {1, 2, 2, 3, 5, 6}),
        Arguments.of(new int[]{0}, 0, new int[]{1}, 1, new int[]{1}),
        Arguments.of(new int[] {1}, 1, new int[] {}, 0, new int[] {1}));
  }
}
