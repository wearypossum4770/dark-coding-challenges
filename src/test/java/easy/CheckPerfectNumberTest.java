package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class CheckPerfectNumberTest {
  CheckPerfectNumber instance = new CheckPerfectNumber();

  @ParameterizedTest
  @MethodSource("dataClassifyPerfectNumber")
  public void testClassifyPerfectNumber(String expected, long n) {
    String actual = instance.classifyPerfectNumber(n);
    assertEquals(expected, actual);
  }

  @ParameterizedTest
  @MethodSource("dataCalculatePerfectNumber")
  public void testCalculatePerfectNumber(long n, long expected) {
    long result = instance.calculatePerfectNumber(n);
    assertEquals(expected, result);
  }

  @ParameterizedTest
  @MethodSource("dataCheckPerfectNumber")
  public void testCheckPerfectNumber(String criteria, long n, boolean expected) {

    boolean result = instance.checkPerfectNumber(n);
    System.out.print(criteria);
    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataCheckPerfectNumber() {
    return Stream.of(
        Arguments.of("Perfect number 496", 496, true),
        Arguments.of("Perfect number 8_128", 8128, true),
        Arguments.of("Perfect number 8_589_869_056", 8589869056L, true),
        Arguments.of("Perfect number 137_438_691_328", 137438691328L, true),
        Arguments.of("Smallest perfect number", 6, true),
        Arguments.of("Medium perfect number", 28, true),
        Arguments.of("Large perfect number", 33550336, true),
        Arguments.of("Smallest abundant number", 12, false),
        Arguments.of("Medium abundant number", 30, false),
        Arguments.of("Large abundant number", 33550335, false),
        Arguments.of("Smallest prime deficient number", 2, false),
        Arguments.of("Smallest non-prime deficient number", 4, false),
        Arguments.of("Medium deficient number", 32, false),
        Arguments.of("Large deficient number", 33550337, false));
  }

  public static Stream<Arguments> dataCalculatePerfectNumber() {
    return Stream.of(
        Arguments.of(496, 496),
        Arguments.of(8128, 8128),
        Arguments.of(8589869056L, 8589869056L),
        Arguments.of(137438691328L, 137438691328L),
        Arguments.of(6, 6),
        Arguments.of(28, 28),
        Arguments.of(33550336, 33550336),
        Arguments.of(12, 16),
        Arguments.of(30, 42),
        Arguments.of(33550335, 39885825),
        Arguments.of(2, 1),
        Arguments.of(4, 3),
        Arguments.of(32, 31),
        Arguments.of(33550337, 1));
  }

  public static Stream<Arguments> dataClassifyPerfectNumber() {
    return Stream.of(
        Arguments.of("perfect", 496),
        Arguments.of("perfect", 8128),
        Arguments.of("perfect", 8589869056L),
        Arguments.of("perfect", 137438691328L),
        Arguments.of("perfect", 6),
        Arguments.of("perfect", 28),
        Arguments.of("perfect", 33550336),
        Arguments.of("abundant", 12),
        Arguments.of("abundant", 30),
        Arguments.of("abundant", 33550335),
        Arguments.of("deficient", 2),
        Arguments.of("deficient", 4),
        Arguments.of("deficient", 32),
        Arguments.of("deficient", 33550337));
  }
}
