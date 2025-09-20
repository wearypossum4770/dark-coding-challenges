package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class StringIsSubsequenceTest {
  StringIsSubsequence instance = new StringIsSubsequence();

  @ParameterizedTest
  @MethodSource("dataStringIsSubsequence")
  public void testStringIsSubsequence(String s, String t, boolean expected) {

    boolean result = instance.solve(s, t);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataStringIsSubsequence() {
    return Stream.of(
        Arguments.of("abc", "ahbgdc", true),
        Arguments.of("", "", true),
        Arguments.of("", "anything", true),
        Arguments.of("a", "a", true),
        Arguments.of("a", "b", false),
        Arguments.of("z", "abc", false),
        Arguments.of("acb", "abc", false),
        Arguments.of("xyz", "abcxyz", true),
        Arguments.of("aaa", "aaaaaa", true),
        Arguments.of("aaa", "aa", false),
        Arguments.of("abc", "abc", true),
        Arguments.of("abc", "a" + "x".repeat(9999) + "b" + "y".repeat(9999) + "c", true),
        Arguments.of("ace", "abcde", true),
        Arguments.of("aec", "abcde", false),
        Arguments.of("axc", "ahbgdc", false));
  }
}
