package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class IsPangramTest {
  IsPangram instance = new IsPangram();

  @ParameterizedTest
  @MethodSource("pangramTestData")
  public void testIsPangram(String criteria, boolean expected, String text) {
    boolean result = instance.solve(text);
    assertEquals(expected, result);
  }

  public static Stream<Arguments> pangramTestData() {
    return Stream.of(
        Arguments.of("empty sentence", false, ""),
        Arguments.of("perfect lower case", true, "abcdefghijklmnopqrstuvwxyz"),
        Arguments.of("only lower case", true, "the quick brown fox jumps over the lazy dog"),
        Arguments.of(
            "missing the letter 'x'",
            false,
            "a quick movement of the enemy will jeopardize five gunboats"),
        Arguments.of("missing the letter 'h'", false, "five boxing wizards jump quickly at it"),
        Arguments.of("with underscores", true, "the_quick_brown_fox_jumps_over_the_lazy_dog"),
        Arguments.of("with numbers", true, "the 1 quick brown fox jumps over the 2 lazy dogs"),
        Arguments.of(
            "missing letters replaced by numbers",
            false,
            "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"),
        Arguments.of(
            "mixed case and punctuation", true, "\"Five quacking Zephyrs jolt my wax bed.\""),
        Arguments.of(
            "a-m and A-M are 26 different characters but not a pangram",
            false,
            "abcdefghijklm ABCDEFGHIJKLM"),
        Arguments.of(
            "non-alphanumeric printable ASCII", false, " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"));
  }
}
