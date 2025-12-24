package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class DetectCapitalUseTest {
  DetectCapitalUse instance = new DetectCapitalUse();

  @ParameterizedTest
  @MethodSource("dataDetectCapitalUse")
  public void testDetectCapitalUse(String word, boolean expected) {

    boolean result = instance.solve(word);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataDetectCapitalUse() {
    return Stream.of(
        Arguments.of("USA", true),
        Arguments.of("leetcode", true),
        Arguments.of("Google", true),
        Arguments.of("FlaG", false),
        Arguments.of("g", true),
        Arguments.of("G", true),
        Arguments.of("LeetCode", false),
        Arguments.of("aPPle", false),
        Arguments.of("APPLE", true),
        Arguments.of("apple", true),
        Arguments.of("Apple", true),
        Arguments.of("AppLe", false),
        Arguments.of("zZZ", false),
        Arguments.of("HELlo", false),
        Arguments.of("qwerty", true),
        Arguments.of("Qwerty", true),
        Arguments.of("QWERTY", true),
        Arguments.of("QwErTy", false),
        Arguments.of("UsA", false),
        Arguments.of("Abcdefg", true),
        Arguments.of("abcdEfg", false));
  }
}
