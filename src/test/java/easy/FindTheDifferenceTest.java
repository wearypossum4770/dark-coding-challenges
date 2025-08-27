package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FindTheDifferenceTest {
  FindTheDifference instance = new FindTheDifference();

  @ParameterizedTest
  @MethodSource("dataFindTheDifference")
  public void testFindTheDifference(String s, String t, char expected) {

    char result = instance.solve(s, t);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataFindTheDifference() {
    return Stream.of(
        Arguments.of("abcd", "abcde", 'e'),
        Arguments.of("", "y", 'y'),
        Arguments.of("a", "aa", 'a'),
        Arguments.of("aabbcc", "aabbccd", 'd'));
  }
}
