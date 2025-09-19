package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class CanConstructRansomNoteTest {
  CanConstructRansomNote instance = new CanConstructRansomNote();

  @ParameterizedTest
  @MethodSource("dataCanConstructRansomNote")
  public void testCanConstructRansomNote(String ransomNote, String magazine, boolean expected) {

    boolean result = instance.solve(ransomNote, magazine);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataCanConstructRansomNote() {
    return Stream.of(
        Arguments.of("a", "b", false),
        Arguments.of("aa", "aab", true),
        Arguments.of("a", "a", true),
        Arguments.of("aa", "ab", false),
        Arguments.of("abc", "cbad", true),
        Arguments.of("", "anything", true),
        Arguments.of("a", "", false),
        Arguments.of("", "", true),
        Arguments.of("aA", "aa", true),
        Arguments.of("Aa", "aA", true),
        Arguments.of("zzz", "zzzzzz", true),
        Arguments.of("zzzz", "zzz", false),
        Arguments.of("hello world", "dlrow olleh", true));
  }
}
