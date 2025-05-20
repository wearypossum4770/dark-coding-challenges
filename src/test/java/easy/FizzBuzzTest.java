package easy;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

import java.util.List;
import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class FizzBuzzTest {
  FizzBuzz instance = new FizzBuzz();

  @ParameterizedTest
  @MethodSource("fixtureMethod")
  public void testFizzBuzz(int candidate, List<String> expected) {
    List<String> result = instance.solve(candidate);
    assertArrayEquals(expected.toArray(), result.toArray());
  }

  private static Stream<Arguments> fixtureMethod() {
    return Stream.of(
        Arguments.of(
            5,
            // spotless:off
            List.of("1", "2", "Fizz", "4", "Buzz")
            // spotless:on
            ),
        Arguments.of(
            3,
            // spotless:off
            List.of("1", "2", "Fizz")
            // spotless:on
            ),
        Arguments.of(
            16,
            // spotless:off
            List.of("1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz","16")
            // spotless:on
            ),
        Arguments.of(
            15,
            // spotless:off
            List.of("1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14", "FizzBuzz")
            // spotless:on
            ),
        Arguments.of(
            35,
            // spotless:off
            List.of("1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz","16","17","Fizz","19","Buzz","Fizz","22","23","Fizz","Buzz","26","Fizz","28","29","FizzBuzz","31","32","Fizz","34","Buzz")
            // spotless:on
            ));
  }
}
