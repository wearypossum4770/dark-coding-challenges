package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class StringIntegerIsBalancedTest {
  StringIntegerIsBalanced instance = new StringIntegerIsBalanced();

  @ParameterizedTest
  @MethodSource("dataStringIntegerIsBalanced")
  public void testStringIntegerIsBalanced(String num, boolean expected) {

    boolean result = instance.solve(num);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataStringIntegerIsBalanced() {
    return Stream.of(
        Arguments.of("12", false),
        Arguments.of("11", true),
        Arguments.of("1234", false),
        Arguments.of("24123", true),
        // Edge / special cases
        Arguments.of("00", true),
        Arguments.of("10", false),
        Arguments.of("1010", false),
        Arguments.of("909", false),
        Arguments.of("1234567890", false),
        Arguments.of("111111", true),
        Arguments.of("123321", true),
        Arguments.of("99999999", true),
        Arguments.of("5005", true),
        Arguments.of("1234567", false),
        // Optional out-of-constraint test
        Arguments.of("1", false));
  }
}
