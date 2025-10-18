package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FindEvenDigitNumbersTest {
  FindEvenDigitNumbers instance = new FindEvenDigitNumbers();

  @ParameterizedTest
  @MethodSource("dataFindEvenDigitNumbers")
  public void testFindEvenDigitNumbers(int[] nums, int expected) {

    int result = instance.solve(nums);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataFindEvenDigitNumbers() {
    return Stream.of(
        Arguments.of(new int[] {12, 345, 2, 6, 7896}, 2),
        Arguments.of(new int[] {555, 901, 482, 1771}, 1));
  }
}
