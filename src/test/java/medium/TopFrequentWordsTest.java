package medium;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashSet;
import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class TopFrequentWordsTest {
  TopFrequentWords instance = new TopFrequentWords();

  @ParameterizedTest
  @MethodSource("dataTopFrequentWords")
  public void testTopFrequentWords(String[] words, int k, List<String> expected) {

    List<String> result = instance.solve(words, k);
    HashSet<String> actual = new HashSet<>(result);
    assertEquals(new HashSet<>(expected), actual);
  }

  public static Stream<Arguments> dataTopFrequentWords() {
    return Stream.of(
        Arguments.of(
            new String[] {"i", "love", "leetcode", "i", "love", "coding"}, 2, List.of("i", "love")),
        Arguments.of(
            new String[] {"the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"},
            4,
            List.of("the", "is", "sunny", "day")),
        Arguments.of(new String[] {"hello", "hello", "hello"}, 1, List.of("hello")),
        Arguments.of(new String[] {"a", "b", "c", "d"}, 4, List.of("a", "b", "c", "d")),
        Arguments.of(
            new String[] {"apple", "banana", "apple", "banana", "cherry", "cherry"},
            3,
            List.of("apple", "banana", "cherry")),
        Arguments.of(new String[] {"x", "y", "z"}, 1, List.of("x")),
        Arguments.of(new String[] {}, 0, List.of()),
        Arguments.of(
            new String[] {"a", "aa", "aaa", "a", "aaa", "aaa", "aa", "b", "b", "b"},
            3,
            List.of("aaa", "a", "b")),
        Arguments.of(new String[] {"one", "two"}, 5, List.of("one", "two")));
  }
}
