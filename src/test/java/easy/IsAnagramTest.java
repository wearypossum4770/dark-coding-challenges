package easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
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

  @ParameterizedTest
  @MethodSource("detectAnagramData")
  public void testDetectAnagram(
      String[] expected, String word, String[] candidates, String criteria) {
    String[] result = instance.detectAnagrams(word, candidates);
    assertArrayEquals(expected, result);
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

  public static Stream<Arguments> detectAnagramData() {
    return Stream.of(
        Arguments.of(
            new String[] {"gallery", "regally", "largely"},
            "allergy",
            new String[] {"gallery", "ballerina", "regally", "clergy", "largely", "leading"},
            "detects three anagrams"),
        Arguments.of(
            new String[] {"inlets"},
            "listen",
            new String[] {"enlists", "google", "inlets", "banana"},
            "detects anagram"),
        Arguments.of(
            new String[] {},
            "good",
            new String[] {"dog", "goody"},
            "does not detect anagram subsets"),
        Arguments.of(
            new String[] {"lemons", "melons"},
            "solemn",
            new String[] {"lemons", "cherry", "melons"},
            "detects two anagrams"),
        Arguments.of(
            new String[] {},
            "diaper",
            new String[] {"hello", "world", "zombies", "pants"},
            "no matches"),
        Arguments.of(
            new String[] {"Eons", "ONES"},
            "nose",
            new String[] {"Eons", "ONES"},
            "detects multiple anagrams with different case"),
        Arguments.of(
            new String[] {},
            "mass",
            new String[] {"last"},
            "does not detect non-anagrams with identical checksum"),
        Arguments.of(
            new String[] {"Carthorse"},
            "Orchestra",
            new String[] {"cashregister", "Carthorse", "radishes"},
            "detects anagrams case-insensitively"),
        Arguments.of(
            new String[] {"carthorse"},
            "Orchestra",
            new String[] {"cashregister", "carthorse", "radishes"},
            "detects anagrams using case-insensitive subject"),
        Arguments.of(
            new String[] {"Carthorse"},
            "orchestra",
            new String[] {"cashregister", "Carthorse", "radishes"},
            "detects anagrams using case-insensitive possible matches"),
        Arguments.of(
            new String[] {},
            "go",
            new String[] {"goGoGO"},
            "does not detect an anagram if the original word is repeated"),
        Arguments.of(
            new String[] {},
            "tapper",
            new String[] {"patter"},
            "anagrams must use all letters exactly once"),
        Arguments.of(
            new String[] {},
            "BANANA",
            new String[] {"BANANA"},
            "words are not anagrams of themselves"),
        Arguments.of(
            new String[] {},
            "BANANA",
            new String[] {"Banana"},
            "words are not anagrams of themselves even if letter case is partially different"),
        Arguments.of(
            new String[] {},
            "BANANA",
            new String[] {"banana"},
            "words are not anagrams of themselves even if letter case is completely different"),
        Arguments.of(
            new String[] {"Silent"},
            "LISTEN",
            new String[] {"LISTEN", "Silent"},
            "words other than themselves can be anagrams"));
  }
}
