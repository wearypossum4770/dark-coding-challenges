package medium;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class ArrayStackTest {
  ArrayStack instance = new ArrayStack();

  @ParameterizedTest
  @MethodSource("dataArrayStack")
  public void testArrayStack(int[] target, int n, List<String> expected) {

    List<String> result = instance.solve(target, n);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataArrayStack() {
    return Stream.of(
        Arguments.of(new int[] {1, 3}, 3, List.of("Push", "Push", "Pop", "Push")),
        Arguments.of(new int[] {1, 2, 3}, 3, List.of("Push", "Push", "Push")),
        Arguments.of(new int[] {1, 2}, 4, List.of("Push", "Push")),
        Arguments.of(new int[] {1}, 1, List.of("Push")),
        Arguments.of(new int[] {1}, 100, List.of("Push")),
        Arguments.of(new int[] {2}, 2, List.of("Push", "Pop", "Push")),
        Arguments.of(new int[] {3}, 3, List.of("Push", "Pop", "Push", "Pop", "Push")),
        Arguments.of(new int[] {2, 3, 4}, 4, List.of("Push", "Pop", "Push", "Push", "Push")),
        Arguments.of(
            new int[] {1, 3, 5, 7},
            7,
            List.of("Push", "Push", "Pop", "Push", "Push", "Pop", "Push", "Push", "Pop", "Push")),
        Arguments.of(
            new int[] {5},
            5,
            List.of("Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Pop", "Push")),
        Arguments.of(
            new int[] {4, 5},
            5,
            List.of("Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Push")),
        Arguments.of(new int[] {1, 2, 4}, 4, List.of("Push", "Push", "Push", "Pop", "Push")));
  }
}
