package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class ReverseVowelsTest {
  ReverseVowels instance = new ReverseVowels();

  @ParameterizedTest
  @MethodSource("dataReverseVowels")
  public void testReverseVowels(String s, String expected) {

    String result = instance.solve(s);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataReverseVowels() {
    return Stream.of(
        Arguments.of("IceCreAm", "AceCreIm"),
        Arguments.of("leetcode", "leotcede"),
        Arguments.of("a", "a"),
        Arguments.of("b", "b"),
        Arguments.of("AEIOU", "UOIEA"),
        Arguments.of("aeiou", "uoiea"),
        Arguments.of("bcdfgh", "bcdfgh"),
        Arguments.of("aA", "Aa"),
        Arguments.of("a.b,e", "e.b,a"),
        Arguments.of("hello world", "hollo werld"),
        Arguments.of("aEiOu", "uOiEa"),
        Arguments.of(".,?!", ".,?!"),
        Arguments.of("aaaaaa", "aaaaaa"),
        Arguments.of("aAaaAa", "aAaaAa"));
  }
}
