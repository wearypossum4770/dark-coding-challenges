package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FindContentChildrenTest {
  FindContentChildren instance = new FindContentChildren();

  @ParameterizedTest
  @MethodSource("findContentChildrenData")
  public void testFindContentChildren(int[] children, int[] cookies, int expected) {

    int result = instance.solve(children, cookies);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> findContentChildrenData() {
    return Stream.of(
        Arguments.of(new int[] {1, 2, 3}, new int[] {1, 1}, 1),
        Arguments.of(new int[] {1, 2}, new int[] {1, 2, 3}, 2),
        Arguments.of(new int[] {10, 9, 8, 7}, new int[] {5, 6, 7, 8}, 2),
        Arguments.of(new int[] {}, new int[] {1, 2}, 0),
        Arguments.of(new int[] {1, 2}, new int[] {}, 0));
  }
}
