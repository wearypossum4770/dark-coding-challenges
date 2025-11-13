package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class MostCommonSafeWordTest {
  MostCommonSafeWord instance = new MostCommonSafeWord();

  @ParameterizedTest
  @MethodSource("dataMostCommonSafeWord")
  public void testMostCommonSafeWord(String paragraph, String[] banned, String expected) {

    String result = instance.solve(paragraph, banned);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataMostCommonSafeWord() {
    return Stream.of(
        Arguments.of(
            "Bob hit a ball, the hit BALL flew far after it was hit.",
            new String[] {"hit"},
            "ball"),
        Arguments.of("Hello hello world!", new String[] {"world"}, "hello"),
        Arguments.of("apple banana banana apple apple", new String[] {}, "apple"),
        Arguments.of("dog cat dog", new String[] {"dog", "cat"}, ""),
        Arguments.of("one two two three three", new String[] {}, "two"),
        Arguments.of("", new String[] {}, ""),
        Arguments.of("Wow! Such, wow? Very-wow.", new String[] {"such"}, "wow"),
        Arguments.of("test test test", new String[] {"test"}, ""),
        Arguments.of("123 123 !@#", new String[] {}, ""),
        Arguments.of("echo echo echo echo", new String[] {}, "echo"));
  }
}
