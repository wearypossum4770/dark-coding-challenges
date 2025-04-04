package easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class ReverseStringTest {
  ReverseString instance = new ReverseString();

  @ParameterizedTest
  @MethodSource("reverseStringData")
  public void testReverseString(char[] input, char[] expected) {

    instance.solve(input);

    assertArrayEquals(expected, input);
  }

  public static Stream<Arguments> reverseStringData() {
    return Stream.of(
        Arguments.of(new char[] {'h', 'e', 'l', 'l', 'o'}, new char[] {'o', 'l', 'l', 'e', 'h'}),
        Arguments.of(new char[] {'a', 'b', 'c', 'd'}, new char[] {'d', 'c', 'b', 'a'}),
        Arguments.of(new char[] {'z'}, new char[] {'z'}),
        Arguments.of(new char[] {}, new char[] {}));
  }
}
