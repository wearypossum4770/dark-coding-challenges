package easy;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class RemoveArrayDuplicatesTest {
  RemoveArrayDuplicates instance = new RemoveArrayDuplicates();

  @ParameterizedTest
  @MethodSource("removeArrayDuplicateData")
  public void testRemoveArrayDuplicates(int[] nums, int expected, int[] mutated) {
    int result = instance.solve(nums);
    assertEquals(expected, result);
  }

  @ParameterizedTest
  @MethodSource("interviewBit")
  public void testInterviewBit(ArrayList<Integer> nums, int expected) {
    int result = instance.removeDuplicates(nums);
    assertEquals(expected, result);
  }

  public static Stream<Arguments> interviewBit() {
    return Stream.of(
        Arguments.of(new ArrayList<>(Arrays.asList(1, 1, 2)), 2),
        Arguments.of(new ArrayList<>(Arrays.asList(1, 2, 2, 3, 3)), 3),
        Arguments.of(new ArrayList<>(Arrays.asList(0)), 1),
        Arguments.of(new ArrayList<>(Arrays.asList(1, 1, 2, 2, 3, 3, 4)), 4));
  }

  public static Stream<Arguments> removeArrayDuplicateData() {
    return Stream.of(
        Arguments.of(new int[] {1, 1, 2}, 2, new int[] {1, 2}),
        Arguments.of(new int[] {0, 0, 1, 1, 1, 2, 2, 3, 3, 4}, 5, new int[] {0, 1, 2, 3, 4}),
        Arguments.of(new int[] {1}, 1, new int[] {1}),
        Arguments.of(new int[] {-100, -100, -50, -50, 0, 0, 100}, 4, new int[] {-100, -50, 0, 100}),
        Arguments.of(new int[] {1, 1, 1, 1, 1}, 1, new int[] {1}),
        Arguments.of(new int[] {1, 2, 3, 4, 5}, 5, new int[] {1, 2, 3, 4, 5}),
        Arguments.of(new int[] {-100, -100, -100, 100, 100}, 2, new int[] {-100, 100}),
        Arguments.of(new int[] {0}, 1, new int[] {0}));
  }
}
