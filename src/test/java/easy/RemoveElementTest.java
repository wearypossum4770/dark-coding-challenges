package easy;

import java.util.Arrays;
import java.util.Optional;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class RemoveElementTest {
  RemoveElement instance = new RemoveElement();

  @ParameterizedTest
  @MethodSource("removeElementData")
  public void testRemoveElement(int[] nums, int val, int expected, int[] output) {
    int result = instance.removeElement(nums, val);
    assertEquals(expected, result);
    assertArrayEquals(Arrays.copyOfRange(nums, 0, result), output);
  }
  @ParameterizedTest
  @MethodSource("removeElementOptionalData")
  public void testRemoveOptionalElement(Optional<Integer>[] nums, Integer val, int expected) {
    int result = instance.removeOptionalElement(nums, val);
    assertEquals(expected, result);
  }


  public static Stream<Arguments> removeElementData() {
    return Stream.of(
      Arguments.of(new int[]{3, 2, 2, 3}, 3, 2, new int[]{ 2, 2}),
      Arguments.of(new int[]{0, 1, 2, 2, 3, 0, 4, 2}, 2, 5, new int[]{0,1,3,0,4})
    );
  }
  public static Stream<Arguments> removeElementOptionalData() {
    return Stream.of(
        Arguments.of(optionalArrayOf(3, 2, 2, 3), 3, 2),
        Arguments.of(optionalArrayOf(0, 1, 2, 2, 3, 0, 4, 2), 2, 5));
  }

  @SafeVarargs
  private static Optional<Integer>[] optionalArrayOf(Integer... values) {
    @SuppressWarnings("unchecked")
    Optional<Integer>[] arr = new Optional[values.length];
    for (int i = 0; i < values.length; i++) {
      arr[i] = Optional.ofNullable(values[i]);
    }
    return arr;
  }
}
