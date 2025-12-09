package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class CountStudentsTest {
  CountStudents instance = new CountStudents();

  @ParameterizedTest
  @MethodSource("dataCountStudents")
  public void testCountStudents(int[] students, int[] sandwiches, int expected) {

    int result = instance.solve(students, sandwiches);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataCountStudents() {
    return Stream.of(
        Arguments.of(new int[] {1, 1, 0, 0}, new int[] {0, 1, 0, 1}, 0),
        Arguments.of(new int[] {1, 1, 1, 0, 0, 1}, new int[] {1, 0, 0, 0, 1, 1}, 3),
        Arguments.of(new int[] {0, 0, 0}, new int[] {0, 0, 0}, 0),
        Arguments.of(new int[] {1, 1, 1}, new int[] {1, 1, 1}, 0),
        Arguments.of(new int[] {1, 0, 1, 0}, new int[] {1, 0, 1, 0}, 0),
        Arguments.of(new int[] {0, 1, 0, 1}, new int[] {1, 0, 1, 0}, 0),
        Arguments.of(new int[] {1}, new int[] {0}, 1),
        Arguments.of(new int[] {0}, new int[] {1}, 1),
        Arguments.of(new int[] {0}, new int[] {0}, 0),
        Arguments.of(new int[] {1}, new int[] {1}, 0),
        Arguments.of(new int[] {0, 1, 0, 1, 1, 0}, new int[] {1, 1, 0, 0, 0, 1}, 0),
        Arguments.of(new int[] {1, 1, 1, 1, 1}, new int[] {0, 0, 0, 0, 0}, 5),
        Arguments.of(new int[] {0, 0, 0, 0, 0}, new int[] {1, 1, 1, 1, 1}, 5));
  }
}
