package easy;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

public class ArmstrongNumbersTest {
  private final ArmstrongNumbers instance = new ArmstrongNumbers();

  @ParameterizedTest
  @ValueSource(
      ints = {
        2, 0, 9926315, 93084, 548834, 153, 407, 370, 371, 1634, 8208, 9474,
      })
  public void testValidArmstrongNumbers(int num) {
    int result = instance.solve(num);
    assertEquals(1, result);
  }

  @ParameterizedTest
  @ValueSource(
      ints = {
        89,
        39,
        555,
        9475,
        2147483647,
        365,
        120,
        1253,
        -153,
      })
  public void testInvalidArmstrongNumbers(int num) {
    int result = instance.solve(num);
    assertEquals(0, result);
  }
}
