package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FindWordsContainingTest {
  FindWordsContaining instance = new FindWordsContaining();

  @ParameterizedTest
  @MethodSource("dataFindWordsContaining")
  public void testFindWordsContaining(String[] words, char x, int[] expected) {

    List<Integer> result = instance.findWordsContaining(words, x);
    int[] actual = new int[result.size()];
    for (int i = 0; i < result.size(); i++) {
      actual[i] = result.get(i);
    }
    assertArrayEquals(expected, actual);
  }

  public static Stream<Arguments> dataFindWordsContaining() {
    return Stream.of(
        Arguments.of(new String[] {"abc", "bcd", "aaaa", "cbc"}, 'a', new int[] {0, 2}),
        Arguments.of(new String[] {"leet", "code"}, 'e', new int[] {0, 1}),
        Arguments.of(new String[] {"abc", "bcd", "aaaa", "cbc"}, 'z', new int[] {}));
  }
}
