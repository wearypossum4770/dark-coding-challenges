package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class BackspaceCompareTest {
  BackspaceCompare instance = new BackspaceCompare();

  @ParameterizedTest
  @MethodSource("dataBackspaceCompare")
  public void testBackspaceCompare(String s, String t, boolean expected) {

    boolean result = instance.solve(s, t);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataBackspaceCompare() {
    return Stream.of(
        Arguments.of("y#fo##f", "y#f#o##f", true),
        Arguments.of("ab#c", "ad#c", true),
        Arguments.of("ab##", "c#d#", true),
        Arguments.of("a#c", "b", false),
        Arguments.of("a", "a", true),
        Arguments.of("a", "b", false),
        Arguments.of("#", "#", true),
        Arguments.of("#a", "a", true),
        Arguments.of("a#", "", true),
        Arguments.of("a#", "#", true),
        Arguments.of("##", "#", true),
        Arguments.of("###", "##", true),
        Arguments.of("a##", "#", true),
        Arguments.of("a##", "", true),
        Arguments.of("a#b", "b", true),
        Arguments.of("a#b", "a", false),
        Arguments.of("abc", "abc", true),
        Arguments.of("abc", "abd", false),
        Arguments.of("ab#c", "ab#c", true),
        Arguments.of("ab##c", "c", true),
        Arguments.of("a#b#c#", "", true),
        Arguments.of("a#b#c#d", "d", true),
        Arguments.of("a#b#c#d", "e", false),
        Arguments.of("#a#b#", "", true),
        Arguments.of("bxj##tw", "bxj##tw", true),
        Arguments.of("bxj##tw", "bxk##tw", true),
        Arguments.of("xywrrmp", "xywrrmu", false),
        Arguments.of("xywrrmp", "xywrrmp", true),
        Arguments.of("a###b", "b", true),
        Arguments.of("a###b", "a", false),
        Arguments.of("####", "", true),
        Arguments.of("####", "####", true),
        Arguments.of("a####", "#", true),
        Arguments.of("ab####", "##", true),
        Arguments.of("nzp#o#g", "b#nzp#o#g", true),
        Arguments.of("bbbextm", "bbb#extm", false),
        Arguments.of("ab#c#", "a", true),
        Arguments.of("a#a#a#", "", true),
        Arguments.of("abc##", "a", true),
        Arguments.of("abc###", "", true),
        Arguments.of("", "#", true),
        Arguments.of("#", "", true));
  }
}
