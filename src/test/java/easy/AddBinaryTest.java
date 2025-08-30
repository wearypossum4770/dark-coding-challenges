package easy;

import static org.junit.jupiter.api.Assertions.*;

import java.util.stream.Stream;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class AddBinaryTest {
  AddBinary instance = new AddBinary();

  @ParameterizedTest
  @MethodSource("dataAddBinary")
  public void testAddBinary(String a, String b, String expected) {

    String result = instance.solve(a, b);

    assertEquals(expected, result);
  }

  public static Stream<Arguments> dataAddBinary() {
    return Stream.of(Arguments.of("11", "1", "100"), Arguments.of("1010", "1011", "10101"));
  }
}
