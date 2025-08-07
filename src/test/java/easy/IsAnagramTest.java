package easy;

import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class IsAnagramTest {
  IsAnagram instance = new IsAnagram();

  @ParameterizedTest
  @MethodSource("isAnagramData")
  public void testIsAnagram(String s, String t, boolean expected) {
    boolean result = instance.solve(s, t);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> isAnagramData() {
    return Stream.of(
        Arguments.of("listen", "silent", true),
        Arguments.of("evil", "vile", true),
        Arguments.of("race", "care", true),
        Arguments.of("anagram", "nagaram", true),
        Arguments.of("listen", "silent", true),
        Arguments.of("triangle", "integral", true),
        Arguments.of("apple", "pale", false),
        Arguments.of("aacc", "ccac", false),
        Arguments.of("", "", true),
        Arguments.of("a", "a", true),
        Arguments.of("a", "b", false),
        Arguments.of("aaaaa", "aaaaa", true),
        Arguments.of("abcd", "abdc", true));
  }
}
