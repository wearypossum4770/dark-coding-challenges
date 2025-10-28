package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FindFirstPalindromeTest {
  FindFirstPalindrome instance = new FindFirstPalindrome();

  @ParameterizedTest
  @MethodSource("dataFindFirstPalindrome")
  public void testFindFirstPalindrome(String[] words, String expected) {

    String result = instance.solve(words);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataFindFirstPalindrome() {
    return Stream.of(
        Arguments.of(new String[] {"abc", "car", "ada", "racecar", "cool"}, "ada"),
        Arguments.of(new String[] {"notapalindrome", "racecar"}, "racecar"),
        Arguments.of(new String[] {"def", "ghi"}, ""));
  }
}
